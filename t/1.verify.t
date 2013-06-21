use strict;
#use warnings;

use Test::More qw(no_plan);

my @opv = qw(bin/opv);

system('cat t/data/pub/test0@example.org t/data/pub/test1@example.org > t/data/keyrings/test0,test1')
    and die;

#$ENV{GNUPGHOME} = "tmp";

is  (v('pub/test0@example.org', 'test0'), 0);
isnt(v('pub/test0@example.org', 'test1'), 0);
isnt(v('pub/test1@example.org', 'test0'), 0);
is  (v('pub/test1@example.org', 'test1'), 0);
is  (v('keyrings/test0,test1',  'test0'), 0);
is  (v('keyrings/test0,test1',  'test1'), 0);

sub v {
    my ($ring, $sig) = @_;

    if (fork) {
        wait;
        return ($? >> 8);
    }
    else {
        open(STDERR, ">", "/dev/null") or die "open: $!: /dev/null";
        exec(@opv, "t/data/$ring", "t/data/content/textfile",
                  "t/data/signatures/textfile.asc.${sig}");
        exit;
    }
}

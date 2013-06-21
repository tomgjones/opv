use ExtUtils::MakeMaker;
WriteMakefile(
    NAME      => 'opv',
    VERSION   => '0.1',
    ABSTRACT  => 'Check content against OpenPGP signatures',
    AUTHOR    => 'Tom Jones <tom.jones@bccx.com>',
    EXE_FILES => [ glob('bin/*') ],
    MAN1PODS  => {
	'doc/opv.pod' => 'blib/man1/opv.1',
	'doc/opv.git.pod' => 'blib/man1/opv.git.1',
    },
);

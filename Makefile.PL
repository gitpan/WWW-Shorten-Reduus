use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WWW::Shorten::Reduus',
    AUTHOR              => 'Jordan M. Adler <JMADLER@cpan.org>',
    VERSION_FROM        => 'lib/WWW/Shorten/Reduus.pm',
    ABSTRACT_FROM       => 'lib/WWW/Shorten/Reduus.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'WWW::Shorten' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW-Shorten-Reduus-*' },
);

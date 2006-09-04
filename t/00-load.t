#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'WWW::Shorten::Reduus' );
}

diag( "Testing WWW::Shorten::Reduus $WWW::Shorten::Reduus::VERSION, Perl $], $^X" );

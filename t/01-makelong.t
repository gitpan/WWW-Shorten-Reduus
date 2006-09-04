#!perl -T

use Test::More tests => 1;
use WWW::Shorten 'Reduus';

my $long = makealongerlink('http://wpx6w.redu.us/');
is($long, 'http://google.com/');

#!perl -T

use Test::More tests => 1;
use WWW::Shorten 'Reduus';

my $short = makeashorterlink('http://google.com/');
like($short, qr{http://.+\.redu\.us/?}, 'does the short link look like it\'s from reduus?');

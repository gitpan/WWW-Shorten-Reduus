package WWW::Shorten::Reduus;

use warnings;
use strict;
use WWW::Shorten::generic;
use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );

=head1 NAME

WWW::Shorten::Reduus - Perl interface to redu.us

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This is a perl interface for the website redu.us, which shortens urls.

    use WWW::Shorten 'Reduus';
    my $short = makeashorterlink($some_long_url);
    my $long = makealongerlink($reduus_url);

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 makeashorterlink

Takes a url to shorten, returns the proper short redu.us url 
in qr{http://.+.redu.us/} format, or undef on failure

=cut

sub makeashorterlink {
    my $url = shift;
    my $ua = __PACKAGE__->ua();
    my $res = $ua->get('http://redu.us?url='.$url);
    my $content = $res->content;
    if ($content =~ m{Successfully added <a href="([^"]+)">}i) {
        return $1;
    } else {
        return;
    }
}

=head2 makealongerlink

Takes a redu.us short url, and determines the corresponding full url

=cut 

sub makealongerlink {
    my $tinyurl_url = shift;
    my $ua = __PACKAGE__->ua();
    $tinyurl_url = "http://$tinyurl_url.redu.us/"
        unless $tinyurl_url =~ m!^http://!i;
    my $res = $ua->get($tinyurl_url);
    return unless $res->is_redirect;
    my $url = $res->header('Location');
    return $url;
}

=head1 AUTHOR

Jordan M. Adler, C<< <JMADLER at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-www-shorten-reduus at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Shorten-Reduus>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Shorten::Reduus

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Shorten-Reduus>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Shorten-Reduus>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Shorten-Reduus>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Shorten-Reduus>

=back

=head1 SEE ALSO

L<WWW::Shorten>

=head1 ACKNOWLEDGEMENTS

Adam, for making redu.us

Iain Truskett and Dave Cross for their work on WWW::Shorten

=head1 COPYRIGHT & LICENSE

Copyright 2006 Jordan M. Adler, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of WWW::Shorten::Reduus

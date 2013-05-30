package Dist::Zilla::Plugin::Author::Plicease::Inc;

use strict;
use warnings;
use File::Spec;

our $VERSION = '0.96'; # VERSION
# ABSTRACT: Include the inc directory to find plugins

use lib File::Spec->catdir(File::Spec->curdir(), 'inc');

sub log_debug { 1 }
sub plugin_name { 'Author::Plicease::Inc' }
sub dump_config { return; }
sub register_component { return; }

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::Inc - Include the inc directory to find plugins

=head1 VERSION

version 0.96

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

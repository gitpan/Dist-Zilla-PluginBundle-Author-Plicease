package Dist::Zilla::Plugin::Author::Plicease::FiveEight;

use Moose;

with 'Dist::Zilla::Role::BeforeRelease';

# ABSTRACT: Don't release on old perls
our $VERSION = '1.49'; # VERSION

sub before_release
{
  my $self = shift;
  $self->log_fatal('release requires Perl 5.10 or better') if $] < 5.010000;
  $self->log_fatal('don\'t release via MSWin32')           if $^O eq 'MSWin32';
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::FiveEight - Don't release on old perls

=head1 VERSION

version 1.49

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

package Dist::Zilla::Plugin::Author::Plicease::SpecialPrereqs;

use strict;
use warnings;
use Moose;

# ABSTRACT: Special prereq handling
our $VERSION = '1.62'; # VERSION


with 'Dist::Zilla::Role::PrereqSource';

my %upgrades = qw(
  Moo                                   1.001000
  PerlX::Maybe                          0.003
  File::HomeDir                         0.91
  AnyEvent::Open3::Simple               0.76
  Path::Class                           0.26
  Mojolicious                           4.31
  Role::Tiny                            1.003001
);

sub register_prereqs
{
  my($self) = @_;

  my $prereqs = $self->zilla->prereqs->as_string_hash;
  foreach my $phase (keys %$prereqs)
  {
    foreach my $type (keys %{ $prereqs->{$phase} })
    {
      foreach my $module (sort keys %{ $prereqs->{$phase}->{$type} })
      {
        my $value = $prereqs->{$phase}->{$type}->{$module};
        next unless $value == 0;
        if($upgrades{$module})
        {
          $self->zilla->register_prereqs({
            type  => $type,
            phase => $phase,
          }, $module => $upgrades{$module} );
        }
      }
    }
  }
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::SpecialPrereqs - Special prereq handling

=head1 VERSION

version 1.62

=head1 SYNOPSIS

 [Author::Plicease::SpecialPrereqs]

=head1 DESCRIPTION

Some older versions of modules have problematic for various
reasons (at least in the context of how I use them).  This
plugin will upgrade those prereqs to appropriate version
they are C<0>, meaning any version.

=over 4

=item Moo

Require 1.001000, which allows for non-ref defaults.  Later
this may be upgraded to 2.x if fatal warnings are removed
as promised.

=item PerlX::Maybe

Require 0.003

=item File::HomeDir

Require 0.91 for File::HomeDir::Test

=item AnyEvent::Open3::Simple

Require 0.76 for new stdin style

=item Path::Class

Require 0.26 for spew

=item Mojolicious

Require 4.31

=item Role::Tiny

Require 1.003001.  See rt#83248

=back

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

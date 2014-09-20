package Dist::Zilla::Plugin::Author::Plicease::Recommend;

use strict;
use warnings;
use Moose;

# ABSTRACT: make some obvious recommendations
our $VERSION = '1.55'; # VERSION

with 'Dist::Zilla::Role::PrereqSource';

sub register_prereqs
{
  my($self) = @_;

  my $prereqs = $self->zilla->prereqs->as_string_hash;
  foreach my $phase (keys %$prereqs)
  {
    foreach my $type (keys %{ $prereqs->{$phase} })
    {
      foreach my $module (keys %{ $prereqs->{$phase}->{$type} })
      {
        if($module =~ /^(JSON|YAML|PerlX::Maybe)$/)
        {
          $self->zilla->register_prereqs({
            type  => 'recommends',
            phase => $phase,
          }, join('::', $module, 'XS') => 0 );
        }
        my($first) = split /::/, $module;
        if($first =~ /^(AnyEvent|Mojo|Mojolicious)$/)
        {
          $self->zilla->register_prereqs({
            type  => 'recommends',
            phase => $phase,
          }, EV => 0);
        }
      }
    }
  }
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::Recommend - make some obvious recommendations

=head1 VERSION

version 1.55

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

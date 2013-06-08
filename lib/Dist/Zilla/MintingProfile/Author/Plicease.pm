package Dist::Zilla::MintingProfile::Author::Plicease;

use Moose;
use v5.10;

# ABSTRACT: Minting profile for Plicease
our $VERSION = '1.01'; # VERSION


with qw( Dist::Zilla::Role::MintingProfile::ShareDir );

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Dist::Zilla::MintingProfile::Author::Plicease - Minting profile for Plicease

=head1 VERSION

version 1.01

=head1 SYNOPSIS

 dzil new -P Author::Plicease Module::Name

=head1 DESCRIPTION

This is the normal minting profile used by Plicease.

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

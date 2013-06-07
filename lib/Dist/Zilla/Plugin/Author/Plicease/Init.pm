package Dist::Zilla::Plugin::Author::Plicease::Init;

use Moose;
use v5.10;

# ABSTRACT: Dist::Zilla initialization tasks for Plicease
our $VERSION = '1.00'; # VERSION


with 'Dist::Zilla::Role::AfterMint';

use namespace::autoclean;

sub after_mint
{
  my($self, $opts) = @_;
  my $git = Git::Wrapper->new($opts->{mint_root});
  $git->push('origin', 'master');
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::Init - Dist::Zilla initialization tasks for Plicease

=head1 VERSION

version 1.00

=head1 SYNOPSIS

in your profile.ini:

 [Author::Plicease::Init]

=head1 DESCRIPTION

This will:

=over 4

=item *

git push origin master

=back

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

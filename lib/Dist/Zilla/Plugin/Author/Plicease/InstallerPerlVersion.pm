package Dist::Zilla::Plugin::Author::Plicease::InstallerPerlVersion;

use strict;
use warnings;
use Moose;

# ABSTRACT: Make Makefile.PL and Build.PL exit instead of die on Perl version mismatch
our $VERSION = '1.62'; # VERSION


with 'Dist::Zilla::Role::InstallTool';

sub setup_installer
{
  my($self) = @_;
  
  my $prereqs = $self->zilla->prereqs->as_string_hash;
  
  my $perl_version = $prereqs->{runtime}->{requires}->{perl};
  
  $self->log("perl version required = $perl_version");
  
  foreach my $file (grep { $_->name =~ /^(Makefile\.PL|Build\.PL)$/ } @{ $self->zilla->files })
  {
    my $content = $file->content;
    $content = join "\n", 
      "BEGIN {",
      "  unless(eval q{ use $perl_version; 1}) {",
      "    print \"Perl $perl_version or better required\\n\";",
      "    exit;",
      "  }",
      "}",
      $content;
    $file->content($content);
  }
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::InstallerPerlVersion - Make Makefile.PL and Build.PL exit instead of die on Perl version mismatch

=head1 VERSION

version 1.62

=head1 SYNOPSIS

 [Author::Plicease::InstallerPerlVersion]

=head1

This adds a preface to your C<Makefile.PL> or C<Build.PL> to
test the Perl version in a way that will not throw an exception,
instead calling exit, so that they will not be reported on
cpantesters as failures.  This plugin should be the last
L<Dist::Zilla::Role::InstallTool> plugin in your C<dist.ini>.

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

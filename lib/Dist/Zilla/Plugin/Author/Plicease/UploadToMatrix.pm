package Dist::Zilla::Plugin::Author::Plicease::UploadToMatrix;

use Moose;
use v5.10;

# ABSTRACT: Upload dist to matrix
our $VERSION = '1.02'; # VERSION

with 'Dist::Zilla::Role::AfterRelease';

use namespace::autoclean;

sub after_release
{
  my($self, $archive) = @_;
  use autodie qw( :system );
  my @cmd = ('scp', '-q', $archive, 'ollisg@matrix.wdlabs.com:web/sites/dist');
  $self->zilla->log("% @cmd");
  eval { system @cmd };
  if(my $error = $@)
  {
    $self->zilla->log("NOTE SCP FAILED: $error");
    $self->zilla->log("manual upload will be required");
  }
  else
  {
    $self->zilla->log("download URL: http://dist.wdlabs.com/$archive");
  } 
}

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::UploadToMatrix - Upload dist to matrix

=head1 VERSION

version 1.02

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

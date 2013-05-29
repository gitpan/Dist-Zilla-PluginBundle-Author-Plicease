package Dist::Zilla::Plugin::Author::Plicease::UploadToCPAN;

use Moose;
use v5.10;

# ABSTRACT: Upload dist to CPAN
our $VERSION = '0.95'; # VERSION

extends 'Dist::Zilla::Plugin::UploadToCPAN';

around release => sub {
  my $orig = shift;
  my $self = shift;
  
  eval { $self->$orig(@_) };
  if(my $error = $@)
  {
    $self->zilla->log("error uploading to cpan: $error");
    $self->zilla->log("you will have to manually upload the dist");
  }
  
  return;
};

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::UploadToCPAN - Upload dist to CPAN

=head1 VERSION

version 0.95

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

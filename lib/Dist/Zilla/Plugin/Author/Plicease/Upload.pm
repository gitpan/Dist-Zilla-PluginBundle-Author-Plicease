package Dist::Zilla::Plugin::Author::Plicease::Upload;

use Moose;

# ABSTRACT: Upload dist to CPAN
our $VERSION = '1.62'; # VERSION

extends 'Dist::Zilla::Plugin::UploadToCPAN';

has cpan => (
  is      => 'ro',
  default => sub { 1 },
);

around release => sub {
  my $orig = shift;
  my $self = shift;
  
  if($self->cpan && $self->zilla->chrome->prompt_yn("upload to CPAN?"))
  {
    eval { $self->$orig(@_) };
    if(my $error = $@)
    {
      $self->zilla->log("error uploading to cpan: $error");
      $self->zilla->log("you will have to manually upload the dist");
    }
  }
  else
  {
    my($archive) = @_;
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
  
  return;
};

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::Upload - Upload dist to CPAN

=head1 VERSION

version 1.62

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

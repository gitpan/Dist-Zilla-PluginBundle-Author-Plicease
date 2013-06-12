package Dist::Zilla::Plugin::Author::Plicease::TransformTravis;

use Moose;
with 'Dist::Zilla::Role::FileGatherer';
use YAML::XS qw( Dump LoadFile );

use namespace::autoclean;

sub gather_files
{
  my($self) = @_;
  
  my $source_filename = $self->zilla->root->file('.travis.yml');
  return unless -r $source_filename;
  
  my $file = Dist::Zilla::File::FromCode->new(
    name    => '.travis.yml',
    code    => sub {
      my($build) = grep { $_->name =~ /^(Makefile|Build)\.PL$/ } @{ $self->zilla->files };
      $self->log_fatal("need at least one of Makefile.PL or Build.PL")
        unless defined $build;
      $self->log("transforming .travis.yml");

      my $data = LoadFile($source_filename->stringify);
  
      if($build->name eq 'Build.PL')
      {
        $data->{install} = "perl Build.PL && ./Build installdeps";
      }
      else
      {
        $data->{install} = "perl Makefile.PL && make installdeps";
      }
      Dump($data),
    },
  );
  $self->add_file($file);
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::TransformTravis

=head1 VERSION

version 1.03

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

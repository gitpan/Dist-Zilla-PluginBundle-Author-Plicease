package Dist::Zilla::Plugin::Author::Plicease::MarkDownCleanup;

# TODO: this or parts of this may no longer be necessary as of
# Pod::Markdown 1.400

use strict;
use warnings;
use Moose;

# ABSTRACT: add a travis status button to the README.md file
our $VERSION = '1.62'; # VERSION


with 'Dist::Zilla::Role::AfterBuild';

has travis_status => (
  is => 'ro',
);

sub after_build
{
  my($self) = @_;
  my $readme = $self->zilla->root->file("README.md");
  if(-r $readme)
  {
    my $name = $self->zilla->root->absolute->basename;
    my $status = $self->travis_status ? " [![Build Status](https://secure.travis-ci.org/plicease/$name.png)](http://travis-ci.org/plicease/$name)" : "";
    my $content = $readme->slurp;
    $content =~ s{# NAME\s+(.*?) - (.*?#)}{# $1$status\n\n$2}s;
    $content =~ s{# VERSION\s+version (\d+\.|)\d+\.\d+(\\_\d+|)\s+#}{#};
    # do this twice because the pattern may overlap
    # TODO: this is not actually enough I think a fix to Pod::Markdown
    # or using a different converter all together may be required
    $content =~ s{^(    .*\n    [ \t]*\n)\n(    )}{$1$2}mg;
    $content =~ s{^(    .*\n    [ \t]*\n)\n(    )}{$1$2}mg;
    $readme->spew($content);
  }
  else
  {
    $self->log("no README.md found");
  }
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Dist::Zilla::Plugin::Author::Plicease::MarkDownCleanup - add a travis status button to the README.md file

=head1 VERSION

version 1.62

=head1 SYNOPSIS

 [Author::Plicease::TravisStatus]

=head1 AUTHOR

Graham Ollis <perl@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

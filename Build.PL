
# This file was automatically generated by Dist::Zilla::Plugin::ModuleBuild v5.029.
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use My::ModuleBuild;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601",
    "perl" => "5.006"
  },
  "dist_abstract" => "Dist::Zilla plugin bundle used by Plicease",
  "dist_author" => [
    "Graham Ollis <perl\@cpan.org>"
  ],
  "dist_name" => "Dist-Zilla-PluginBundle-Author-Plicease",
  "dist_version" => "1.62",
  "license" => "perl",
  "module_name" => "Dist::Zilla::PluginBundle::Author::Plicease",
  "recommends" => {
    "PerlX::Maybe::XS" => 0,
    "YAML::XS" => 0
  },
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla" => "5.020",
    "Dist::Zilla::Plugin::AutoMetaResources" => "1.20",
    "Dist::Zilla::Plugin::CopyFilesFromBuild" => 0,
    "Dist::Zilla::Plugin::InstallGuide" => "1.200003",
    "Dist::Zilla::Plugin::MinimumPerl" => "1.003",
    "Dist::Zilla::Plugin::OurPkgVersion" => "0.005001",
    "Dist::Zilla::Plugin::PodWeaver" => "4.006",
    "Dist::Zilla::Plugin::ReadmeAnyFromPod" => "0.142470",
    "Dist::Zilla::Plugin::Run::BeforeBuild" => "0.026",
    "File::chdir" => 0,
    "IPC::System::Simple" => "1.25",
    "JSON::PP" => 0,
    "Moose" => 0,
    "Path::Class" => "0.31",
    "PerlX::Maybe" => "0.003",
    "Test::Fixme" => "0.14",
    "Test::Pod" => "1.44",
    "Test::Pod::Coverage" => "1.08",
    "Test::Version" => "1.002001",
    "YAML" => 0,
    "autodie" => 0,
    "namespace::autoclean" => 0,
    "perl" => "5.008001"
  },
  "script_files" => [],
  "share_dir" => {
    "module" => {
      "Dist::Zilla::MintingProfile::Author::Plicease" => "profiles"
    }
  },
  "test_requires" => {
    "Test::More" => "0.94",
    "perl" => "5.008001"
  }
);


my %fallback_build_requires = (
  "Module::Build" => "0.3601",
  "Test::More" => "0.94",
  "perl" => "5.008001"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = My::ModuleBuild->new(%module_build_args);

$build->create_build_script;

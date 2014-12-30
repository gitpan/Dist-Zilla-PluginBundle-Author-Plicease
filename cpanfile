requires "Dist::Zilla" => "5.020";
requires "Dist::Zilla::Plugin::AutoMetaResources" => "1.20";
requires "Dist::Zilla::Plugin::CopyFilesFromBuild" => "0";
requires "Dist::Zilla::Plugin::InstallGuide" => "1.200003";
requires "Dist::Zilla::Plugin::MinimumPerl" => "1.003";
requires "Dist::Zilla::Plugin::OurPkgVersion" => "0.005001";
requires "Dist::Zilla::Plugin::PodWeaver" => "4.006";
requires "Dist::Zilla::Plugin::ReadmeAnyFromPod" => "0.142470";
requires "Dist::Zilla::Plugin::Run::BeforeBuild" => "0.026";
requires "File::chdir" => "0";
requires "IPC::System::Simple" => "1.25";
requires "JSON::PP" => "0";
requires "Moose" => "0";
requires "Path::Class" => "0.31";
requires "PerlX::Maybe" => "0.003";
requires "Test::Fixme" => "0.14";
requires "Test::Pod" => "1.44";
requires "Test::Pod::Coverage" => "1.08";
requires "Test::Version" => "1.002001";
requires "YAML" => "0";
requires "autodie" => "0";
requires "namespace::autoclean" => "0";
requires "perl" => "5.008001";
recommends "PerlX::Maybe::XS" => "0";
recommends "YAML::XS" => "0";

on 'build' => sub {
  requires "Module::Build" => "0.3601";
};

on 'test' => sub {
  requires "Test::More" => "0.94";
  requires "perl" => "5.008001";
};

on 'configure' => sub {
  requires "Module::Build" => "0.3601";
  requires "perl" => "5.006";
};

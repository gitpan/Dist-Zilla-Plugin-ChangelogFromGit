
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Write a Changes file from a project's git log.",
  "AUTHOR" => "Rocco Caputo <rcaputo\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-ChangelogFromGit",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Zilla::Plugin::ChangelogFromGit",
  "PREREQ_PM" => {
    "DateTime" => "1.03",
    "DateTime::Infinite" => "1.03",
    "Dist::Zilla::Role::FileGatherer" => "4.300035",
    "Git::Repository::Log::Iterator" => "1.307",
    "IPC::Cmd" => "0.82",
    "Moose" => "2.1005",
    "Moose::Autobox" => "0.13",
    "Software::Release" => "0.03",
    "Software::Release::Change" => "0.03",
    "Text::Wrap" => "2013.0523"
  },
  "TEST_REQUIRES" => {
    "Carp" => "1.26",
    "Scalar::Util" => "1.29",
    "Test::More" => "0.98",
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.015",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




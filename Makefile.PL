
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::ChangelogFromGit',
                       'DISTNAME' => 'Dist-Zilla-Plugin-ChangelogFromGit',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Rocco Caputo <rcaputo@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Build a Changes file from a project\'s git log.',
                       'EXE_FILES' => [],
                       'VERSION' => '0.002',
                       'PREREQ_PM' => {
                                        'Text::Wrap' => '2006.1117'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);





use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Convert time distance to words.',
  'AUTHOR' => 'Kang-min Liu <gugod@gugod.org>',
  'BUILD_REQUIRES' => {
    'FindBin' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Time-Verbal',
  'EXE_FILES' => [],
  'LICENSE' => 'mit',
  'NAME' => 'Time::Verbal',
  'PREREQ_PM' => {
    'File::Spec' => '0',
    'Locale::Wolowitz' => '0',
    'Object::Tiny' => '0',
    'encoding' => '0'
  },
  'VERSION' => '1.0.0',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


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




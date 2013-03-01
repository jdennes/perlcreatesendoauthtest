use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'app.pl',
  VERSION      => '1.0',
  AUTHOR       => 'James Dennes <jdennes@gmail.com>',
  EXE_FILES    => ['app.pl'],
  PREREQ_PM    => {'Mojolicious' => '2.0'},
  test         => {TESTS => 't/*.t'},
  INC          => '-I./lib'
);

# author    jdennes@gmail.com
# 
# all_from  lib/Net/CampaignMonitor.pm
# 
# requires  MIME::Base64    3.13
# requires  REST::Client    171
# requires  XML::Simple     2.18
# requires  JSON            2.27
# requires  LWP::UserAgent  5.835
# requires  Carp            1.11
# requires  Params::Util    1.01
# requires  Mojolicious     2.0
# 
# exe_files app.pl
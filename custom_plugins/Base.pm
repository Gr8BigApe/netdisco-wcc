package App::Netdisco::SSHCollector::Platform::Base;

use strict;
use warnings;

sub new {
    my $class = shift;
    return bless {}, $class;
}

1;

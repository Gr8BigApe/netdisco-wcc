package App::Netdisco::SSHCollector::Platform::PaloAlto;

use strict;
use warnings;
use base 'App::Netdisco::SSHCollector::Platform::Base';

sub arp {
    my ($self, $ssh, @args) = @_;
    my @output = $ssh->capture("show arp all");

    return [] unless @output;

    my @entries;
    foreach my $line (@output) {
        next unless $line =~ /^\s*(\d{1,3}(?:\.\d{1,3}){3})\s+([\da-f]{2}(?::[\da-f]{2}){5})\s+/i;
        push @entries, {
            ip  => $1,
            mac => $2,
        };
    }

    return \@entries;
}

1;


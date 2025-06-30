package SNMP::Info::Layer3::PaloAlto;

use strict;
use warnings;
use base qw(SNMP::Info::Layer3);

use Exporter;
our @EXPORT_OK = ();

our $VERSION = '0.01';

sub vendor { 'paloalto' }

sub os { 'panos' }

sub os_ver {
    my $self = shift;
    return $self->description() =~ /Version (\S+)/ ? $1 : undef;
}

sub model {
    my $self = shift;
    return $self->id() =~ /\.([\dA-F]+)$/i ? $1 : $self->id();
}

1;

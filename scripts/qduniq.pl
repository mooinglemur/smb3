#!/usr/bin/perl

use warnings;
use strict;

my %d;

while (my $line = <>) {
	chomp $line;
	my @w = split(/\s+/, $line);
	for my $w (@w) {
		if ($w !~ /^\./) {
			$w =~ s/,//g;
			$d{$w} = 1;
		}
	}
}

my $l = 0;

for my $d (sort keys %d) {
	if ($l == 0) {
		print "\n.export ";
	} else {
		print ", "
	}
	print $d;
	$l += length($d);
	if ($l > 70) {
		$l = 0;
	}
}

print "\n";

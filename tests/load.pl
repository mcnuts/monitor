#!/usr/bin/perl
use Unix::Uptime;

# Load Average
my ($load1, $load5, $load15) = Unix::Uptime->load();
print "load of passed minute $load1\n";
print "load of passed 5 minutes $load5\n";
print "load of passed 15 minutes $load15\n";


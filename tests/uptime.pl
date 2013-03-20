#!/usr/bin/perl -w
use Sys::Load "uptime";

if (int uptime() < 86400){
	print "0\n";
    }
else{
	print "1\n";
    }


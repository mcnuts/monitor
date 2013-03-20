#!/usr/bin/perl -w
use Sys::Load "uptime";
use Time::Piece;

if (int uptime() < 86400){
	$uptime = 0;
    }
else{
	$uptime = 1;
    }
my $date = Time::Piece->new->strftime('%d/%m/%Y');

#!/usr/bin/perl

use Net::Ping;

$my_addr = "10.14.14.1";
@hostname = qw# jolene bella ruby susie #;
foreach $client ('10.14.14.18', '10.14.14.14', '10.14.14.22', '10.8.12.14')
	{
		$p = Net::Ping->new("icmp");
		$p->bind($my_addr);
    		{
			$a = shift(@hostname);
        		print "$a is ";
        		print "NOT " unless $p->ping($client, 1);
        		print "reachable.\n";
        		sleep(1);
		}
		$p->close();
	}


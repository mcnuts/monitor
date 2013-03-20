#!/usr/bin/perl

use Net::Ping;
use DBI;

$username = 'root';$password = 'U76138z123';$database = 'lieutenant';$hostname = 'localhost';
$dbh = DBI->connect("dbi:mysql:database=$database;" .
 "host=$hostname;port=3306", $username, $password);

$SQL= "select ip, name from servers";

$Select = $dbh->prepare($SQL);
$Select->execute();

$charlie = $dbh->selectrow_array("select ip from servers where name='charlie'");

while($Row=$Select->fetchrow_hashref)
{
  $client = "$Row->{ip}";
	$my_addr = "$charlie";
	@hostname = $Row->{name};
	foreach ($client)
        	{
                	$p = Net::Ping->new("icmp");
                	$p->bind($my_addr);
                	{
                		if ($p->ping($client, 1)) { $ping = 1; } else { $ping = 0; }
			}
                	$p->close();
        	}

}

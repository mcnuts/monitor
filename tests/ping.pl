#!/usr/bin/perl

use Net::Ping;
use DBI;

$username = 'root';$password = '#';$database = 'monitor';$hostname = 'localhost';
$dbh = DBI->connect("dbi:mysql:database=$database;" .
 "host=$hostname;port=3306", $username, $password);

$SQL= "select ip, name from servers";

$Select = $dbh->prepare($SQL);
$Select->execute();

$charlie = $dbh->selectrow_array("select ip from servers where name='charlie'");

while($Row=$Select->fetchrow_hashref)
{
  @client = "$Row->{ip}";

        $my_addr = "$charlie";
        @hostname = $Row->{name};
        foreach (@client)
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

}

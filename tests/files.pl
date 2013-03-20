#!/usr/bin/perl -w 
#use diagnostics;
use Digest::MD5 qw(md5 md5_hex md5_base64);
use DBI;

$username = 'root';$password = '';$database = 'lieutenant';$hostname = 'localhost';
$dbh = DBI->connect("dbi:mysql:database=$database;" .
 "host=$hostname;port=3306", $username, $password);

$SQL= "select filename from file_changes where active='1'";

$Select_file = $dbh->prepare($SQL);
$Select_file->execute();

while($Row=$Select_file->fetchrow_hashref)
{
	$file = $Row->{filename};
		foreach ($file)
			{	
				$new_md5 = md5_hex($file); 
					{
						print "$new_md5\n";
					}
			}
}


<?php

$host 		= "172.16.94.130";
$username 	= "root";
$password 	= "root";

$con = mysql_connect($host, $username, $password);
if (!$con)
	die('Could not connect: ' . mysql_error());
mysql_select_db("clickr", $con);

$q = mysql_query("SELECT * FROM FRquestions");
while ($e=mysql_fetch_assoc($q)) 
	$output[] = $e;

print(json_encode($output));

mysql_close($con);
?>
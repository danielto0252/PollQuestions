<?php

$host = 'localhost';
$username = 'root';
$password = 'root';
$db = 'clickr';

$con = mysql_connect($host, $username, $password);
if (!$con)
	die('Could not connect: ' . mysql_error());
//echo 'Connected Successfully';

mysql_select_db($db);
$result = mysql_query("SELECT * FROM FRquestions");

while($row = mysql_fetch_array($result))
	$output[] = $row;
print(json_encode($output));
mysql_close($con);
?>

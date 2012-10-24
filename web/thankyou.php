<!DOCTYPE html>
<head>
	<title>Thank you!</title>
</head>
<body>
	<h1>Thank you!</h1>
	<p>Adding question to database</p>
	<br>
	<a href="/">Home</a>
</body>

<?php

$host 		= "172.16.94.130";
$username 	= "root";
$password 	= "root";

$con = mysql_connect($host, $username, $password);
if (!$con)
	die('Could not connect: ' . mysql_error());
mysql_select_db("clickr", $con);

mysql_query('INSERT INTO FRquestions (Question) values (\'$_POST["question"]\')');
mysql_close($con);
?>

</html>
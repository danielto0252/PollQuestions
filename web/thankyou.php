<!DOCTYPE html>
<head>
	<title>Thank you!</title>
</head>
<body>
	<h1>Thank you!</h1>
	<p>Adding question to database</p>
	<br>
	<a href="/480-project">Home</a>
</body>

<?php

$host = 'localhost';
$username = 'root';
$password = 'root';

$con = mysql_connect($host, $username, $password);
if (!$con)
	die('Could not connect: ' . mysql_error());
mysql_select_db("clickr");


if(isset($_POST['question']))
{
	$selectSQL = "SELECT * FROM FRquestions";

	$results = mysql_query($selectSQL);
	$num_rows = mysql_num_rows($results) + 1;
	$insertSQL = "INSERT INTO FRquestions (Question_num, Question) VALUES ($num_rows,'$_POST[question]')";

	mysql_query($insertSQL);
} else {
	header("Location: /480-project");
}

mysql_close($con);
?>

</html>

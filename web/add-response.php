<?php
	$host = 'localhost';
	$username = 'root';
	$password = 'root';
	$db = 'clickr';

	$con = mysql_connect($host, $username, $password);
	if (!$con)
		die('Could not connect: ' . mysql_error());
	
	mysql_select_db($db);

	$handle = fopen('php://input','r');
	$jsonInput = fgets($handle);
	$decoded = json_decode($jsonInput, true);
	print_r($decoded);
	if($decoded[response]){
	echo $decoded[response];
	echo $decoded[questionId];
	$updateQuery = "UPDATE FRquestions SET Response = '$decoded[response]' WHERE id = '$decoded[questionId]'";
	mysql_query($updateQuery);
	}
	mysql_close($con);
?>

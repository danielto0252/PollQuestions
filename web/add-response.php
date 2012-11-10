<!DOCTYPE>
<html>
	<head>
		<title>Add Response to DB<title>
	</head>
	<?php

		$host = 'localhost';
		$username = 'root';
		$password = 'root';

		$con = mysql_connect($host, $username, $password);
		if (!$con)
			die('Could not connect: ' . mysql_error());
		mysql_select_db("clickr");

		if(isset($_POST['response']))
		{
			$response = $_POST['response'];
			$questionID = $_POST['questionId'];
			print $response;
			print $questionID;
/*
mysql_query("UPDATE Persons SET Age=36
WHERE FirstName='Peter' AND LastName='Griffin'");
*/

			mysql_query($insertSQL);
		} else {
			header("Location: /480-project");
		}

		mysql_close($con);
		?>
	<body>
	</body>
</html>

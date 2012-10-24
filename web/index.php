<!DOCTYPE html>
	<head>
		<title>Clickr | Make a question</title>
		<script type="text/javascript">
			var maxLength=255;
			function charLimit(el) {
			    if (el.value.length > maxLength) return false;
			    return true;
			}
			function characterCount(el) {
			    var charCount = document.getElementById('charCount');
			    if (el.value.length > maxLength) el.value = el.value.substring(0,maxLength);
			    if (charCount) charCount.innerHTML = maxLength - el.value.length;
			    return true;
			}
		</script>
	</head>
	<body>
		<h2>Create a question!!</h2>
		<form action="thankyou.php" method="post">
			<textarea rows="5" cols="50" maxlength="255" autofocus="autofocus" onKeyPress="return charLimit(this)" onKeyUp="return characterCount(this)" name="question"></textarea>
			<p>Characters remain: <strong><span id="charCount">255</span></strong></p>
			<br>
			<input type="submit" value="Submit"/>
		</form>
		
	</body>
</html>
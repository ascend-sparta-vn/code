<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- jPList core -->		

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
<script src="/resources/js/jquery.plugin.js"></script>
<script src="/resources/js/jquery.realperson.js"></script>

<link href="/resources/css/jquery.realperson.css" rel="stylesheet" />
<script>
$(function() {
	getResource(function(){
		$('#defaultReal').realperson();
	});
	
});
</script>
</head>
<body>
<form name="registration" method="POST" action="register" id = "register-form">
	<p><label>Please enter the letters displayed:</label>
	<input type="text" id="defaultReal" name="defaultReal"></p>
	<p style="clear: both;"><label>&nbsp;</label><input type="submit" value="Submit"></p>
</form>
</body>
</html>



<style>
label { display: inline-block; width: 20%; }
.realperson-challenge { display: inline-block }
</style>
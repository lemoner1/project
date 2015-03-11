<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


<style>
	header {
		align : center;
	}
	
</style>
 <link rel="stylesheet" href="style/top.css">
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/JavaScript" src="js/top.js"></script>

<SCRIPT>
function sendData()
{
	$.ajax({
		type: "POST", 
		url: "common/reg.do",
		dataType: "text",
		data: "func=member_008", 
		success: function(text){
			alert("들어오니");
		}
	});
}
</SCRIPT>

</head>
<body>
	<header>
		<div>
			<a href="main.do"><img src="./images/common/logo.png" border="0" width="100" height="100"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="common/product.do"><img src="./images/common/product.png" border="0" width="80" height="80"></a>
			<a href="#"><img src="./images/common/reg.png" border="0" width="80" height="80" onclick="sendData()"></a>
			
			<a href="#"><img src="./images/common/login.png" border="0" width="80" height="80"></a>
			<a href="#"><img src="./images/common/join.png" border="0" width="80" height="80"></a>

		</div>
	</header>
</body>
</html>
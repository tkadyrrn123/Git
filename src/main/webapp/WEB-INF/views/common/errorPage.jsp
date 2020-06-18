<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.img{
	 	filter: brightness(70%);
		width: 100%;
		height: 400px;
	}
	#headcomment{
	position: absolute;
	left: 48%;
	top: 220px;
	color: white;
	font-size: 1.5em;
}
</style>
<body>
	<img class="img" src="resources/images/error.png">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">ERROR!</b>
	<div id="error-container" style="text-align:center;">
		<h1>Error</h1>
		<h2 style="color:red;">${message }</h2>
		<h2 style="color:red;">${requestScope['javax.servlet.error.message'] }</h2>
	</div>
	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
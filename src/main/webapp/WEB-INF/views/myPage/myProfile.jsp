<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/MyPage.css">
<style>
	.myPageUl li:nth-child(4) {
	background-color: #8181F7;
}
	#plus{
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
	}
</style>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">프로필</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
		<ul class="ul">
			<li class="image"><img src="resources/images/Profile.png" width="110px" height="110px"><label id="plusbtn" for="plus">+</label><input type="file" id="plus"></li>
			<li class="top">현재 아파트</li>
			<li>
			<input type="text" class="text">
			<hr>
			</li>
			<li class="top">등급</li>
			<li>
			<input type="text" class="text">
			<hr>
			</li>
			<li class="top">이름</li>
			<li>
			<input type="text" class="text">
			<hr>
			</li>
			<li class="top">동</li>
			<li>
			<input type="text" class="text">
			<hr>
			</li>
			<li class="top">호수</li>
			<li>
			<input type="text" class="text">
			<hr>
			</li>
			<li class="top">휴대전화 번호</li>
			<li>
			<input type="text" class="text"> 
			<hr>
			</li>
			<li class="top">현재 비밀번호</li>
			<li>
			<input type="password" class="text"> 
			<hr>
			</li>
			<li class="top">새 비밀번호</li>
			<li>
			<input type="password" class="text"> 
			<hr>
			</li>
			<li class="top">새 비밀번호 확인</li>
			<li>
			<input type="password" class="text"> 
			<hr>
			</li>
		</ul>
		<input type="submit" value="수정" id="submit" class="button">
		<button type="button" id="cancel" class="button">탈퇴</button>
		<br>
	</div>
</body>
</html>
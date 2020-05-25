<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/MyPage.css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
		<ul class="ul">
			<li class="image"><img src="resources/images/Profile.png" width="110px" height="110px"></li>
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
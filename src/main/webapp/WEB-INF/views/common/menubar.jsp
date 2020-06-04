<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">
<style>
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
	html, body { height:100%; padding: 0; margin: 0;}
	ul, li{padding: 0; margin: 0; list-style-type:none; }
	.menubar{background: rgb(255,255,255,0); width: 80%; height: 8%; margin: 0 auto;
	         border-radius: 30px; line-height: 40px;
	         font-family: 'Nanum Gothic';
	         position: absolute; top: 0px; left: 10%; color:white;
	         }
	.menubar a{float: left; font-family: 'Anton', sans-serif; font-size: 45px; margin-top: 18px;}
	.catelist li{float: left; display: inline-block; text-align: center;}
	.catelist>ul>li:first-child{margin-left: 18px;}
	.dropdown{width: 134px; line-height: 75px;}
	.dropdown:hover label{color: #62B3B6;}
	.sub li{width: 134px; line-height: 50px; text-align: center; cursor: pointer;}
	.sub li:hover{color:white;}
	.user{line-height: 84px;}
	.user li{float:right; width: 40px;}
	.user .fas{font-size: 20px;}
	.user .fas:hover{color: #62B3B6;}
	.on{color: blue;}
	
	a:link { color: white; text-decoration: none;}
	a:visited { color: white; text-decoration: none;}
	a:hover { color: white; text-decoration: none;}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<div class="menubar">
		<a href="#">HOUSTORY</a>
		
		<div class="catelist">
			<ul>
				<li class="dropdown"><label>아파트 소개</label>
					<ul class="sub">
						<li onclick="location.href='welcome.apt'">아파트 정보</li>
						<li onclick="location.href='information.apt'">아파트 위치</li>
						<li>아파트 전경</li>
					</ul>
				</li>
				<li class="dropdown"><label>공지사항</label>
					<ul class="sub">
						<li>공지사항</li>
						<li>?</li>
						<li>?</li>
					</ul>
				</li>
				<li class="dropdown"><label>커뮤니티</label>
					<ul class="sub">
						<li>자유게시판</li>
						<li>중고장터</li>
					</ul>
				</li>
				<li class="dropdown"><label>동호회</label>
					<ul class="sub">
						<li onclick="location.href='clubList.cb'">동호회 목록</li>
						<li>동호회 공지</li>
					</ul>
				</li>
				<li class="dropdown"><label>Q&A</label>
					<ul class="sub">
						<li>1:1 문의</li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div class="user">
			<ul>
				<li><i class="fas fa-cogs"></i></li>
				<li><i class="fas fa-sign-out-alt"></i></li>
				<li><i class="fas fa-user"></i></li>
				<li><i class="fas fa-bell"></i></li>
			</ul>
		</div>
	
	</div>
	<script>
	$(document).ready(function(){  
		
		 $(".sub").hide();
		
		 $(".dropdown").mouseover(function(){
		        $(this).children(".sub").stop().slideDown(200);
		    });
		    $(".dropdown").mouseleave(function(){
		        $(this).children(".sub").stop().slideUp(200);
		    });
	});
	
	</script>
	
</body>
</html>
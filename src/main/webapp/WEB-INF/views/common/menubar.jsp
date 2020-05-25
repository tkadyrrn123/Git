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
<style>
	html, body { height:100%; padding: 0; margin: 0;}
	ul, li{padding: 0; margin: 0; list-style-type:none; }
	.menubar{background: white; width: 80%; height: 8%; margin: 0 auto;
	         border-radius: 30px; line-height: 40px;
	         font-family: 'Nanum Gothic'; font-weight: bold;
	         margin-top: 3%; position: absolute; top: 30px; left: 10%;
	         box-shadow: 0 1px 1px rgba(0,0,0,0.12), 0 2px 2px rgba(0,0,0,0.12), 0 4px 4px rgba(0,0,0,0.12), 0 8px 8px rgba(0,0,0,0.12), 0 16px 16px rgba(0,0,0,0.12);}
	.menubar img{float: left; height: 175%; width: 11%; margin-top: -47px;}
	.catelist li{float: left; display: inline-block; text-align: center;}
	.dropdown{width: 134px; line-height: 84px;}
	.dropdown:hover label{color: #62B3B6;}
	.sub li:nth-child(1){border-top: 2px solid #62B3B6;}
	.sub li{width: 134px; line-height: 50px; text-align: center;
			background: white; border-bottom: 1px solid #dedede; cursor: pointer;}
	.sub li:hover{background: #62B3B6; color:white;}
	.user{line-height: 84px;}
	.user li{float:right; width: 40px;}
	.user .fas{font-size: 20px;}
	.user .fas:hover{color: #62B3B6;}
	
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<div class="menubar">
		<a href="#"><img src="resources/images/로고.png"></a>
		
		<div class="catelist">
			<ul>
				<li class="dropdown"><label>아파트 소개</label>
					<ul class="sub">
						<li>아파트 정보</li>
						<li>아파트 위치</li>
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
						<li>동호회 목록</li>
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

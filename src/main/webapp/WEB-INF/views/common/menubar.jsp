<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
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
	.fas{cursor: pointer;}
	
#socketMsg{
	position: fixed;
    top: 8%;
    width: 20%;
    right: 3%;
    z-index: 5;
}
#msg p{margin: 0; text-align: end;}
#msg p>a{color: #8a6d3b;}

</style>
</head>
<body>
	<div id="socketMsg" class="alert alert-warning alert-dismissible" role="alert" style="display: none;">
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span id="cBtn" aria-hidden="true">&times;</span></button>
	  <div id="msg">
	  	<strong>Warning!</strong> Better check yourself, you're not looking too good.
	  </div>
	</div>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	<div class="menubar">
		<a href="main.do">HOUSTORY</a>
		
		<div class="catelist">
			<ul>
				<li class="dropdown"><label>아파트 소개</label>
					<ul class="sub">
						<li onclick="location.href='welcome.apt'">아파트 정보</li>
						<li onclick="location.href='information.apt'">아파트 위치</li>
					</ul>
				</li>
				<li class="dropdown"><label>공지사항</label>
					<ul class="sub">
						<li onclick="location.href='noticeList.no'">공지사항</li>
						<li onclick="location.href='voteList.vo'">주민투표</li>
					</ul>
				</li>
				<li class="dropdown"><label>커뮤니티</label>
					<ul class="sub">
						<li onclick="location.href='list.fr'">자유게시판</li>
						<li onclick="location.href='market.ma'">중고장터</li>
					</ul>
				</li>
				<li class="dropdown"><label>동호회</label>
					<ul class="sub">
						<li onclick="location.href='clubList.cb'">동호회 목록</li>
						<li onclick="location.href='clubNoticeList.cn'">동호회 공지</li>
					</ul>
				</li>
			</ul>
		</div>
		
		<div class="user">
			<ul>
				<c:if test="${ loginUser.userLevel == 1 }">
					<li><i class="fas fa-sign-out-alt" onclick="location.href='logout.adm'"></i></li>
					<li><i class="fas fa-user" onclick="location.href='myProfile.my'"></i></li>
					<li><i class="fas fa-bell"></i></li>
				</c:if>
				
				<c:if test="${ loginUser.userLevel == 2 }">
					<li><i class="fas fa-sign-out-alt" onclick="location.href='logout.adm'"></i></li>
					<li><i class="fas fa-cogs" onclick="location.href='AptAdminMain.adm'"></i></li>
				</c:if>
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
	
	<!-- 웹소켓  -->
	<script type="text/javascript">
	var socket = null;
	$(document).ready(function(){
		connect();
	});
	
	function connect(){
		var ws = new WebSocket("ws://"+location.host+"/www/Alert");
		socket = ws;
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	    };
	
	    ws.onmessage = function (event) {
	        console.log("Messeage: "+ event.data+'\n');
	        var msg = $('#socketMsg');
	        $('#socketMsg #msg').html(event.data);
	        msg.fadeIn();
	    };
	
	    ws.onclose = function (event) { 
	    	console.log('Info: connection closed.'); 
	    };
	    ws.onerror = function (err) { console.log('Error: ' + err); };
	}
	
	//알림창 닫기   
	$('#socketMsg #cBtn').click(function(){
		$('#socketMsg').fadeOut();
	})
	

	</script>
	
</body>
</html>
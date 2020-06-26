<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

/* 메뉴  */
.slidetoggle ul>li>ul{display: none;}
.slidetoggle ul>li>ul>li{border-bottom: none;}
.slidetoggle ul, .slidetoggle ul{list-style-type: none; padding: 0; margin: 0;}

#top{
	position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 50px;
    background: #3fb574;
    z-index: 1000;
}
#icon{float: right; margin: 15px;}
#icon .fa-sign-out-alt{font-size: 20px; color: white;}
#pagename{
	background: #2f409f;
    height: 100%;
    float: left;
    width: 200px;
    padding: 0 0 0 50px;
    text-align: center;
}
#pagename > a {
	vertical-align: -18px;
    font-size: 20px;
    color: white;
    text-decoration: none;
}
#menuBtn{
	background: url(resources/images/menu-cl.png) 50% 50% no-repeat #22905d;
    width: 50px;
    height: 50px;
    border: 0;
    position: absolute;
    top: 0;
    left: 0;
    text-indent: -999px;
    overflow: hidden;
    cursor: pointer;
}
#pagename{
	background: #2f9f6b;
    height: 100%;
    float: left;
    width: 200px;
    padding: 0 0 0 50px;
    text-align: center;
}
.slide_menu{
	display: none;
    position: fixed;
    top: 50px;
    left: 0px;
    background: #fff;
    height: 100%;
    width: 250px;
    color: white;
    background: #4e905f;
    border-right: 1px solid #dbdbdb;
    -webkit-box-shadow: 2px 0 2px rgba(150, 150, 150, 0.5);
    -moz-box-shadow: 2px 0 2px rgba(150,150,150,0.5);
    box-shadow: 2px 0 2px rgba(150,150,150,0.5);
    z-index: 999;
}
.slide_menu li{text-align: center; line-height: 60px; border-bottom: 1px solid rgb(255,255,255,0.5); cursor: pointer;}
.slide_menu label{cursor: pointer; font-weight: 900; font-size: 15px;}
/* 슬라이드 메뉴 토글클래스 */
.slidetoggle{display: block;}
#icon{cursor: pointer;}
.fa-home{
	color: white;
    font-size: 20px;
    margin-right: 10px;
}
</style>
</head>


<body>
	<div id="top">
		<button id="menuBtn"></button>
		<div id="pagename"><a href="AptAdminMain.adm">ADMINPAGE</a></div>
		<div id="icon">
		<i class="fa fa-home"></i>
		<i class="fas fa-sign-out-alt"></i>
		</div>
	</div>
	
	<div class="slide_menu">
		<ul>
			<li><label>HOME</label></li>
			<li class="dropdown"><label>회원 관리</label>
				<ul class="sub" >
					<li onclick="location.href='AptAdminMemberList.adm'">- 전체 회원 목록</li>
					<li onclick="location.href='AptAdminAcceptList.adm'">- 가입 신청 목록</li>
				</ul>
			</li>
			<li class="dropdown"><label>게시글 관리</label>
				<ul class="sub" >
					<li onclick="location.href='AptBoardList.adm'">- 전체 게시글 목록</li>
				</ul>
			</li>
		</ul>
	</div>


<script>
	$(function(){
		
		 $(".dropdown label").click(function(){
			 var submenu = $(this).next("ul");
	            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            if( submenu.is(":visible") ){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	            }
		 });
	
		
		$('#menuBtn').click(function(){
			$('.slide_menu').toggleClass('slidetoggle');
			$('#container').toggleClass('container_small');
			$('.footer-limiter').toggleClass('container_small');
		});
		
	});
	
	$('.fa-sign-out-alt').click(function(){
		location.href="logout.adm";
	});
	
	$('.fa-home').click(function(){
		location.href="main.do";
	});
</script>	
</body>
</html>
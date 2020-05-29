<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
   #allDiv{width: 60%; height: 1000px; border: 1px lightgray solid; margin-left:40px;}
   #imgDiv{width: 85%; height: 560px;  margin: 0px auto; margin-top: 40px; }
   #aptImg{width: 100%; height: 560px;}


   #allDiv {
       color: #545861;
       font-size: 12px;
       /* letter-spacing: -1px; */
       letter-spacing: 0px !important;
       line-height: 20px;
       word-break: keep-all;
       word-wrap: break-word;
       white-space: normal;
      float: left;
   }

   #menubar{float: left; display: inline-block; width:15%; height: 400px; border: 1px solid #ddd; color: #545861; padding-top:20px;}
   ul{list-style:none;}
   #menubar li{font-size: 30px; height: 70px; font-weight: normal;}
   #menu{width:100%; height: 400px; margin-bottom:100px; background: skyblue;}
   .ment{width:85%; margin: 0px auto;  font-weight: bold; font-family:"고딕체";}
   #ment1{font-size:20px;  color:black; margin-top:20px;}
   #ment2{font-size:20px; color: blue; margin-top:40px;}
   #ment3{font-size:20px; color:black; margin-top:40px; font-family:"고딕체";}
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
	#all{margin-top: 250px;}
</style>


</head>
<body>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<div class="menubar">
		<a href="#"><img src="../images/로고.png"></a>
		
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
	
   <div id="all">
      <!-- 좌측 메뉴 바 -->
      <div id="menubar">
         <ul>
            <li id="hello" onclick="location.href='welcome.bo'">인사말</li>
            <li id="info" onclick="location.href='map.bo'">아파트 정보</li>   
            <li id="pic" onclick="location.href='pic.bo'">단지 전경</li>
         </ul>
      </div>
   
      <div id="allDiv">

      <!-- 아파트 사진   -->
         <div id="imgDiv">
            <img id="aptImg" src="${ pageContext.servletContext.contextPath }/resources/images/02.png"/>
         </div>
         <div>
            <div class="ment" id="ment1">
               스마트 주거의 중심 '래미안 석관' 방문을 환영합니다!
            </div>
            <div class="ment" id="ment2">
               남다른 생활 인프라로 모두가 꿈꾸는 아파트 생활을 만들어가겠습니다.
            </div>
            <div class="ment" >
               <pre id="ment3">
존경하는 입주민 여러분 안녕하십니까!
이번 우리 아파트는 주민들의 편리한 생활을 위해 아파트 관리 페이지를 오픈 하였습니다.

더 투명하고 깨끗한 아파트 관리를 통해 주민들이 살기 좋은 아파트를 만들어가겠습니다.
커뮤니티를 통해 더 새롭고 다얗한 아파트 관리 정보와 주민간의 소통과 교류가 이루어지길 바라며,
살기 좋은 래미안석관이 되겠습니다.

앞으로 아파트 관리 발전을 위해 아낌없는 성원과 지원을 부탁드립니다.
래미안석관을 사랑해주시고 아껴주시는 입주민 여러분, 항상 건강하시고 행복이 가득하시길 바랍니다.
감사합니다.
               </pre>
            </div>
            
         </div>


      </div>
   </div>
</body>

<script>
   
</script>





</html>
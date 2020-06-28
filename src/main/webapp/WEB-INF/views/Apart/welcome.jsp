<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
   #allDiv{width: 60%; height: 1200px; border: 1px lightgray solid; margin: 0px auto;}
   #imgDiv{width: 85%; height: 560px;  margin: 0px auto; margin-top: 40px; }
   #aptImg{width: 100%; height: 560px;}

   #menubar{float: left; display: inline-block; width:15%; height: 400px; border: 1px solid #ddd; color: #545861; padding-top:20px;margin-left:20px;}
   ul{list-style:none;}
   #menubar li{font-size: 30px; height: 70px; font-weight: normal; margin-left:30px; }
   #menu{width:100%; height: 400px; margin-bottom:100px; background: skyblue;}
   .ment{width:85%; margin: 0px auto;  font-weight: bold; font-family:"고딕체";}
   #ment1{font-size:20px;  color:black; margin-top:20px;}
   #ment2{font-size:20px; color: blue; margin-top:40px;}
   #ment3{font-size:20px; color:black; margin-top:40px; font-family:"고딕체";}
   	html, body { height:100%; padding: 0; margin: 0;}
	ul, li{padding: 0; margin: 0; list-style-type:none; }
	   #hello:hover, #info:hover, #pic:hover{cursor:pointer;}
   #all{margin-top: 30px; height:130%;}
	.img{filter: brightness(70%);
     width: 100%;
     height: 400px;}
     #headcomment{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em;
}	     
</style>


</head>
<body>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
<!-- 	<img class="img" src="resources/images/06.png"> -->
	<img class="img" src="resources/images/긴사진.jpg">

	
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">인사말</b>	
   <div id="all">
      <!-- 좌측 메뉴 바 -->
      <!-- <div id="menubar">
         <ul>
            <li id="hello" onclick="location.href='welcome.apt'">인사말</li>
            <li id="info" onclick="location.href='information.apt'">아파트 정보</li>   
         </ul>
      </div> -->
   
      <div id="allDiv">

      <!-- 아파트 사진   -->
         <div id="imgDiv">
            <img id="aptImg" src="${ pageContext.servletContext.contextPath }/resources/images/고급아파트느낌.jpg"/>
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
	<jsp:include page="../common/Footer.jsp"/>   
</body>

<script>
   
</script>





</html>
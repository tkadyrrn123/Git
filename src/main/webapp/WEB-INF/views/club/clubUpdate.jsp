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
   #all{margin-top: 30px;}
	#menu{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;}
	#line1{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px;}
	#line2{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 145px;}
	#line3{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 100px;}
	#line4{width: 90%; background: lightgray; height:2px; margin: auto; margin-top: 10px;}
	.sellAll{width: 80%; margin: 40px 0px 0px 200px;}

	#content1{width: 80%; margin-left:100px;}
	#content2{width: 80%; margin-left:100px;}
	#content3{width: 65%; margin-left:100px;}
	#content4{width: 65%; margin-left:100px;} 
	#content5{width: 61.8%; margin-left:150px;} 

	
	#sellPic{width: 42%; height: 500px; margin-left: 140px; margin-top: 20px; display: inline-block;}
	#img{width: 100%; height:500px;}  
	#infoBox{ background: rgba(224, 224, 224, 0.61);     display: inline-block;
    float: right;
    margin-right: 111px;
    margin-top: 30px; width: 33%; height:500px;}
	
	#title{margin-left: 20px; font-size: 30px; font-weight:bold; margin-top: 35px; height: 100px; }
	#name{margin-left: 20px; margin-top: 20px; font-size: 20px; font-weight:bold; display: inline-block;}
	#nameInput{display: inline-block; margin-left: 30px;}
	#count{margin-left: 20px; margin-top: 50px; font-size: 20px; font-weight:bold;}  
	#countInput{margin-left: 52px; margin-top: 20px; } 
	#applyBtn{margin-left: 52px; width: 80%; height: 50px; margin-top: 100px;}  
	
	
	.cTitle{margin-left: 170px; font-size: 30px; font-weight:bold; margin-top: 40px;}
	#etc{display: inline-block;} 
 	.textarea{margin-top: 40px; width: 80%; margin-left: 190px; min-height: 200px; border:none; font-size: 16px;}
 	
 	 textarea{ resize:none;}


 	#btn{float:right; margin: 20px 200px 0px 0px;}
 	.btn{margin-left:10px;
 	 border: 1px solid #ccccce;
	    border-radius: 6px;
	    background-color: #fff;
	    font-weight: 500;
	    color: #666;
	    cursor: pointer;
	    font-size: 12px;
	    padding: 7px;
	    width: 65px;} 
	.btn:hover{background:skyblue;}
  
 	 #deleteEtc{display: inline;}
 	.img{filter: brightness(70%);
     width: 100%;
     height: 400px;  }
 	
 	#headcomment{
	position: absolute;
	left: 43%;
	top: 220px;
	color: white;
	font-size: 1.5em;
}

</style> 
 
  


</head>
<body>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<img class="img" src="resources/images/05.PNG">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">동호회 수정 페이지</b>
	<div id= all>
		<div id= menu>
			동호회 수정 페이지
		</div>
		<div id="line1"></div>
		
		<div id="content1">

			
			<div id=sellPic>
				<img id=img src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/>
			</div>
			
			
			<div id="infoBox">
				<textarea id="title" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; " required>누구나 손쉽게 따라하는 재즈 피아노 동호회</textarea>
				<div id="line4"></div>
				
				<div id="name">작성자  </div>		
					
				<div id="nameInput">송도훈</div>
					
				<div id="count">모집 인원  </div>
				
				<div id="countInput">총 20명 중 14명 모집완료</div>
				
				<button class="btn" id="applyBtn">가입 신청하기</button> 
			</div>
			
			

		</div>
		
			<div id="line2"></div>
		<div id="content2">
			<div class="cTitle" id="intro">동호회 소개</div>
			<textarea class="textarea" id="introInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
'듣고 싶은 음악을 다른 사람이 아니라,

자신의 손으로 직접 연주할 수 있도록 돕고 싶다.'

그 생각 하나로 피아노 클래스를 준비했습니다.

한 곡, 두 곡 피아노 연주를 완성시켜 나가며 느끼는 뿌듯함과 행복을 여러분께 전해드리고 싶습니다

피아노에 대해, 악보를 보는 법에 대해 전혀 몰라도 괜찮아요.
어떤 걸 배우나요?
악보를 읽는 법부터 시작합니다
클래스를 통해 제이엠의 자작곡 6가지를 함께 연주해봅니다. 이 때에 모든 곡은 같은 과정을 거쳐 익혀볼 거예요.

피아노를 처음 시작하는 분들의 눈높이에 맞추어 배우는 클래스인만큼, 악보는 화음 및 어려운 운지가 많이 빠지고 멜로디와 간단한 반주 위주 구성으로 선정했습니다.
건반을 두드리는 모습을 보며 천천히 익힙니다
			</textarea>
			
			<div class="cTitle" id="plan">동호회 활동 계획</div>
			<textarea class="textarea" id="planInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
'듣고 싶은 음악을 다른 사람이 아니라,

자신의 손으로 직접 연주할 수 있도록 돕고 싶다.'

그 생각 하나로 피아노 클래스를 준비했습니다.

한 곡, 두 곡 피아노 연주를 완성시켜 나가며 느끼는 뿌듯함과 행복을 여러분께 전해드리고 싶습니다

피아노에 대해, 악보를 보는 법에 대해 전혀 몰라도 괜찮아요.
어떤 걸 배우나요?
악보를 읽는 법부터 시작합니다
클래스를 통해 제이엠의 자작곡 6가지를 함께 연주해봅니다. 이 때에 모든 곡은 같은 과정을 거쳐 익혀볼 거예요.

피아노를 처음 시작하는 분들의 눈높이에 맞추어 배우는 클래스인만큼, 악보는 화음 및 어려운 운지가 많이 빠지고 멜로디와 간단한 반주 위주 구성으로 선정했습니다.
건반을 두드리는 모습을 보며 천천히 익힙니다
			</textarea>
			<div class="cTitle" id="loction">동호회 활동 장소</div>
			<textarea class="textarea" id="locationInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
'듣고 싶은 음악을 다른 사람이 아니라,

자신의 손으로 직접 연주할 수 있도록 돕고 싶다.'

그 생각 하나로 피아노 클래스를 준비했습니다.

한 곡, 두 곡 피아노 연주를 완성시켜 나가며 느끼는 뿌듯함과 행복을 여러분께 전해드리고 싶습니다

피아노에 대해, 악보를 보는 법에 대해 전혀 몰라도 괜찮아요.
어떤 걸 배우나요?
악보를 읽는 법부터 시작합니다
클래스를 통해 제이엠의 자작곡 6가지를 함께 연주해봅니다. 이 때에 모든 곡은 같은 과정을 거쳐 익혀볼 거예요.

피아노를 처음 시작하는 분들의 눈높이에 맞추어 배우는 클래스인만큼, 악보는 화음 및 어려운 운지가 많이 빠지고 멜로디와 간단한 반주 위주 구성으로 선정했습니다.
건반을 두드리는 모습을 보며 천천히 익힙니다
			</textarea>
			<div class="cTitle" id="etc">기타 사항</div>
			<textarea class="textarea" id="etcInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
'듣고 싶은 음악을 다른 사람이 아니라,

자신의 손으로 직접 연주할 수 있도록 돕고 싶다.'

그 생각 하나로 피아노 클래스를 준비했습니다.

한 곡, 두 곡 피아노 연주를 완성시켜 나가며 느끼는 뿌듯함과 행복을 여러분께 전해드리고 싶습니다

피아노에 대해, 악보를 보는 법에 대해 전혀 몰라도 괜찮아요.
어떤 걸 배우나요?
악보를 읽는 법부터 시작합니다
클래스를 통해 제이엠의 자작곡 6가지를 함께 연주해봅니다. 이 때에 모든 곡은 같은 과정을 거쳐 익혀볼 거예요.

피아노를 처음 시작하는 분들의 눈높이에 맞추어 배우는 클래스인만큼, 악보는 화음 및 어려운 운지가 많이 빠지고 멜로디와 간단한 반주 위주 구성으로 선정했습니다.
건반을 두드리는 모습을 보며 천천히 익힙니다
			</textarea>
			

		</div>
		
		
			
		<div id="line3"></div>
		
		<div id="btn">
				<button class="btn" id="updateBtn">수정</button>
				<button class="btn" id="deleteBtn">삭제</button>
				<button class="btn" id="listBtn">목록</button>
		</div>

		
	</div>
	<jsp:include page="../common/Footer.jsp"/>
	<script type="text/javascript">
		/** textarea 높이 자동 조절 **/
		$(function () {
			
		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
		});

	</script> 

</body>
</html>
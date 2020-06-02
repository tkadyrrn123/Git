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

	
	#sellPic{width: 42%; height: 500px; margin-left: 140px; margin-top: 30px; display: inline-block;}
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
	#intro{} 
 	.textarea{margin-top: 40px; width: 80%; margin-left: 190px; min-height: 200px; border:none; font-size: 16px;}
 	
 	
 	textarea{ resize:none;}
 	textarea:focus {outline: none;}
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
 	#replyInput{width:80% ; margin: 100px 0px 0px 200px; border: 1px solid black; height: 184px; } 
 	#rWrite{border: 1px solid black; width: 75%; margin: 0px 0px 0px 30px; height:100px;}  
 	 
 	#rProfile{width: 40px; hieght:40px;}
 	#rImg{ border-radius: 10%;  width: 100%; height:100%; }  
 	#info{display: inline-block;  height:50px; margin-left: 30px; width:80%;}
 	#info2{display: inline-block;  height:50px; margin-top: 12px; margin-left: 30px; width:100%;}
 	.info{display: inline-block;} 
 	#insertBtn{width: 70px;  margin-top: 20px;} 
 	
 	
 	#reply{width:80% ; margin: 10px 0px 0px 200px; border: 1px solid black; }  
 	#rreply{width:80% ; margin: 10px 0px 0px 200px; border: 1px solid black; background: skyblue; }  
 	#rContent{width: 75%; margin: 20px 0px 0px 50px; border:none; font-size:18px; font-weight: bold; min-height: 34px;} 
 	#rUpdateBtn{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 500px;}  
 	#rDeleteBtn{width: 70px;  vertical-align: middle; margin-top: 20px;}  
 	#rUpdateBtn2{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 457px;}  
 	#replyDate{width: 12%; font-size: 12px; color: gray; /**margin-left: 70px; margin-top: -20px ;**/}
 	#replyBtn{margin: 10px 0 10px 60px;}
 	.likeBtn{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}  
 	.likeBtn2{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display:none;} 
 	
 	#likeBtn3{margin-left: 698px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}  
 	#likeBtn4{margin-left: 698px; width: 3%; height:3%; vertical-align: middle; display:none;}  
 	#likeImg{width: 100%; height:100%; }  
 	#likeImg2{width:100%; height:100%;}  
 	.likeCount{display: inline-block;    vertical-align: sub; margin-left: 10px;}
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
	<b id="headcomment">동호회 상세 페이지</b>	
	<div id= all> 
		<div id= menu>
			동호회 상세 페이지
		</div>
		<div id="line1"></div>
		
		<div id="content1">

			
			<div id=sellPic>
				<img id=img src="${ pageContext.servletContext.contextPath }/resources/images/soap.png"/>
			</div>
			
			
			<div id="infoBox">
				<div id="title">
					누구나 손쉽게 따라하는 재즈 피아노 동호회

				</div>
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
			<textarea class="textarea" id="introInput" readonly style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
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
			<textarea class="textarea" id="planInput" readonly style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
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
			<textarea class="textarea" id="locationInput" readonly style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
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
			<textarea class="textarea" id="etcInput" readonly style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>
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
		
		
		
		<!--  댓글 작성  -->
		<div id="content3">
			<div id="replyInput">
				<div id="info">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/images/01.png"></div>
					<div class="info"  id="rWriter">작성자</div>
					<div class="info"  id="rHo">(202호)</div>
				</div>
				<button class="btn" id="insertBtn">댓글 등록</button>

				<textarea id="rWrite" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea> 
				<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
			</div>
		</div> 
		
		
		
		<!--  댓글   -->
		 <div id="content4">
			<div id="reply">
				<div id="info2">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/images/01.png"></div>
					<div class="info"  id="rWriter">작성자</div>
					<div class="info"  id="rHo">(202호)</div>
					<div class="info"  id="replyDate">2020-05-27 03:03</div>
					<button class="btn" id="rUpdateBtn">수정</button> 
					<button class="btn" id="rDeleteBtn">삭제</button> 
				</div>
				<div width="100%">
					<textarea id="rContent"  readonly>010-1234-5678 쪽으로 연락 주세요</textarea>
				</div> 
				<div>
					<button class="btn" id="replyBtn">답글</button>
					<div class="likeBtn" id="likeBtn1">
						<img id="likeImg" src="${ pageContext.servletContext.contextPath }/resources/images/like.png">
					</div>
					<div class="likeBtn2" id="likeBtn2">
						<img id="likeImg2"  src="${ pageContext.servletContext.contextPath }/resources/images/like2.png">
					</div>
					<div class="likeCount">0</div>
				</div>
			</div>
		</div>
		
		<div id="content5">
			<div id="rreply">
				<div id="info2">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/images/01.png"></div>
					<div class="info"  id="rWriter">작성자</div>
					<div class="info"  id="rHo">(202호)</div>
					<div class="info"  id="replyDate">2020-05-27 03:03</div>
					<button class="btn" id="rUpdateBtn2">수정</button> 
					<button class="btn" id="rDeleteBtn">삭제</button> 
				</div>
				<div width="100%">
					<p id="rContent"  readonly>010-1234-5678 쪽으로 연락 주세요</p>
				</div> 
				<div>
					<button class="btn" id="replyBtn">답글</button>
					<div class="likeBtn" id="likeBtn3">
						<img id="likeImg" src="${ pageContext.servletContext.contextPath }/resources/images/like3.png">
					</div>
					<div class="likeBtn2" id="likeBtn4">
						<img id="likeImg2"  src="${ pageContext.servletContext.contextPath }/resources/images/like4.png">
					</div>
						<div class="likeCount">0</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
	</div>
	
		<jsp:include page="../common/Footer.jsp"/>
	
	
	
	<script type="text/javascript">
	
		/** 댓글 글자수 제한 **/
		$('#rWrite').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200 / 최대 200자)");
		    }
		}).keydown(function (e){
			var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200 / 최대 200자)");
		    }
		});
		
		
		/** textarea 높이 자동 조절 **/
		$(function () {
			
		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
		});
		
		/** 댓글 창 높이 자동 조절 **/
		$(function () {
			
			  $('#rContent').height(1).height( $('#rContent').prop('scrollHeight') - 20  );	
			});
		
		$('.likeBtn').click(function(){
			$(this).parent().children('.likeBtn2').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text(); 
			count *= 1;
			count = count + 1;
			$(this).parent().children('.likeCount').text(count);
		});
		
// 		$("#btn").eq(n);
//  	$("ul li:nth-child(2)").append("<span> - 2nd!</span>");

		
		$('.likeBtn2').click(function(){
			$(this).parent().children('.likeBtn').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text();
			count *= 1;
			count = count - 1;
			$(this).parent().children('.likeCount').text(count);
		});
		
		$('#updateBtn').on('click', function(){
			location.href="clubUpdate.cb"
		});
		
	</script> 

</body>
</html>
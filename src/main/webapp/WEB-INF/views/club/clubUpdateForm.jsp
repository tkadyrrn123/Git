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
	#count{margin-left: 20px; margin-top: 40px; font-size: 20px; font-weight:bold;}  
	#countInput{margin-left: 52px; margin-top: 20px; font-size:30px; height:50px;} 
	#applyBtn{margin-left: 52px; width: 80%; height: 50px; margin-top: 100px;}  
	
	
	.cTitle{margin-left: 170px; font-size: 30px; font-weight:bold; margin-top: 40px;}
	#etc{display: inline-block;} 
 	.textarea{margin-top: 40px; width: 80%; margin-left: 190px; min-height: 100px; border:none; font-size: 16px;} 
 	
 	 textarea{resize:none;}


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
	#updatebtn{margin-left: 855px;width:90px;}
	#canclebtn{}
	#curPeople{readonly; background:none; border:none; margin-left: 52px; margin-top: 20px; font-size:30px; height:50px;}
	#curPeople:focus {outline: none;}
</style> 
 
  


</head>
<body>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
<!-- 	<img class="img" src="resources/images/05.PNG"> -->
	 	<img class="img" src="resources/images/동호회목록.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">동호회 수정 페이지</b>
	<div id= all>
		<form action="updateClub.cb" method="POST">
		<div id= menu>
			동호회 수정 페이지
		</div>
		<div id="line1"></div>
		
		<div id="content1">
			<input type="hidden" name="userId" value="${ loginUser.userId }"> 
			
			<div id=sellPic>
				<img id=img src="${ pageContext.servletContext.contextPath }/resources/clubFiles/${ c.fileName }"/>
				<input type="hidden" name="fileName" value="${ c.fileName }">
				<input type="hidden" name="boardNo" value="${c.boardNo }">
			</div>
			
			
			<div id="infoBox">
				<textarea name="clubName"  id="title" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; " required>${ c.clubName }</textarea>
				<div id="line4"></div>
				
				<div id="name">작성자  </div>		
					
				<div id="nameInput">${ c.nickName }</div>
				<input type="hidden" name="nickName" value="${ c.nickName }">
					
				<div id="count">총 모집 인원  </div>
				
				<textarea name="maxPeople"  id="countInput">${ c.maxPeople }</textarea>

				
				<div id="count"> 현재 인원  </div>
				
				<textarea  name="clubPeople"  id="curPeople" readonly >${ c.clubPeople }</textarea>
				
			</div>
			
			

		</div>
		
			<div id="line2"></div>
		<div id="content2">
			<div class="cTitle" id="intro">동호회 소개</div>
			<textarea name="clubIntro" class="textarea" id="introInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>${ c.clubIntro }</textarea>			
			<div class="cTitle" id="plan">동호회 활동 계획</div>
			<textarea name="clubPlan"  class="textarea" id="planInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>${ c.clubPlan }</textarea>
			<div class="cTitle" id="loction">동호회 활동 장소</div>
			<textarea name="clubPlace"  class="textarea" id="locationInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>${ c.clubPlace }</textarea>
			<div class="cTitle" id="etc">기타 사항</div>
			<textarea name="clubEtc"  class="textarea" id="etcInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required>${ c.clubEtc }</textarea>
			

		</div>
		<button type="submit" class="btn" id="updatebtn">수정 완료</button>
		<button type="button" class="btn" id="canclebtn">취소</button>
		


		</form>
	</div>
	<jsp:include page="../common/Footer.jsp"/>
	<script type="text/javascript">
		/** textarea 높이 자동 조절 **/
		$(function () {
			
		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
		});
		
		$('#canclebtn').on('click',function(){
			<c:url var="can" value="clubDetail.cb">
				<c:param name="boardNo" value="${ c.boardNo }"></c:param>
				<c:param name="userId" value="${ loginUser.userId }"></c:param>
				<c:param name="clubName" value="${ c.clubName }"></c:param>
			</c:url>
			if(confirm("수정을 중단하고 이전 페이지로 이동하시겠습니까?")){
   				location.href="${ can }";
			}
		});

		
	</script> 

</body>
</html>
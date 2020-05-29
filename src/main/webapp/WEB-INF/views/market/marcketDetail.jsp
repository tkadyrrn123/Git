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
   #all{margin-top: 250px;}
	#menu{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;}
	#line1{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px;}
	#line2{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 228px;}
	#line3{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 100px;}
	.sellAll{width: 80%; margin: 40px 0px 0px 200px;}

	#content1{width: 80%; margin-left:100px;}
	#content2{width: 80%; margin-left:100px;}
	#content3{width: 65%; margin-left:100px;}
	#content4{width: 65%; margin-left:100px;} 
	#content5{width: 61.8%; margin-left:150px;} 

	#title{font-size:30px; width: 50%; font-weight:bold; margin-top: 20px; display: inline-block; margin-left: 130px;} 
	#hit{display: inline-block; width: 15%; text-align:center; } 
	#date{display: inline-block; width: 15%; text-align:right; }
	
	#sellPic{width: 49%; height: 400px; margin-left: 70px; margin-top: 20px; display: inline-block; float:left;}
	#img{margin-left : 100px; width: 60%} 
	
	
	#itemName{display: inline-block; font-size: 30px; font-weight:bold; margin-top: 35px; margin-right: 420px;}
	#price{display: inline-block;  margin-top:30px; width:45%; margin-left: 20px;}
	
	#name{display: inline-block; margin-top: 30px; margin-left: 20px;}  
 	#sellContent{margin-left: 0px; width: 80%; margin-left: 190px; min-height: 200px; border:none; font-size: 16px;}
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
</style> 
 
  


</head>
<body>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<c:import url="bar.jsp"/>
	
	<div id= all>
		<div id= menu>
			중고 장터
		</div>
		<div id="line1"></div>
		
		<div id="content1">
			<div id="title">
				물건 싸게 팔아요 S급 1번 밖에 안썼어요~~
			</div>
			
			<div id="date" >
				게시글 등록일 : 
			</div>
			
			<div id="hit">
				조회수 : 
			</div>

			
			<div id=sellPic>
				<img id=img src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/>
			</div>
			
			
			
			<div id="itemName">
				레미안 석관 아파트
			</div>
			
			<div id="price">
				5억
			</div>			
			
			<div id="name">
				닉네임
			</div>
			
			
			

		</div>
		
			<div id="line2"></div>
		<div id="content2">
			<textarea id="sellContent" readonly>
			
구입일 - 2020년 1월 24일
애플케어 - 2022년 1월 24일
외상 - X
내부문제 - X
셀룰러 - O

댓글에 번호 또는 카톡 아이디 써주세요
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
	</script> 

</body>
</html>
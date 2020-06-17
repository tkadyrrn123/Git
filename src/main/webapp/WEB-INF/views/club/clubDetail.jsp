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
	#content5{width: 61.8%; margin-left:150px; margin-bottom:30px;} 

	
	#sellPic{width: 42%; height: 500px; margin-left: 140px; margin-top: 30px; display: inline-block;}
	#img{width: 100%; height:500px;}  
	#infoBox{ background: rgba(224, 224, 224, 0.61);     display: inline-block;
    float: right;
    margin-right: 111px;
    margin-top: 30px; width: 33%; height:500px;}
	
	#title{margin-left: 20px; font-size: 30px; font-weight:bold; margin-top: 35px; height: 100px; background: none; }
	#name{margin-left: 20px; margin-top: 20px; font-size: 20px; font-weight:bold; display: inline-block;}
	#nameInput{display: inline-block; margin-left: 30px;}
	#count{margin-left: 20px; margin-top: 31px; font-size: 20px; font-weight:bold;}  
	#countInput{margin-left: 52px; margin-top: 20px; background: none;} 
	#applyBtn{margin-left: 52px; width: 80%; height: 50px; margin-top: 10px;}  
	#outBtn{margin-left: 52px; width: 80%; height: 50px; margin-top: 10px;}  
	
	
	.cTitle{margin-left: 170px; font-size: 30px; font-weight:bold; margin-top: 40px;}
 	.textarea{margin-top: 40px; width: 80%; margin-left: 190px; min-height: 100px; border:none; font-size: 16px;}
 	
 	

 	textarea{ readonly; resize:none; border:none;}
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
 	 
 	#rProfile{width: 40px; height:40px; margin-top: 10px;}
 	#rImg{ border-radius: 50%;  width: 100%; height:100%; }  
 	#rWriter{vertical-align: middle; margin-top: -28px; margin-right: 30px; margin-left:10px;width:5%;}
 	#rHo{vertical-align: middle; margin-top: -28px;}
 	#info{display: inline-block;  height:50px; margin-left: 30px; width:80%;}
 	#info2{display: inline-block;  height:50px; margin-top: 12px; margin-left: 30px; width:100%;}
 	.info{display: inline-block;} 
 	#insertBtn{width: 70px;  margin-top: 20px;} 
 	
 	
 	.reply{width:80% ; margin: 10px 0px 0px 200px; border: 1px solid black; }  

 	
 	#rreply{width:80% ; margin: 10px 0px 0px 200px; border: 1px solid black; background: skyblue; }  
 	
 	#content4 textarea{width: 75%; margin: 20px 0px 0px 50px; border:none; font-size:18px; font-weight: bold; min-height: 34px;} 
 	
/*  	#rUpdateBtn{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 500px;}  
 	#rDeleteBtn{width: 70px;  vertical-align: middle; margin-top: 20px;}  */ 
 	
/*  	#rUpdateBtnC{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 500px;}  
 	#rDeleteBtnC{width: 70px;  vertical-align: middle; margin-top: 20px;}   */
 	
 	#rUpdateBtnAjax{margin-left: 29px;}  
 	#rDeleteBtnAjax{margin-left: 16px;}  
 	
 	#rrUpdateBtn{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 457px;}  
 	#replyDate{width: 12%; font-size: 12px; color: gray; margin-left: 10px; margin-top: -30px ; margin-right:500px;}
 	#replyBtn{margin: 10px 0 10px 60px;}
 	.likeBtn{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}  
 	.likeBtn2{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display:none;} 
 	
 	#likeBtn3{margin-left: 753px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}   
 	#likeBtn4{margin-left: 753px; width: 3%; height:3%; vertical-align: middle; display:none;}  
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
		<form action="clubUpdateForm.cb" method="POST">
		<div id= menu>
			동호회 상세 페이지
		</div>
		<div id="line1"></div>
		
		<div id="content1">

			
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
					
				<div id="count"> 모집 인원  </div>
				
				<textarea  name="maxPeople"  id="countInput">${ c.maxPeople }</textarea>

				<div id="count"> 현재 인원  </div>
				
				<textarea  name="clubPeople"  id="countInput">${ c.clubPeople }</textarea>

				<c:url var="apply" value="ClubApply.cb">
					<c:param name="clubName" value="${ c.clubName }"></c:param>
					<c:param name="userId" value="${ loginUser.userId }"></c:param>
					<c:param name="boardNo" value="${ c.boardNo }"></c:param>	
				</c:url>
				<c:if test="${ result eq 0 }">
				<button type="button" class="btn" id="applyBtn" onclick="location.href='${apply}'">가입 신청하기</button> 
				</c:if>
				

				<c:if test="${ result ne 0 }">
				<button type="button" class="btn" id="outBtn">동호회 탈퇴하기</button> 
				</c:if>
			</div>
			
			

		</div>
		
			<div id="line2"></div>
		<div id="content2">
			<div class="cTitle" id="intro">동호회 소개</div>
			<textarea name="clubIntro" class="textarea" id="introInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required readonly>
${ c.clubIntro }
			</textarea>
			
			<div class="cTitle" id="plan">동호회 활동 계획</div>
			<textarea name="clubPlan"  class="textarea" id="planInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required readonly>
${ c.clubPlan }
			</textarea>
			<div class="cTitle" id="loction">동호회 활동 장소</div>
			<textarea name="clubPlace"  class="textarea" id="locationInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required readonly>
${ c.clubPlace }
			</textarea>
			<div class="cTitle" id="etc">기타 사항</div>
			<textarea name="clubEtc"  class="textarea" id="etcInput"  style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required readonly>
${ c.clubEtc }
			</textarea>
			

		</div>
		
		
			
		<div id="line3"></div>
		
		<div id="btn">
			<c:if test="${ c.nickName eq loginUser.nickName }">
				<button class="btn" id="updateBtn">수정</button>
				<button type="button" class="btn" id="deleteBtn">삭제</button>
			</c:if>	
				<c:url var="cList" value="clubList.cb">
					<c:param name="page" value="${ page }"></c:param>
				</c:url>
				<button type="button" class="btn" id="listBtn" onclick="location.href='${ cList }'">목록</button>
		</div>
		
		</form>
		
		<!--  댓글 작성  -->
		<div id="content3">
			<div id="replyInput">
				<div id="info">
					<c:if test="${!empty loginUser.userFile }">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${loginUser.userFile}"></div>
					</c:if>
					<c:if test="${empty loginUser.userFile }">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
					</c:if>
					<div class="info"  id="rWriter">${ loginUser.nickName }</div>
				</div>
				<button class="btn" id="insertBtn">댓글 등록</button>

				<textarea id="rWrite" style="overflow: hidden; overflow-wrap: break-word; resize: none;" required placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea> 
				<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
			</div>
		</div> 

		
		<!--  댓글   -->
		<div id="content4">
			<c:forEach var="b" items="${comment}" varStatus="status">
				<div class="reply" id="reply${ status.index }">
					<div id="info2">
						<c:if test="${!empty b.userFile }">
							<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${b.userFile}"></div>
						</c:if>
						<c:if test="${empty b.userFile }">
							<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
						</c:if>
							<div class="info"  id="rWriter">${b.nickname}</div>
							<div class="info"  id="replyDate">${b.rCreateDate}</div>
						<c:if test="${loginUser.userId eq b.rUserId }">
							<button class="btn" id="rUpdateBtn${ status.index }">수정</button> 
							<button class="btn" id="rDeleteBtn${ status.index }">삭제</button>
						</c:if>
					</div>

						<textarea class="rContent${ status.index }" readonly >${b.rContent}</textarea>
 
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
				
				
				
		<!--  댓글 수정  -->	
				<div class="reply" id="replyUpdate${ status.index }">
					<div id="info2">
						<c:if test="${!empty b.userFile }">
							<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${b.userFile}"></div>
						</c:if>
						<c:if test="${empty b.userFile }">
							<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
						</c:if>
							<div class="info"  id="rWriter">${b.nickname}</div>
							<div class="info"  id="replyDate">${b.rCreateDate}</div>
						<c:if test="${loginUser.userId eq b.rUserId }">
							<button class="btn" id="rUpdateBtnC" onclick="updateReply(${ status.index }, ${b.rNo })" >수정완료</button> 
							<button class="btn" id="rDeleteBtnC${ status.index }">수정취소</button>
						</c:if>
					</div>

						<textarea class="rrContent${ status.index }" style="border: 1px solid black;">${b.rContent}</textarea>
 

				</div>
  				<script>
				$(function () {
					$('.rContent${ status.index }').height(1).height( $('.rContent${ status.index }').prop('scrollHeight') + 32  );
					$('.rrContent${ status.index }').height(1).height( $('.rContent${ status.index }').prop('scrollHeight') + 32  );
					  
					  
					$('#replyUpdate${ status.index }').hide();
						});
				
				
			   	$('#rUpdateBtn${ status.index }').click(function(){
			   			$('#reply${ status.index }').hide();
			   			$('#replyUpdate${ status.index }').show();
			   		})
			   		
			   		

			   		
			   	$('#rDeleteBtnC${ status.index }').click(function(){
			   			$('#replyUpdate${ status.index }').hide();
			   			$('#reply${ status.index }').show();
			   		})
			   	
	
			   		
				</script>
			</c:forEach>
		</div>
				
			
		</div>		
		
		<div id="content5">
			<div id="rreply">
				<div id="info2">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/images/01.png"></div>
					<div class="info"  id="rWriter">작성자</div>
					<div class="info"  id="replyDate">2020-05-27 03:03</div>
					<button class="btn" id="rrUpdateBtn">수정</button> 
					<button class="btn" id="rrDeleteBtn">삭제</button> 
				</div>
				<div width="100%">
					<p id="rContent" readonly>010-1234-5678 쪽으로 연락 주세요</p>
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

/* 		$('.reply button:eq(1)').css('display','none'); */
		$(document).on('click','.reply button:eq(1)',function(){
			location.href="clubList.cb";
		})

		
		

		
   		/* 삭제  */
   		$('#deleteBtn').on('click', function(){
			<c:url var="cDelete" value="deleteClub.cb">
				<c:param name="boardNo" value="${ c.boardNo }"></c:param>
			</c:url>
   			if(confirm("동호회를 삭제하시겠습니까?")){
   				location.href="${cDelete}";
   			}
   		});
   		
   		$('#outBtn').on('click', function(){
			<c:url var="out" value="ClubOut.cb">
				<c:param name="clubName" value="${ c.clubName }"></c:param>
				<c:param name="userId" value="${ loginUser.userId }"></c:param>
				<c:param name="boardNo" value="${ c.boardNo }"></c:param>	
			</c:url>
			if(confirm("동호회를 탈퇴하시겠습니까?")){
   				location.href="${out}";
   			}
   		});
   		

   		

   		$('#insertBtn').on('click', function(){
   			var userId = '${ loginUser.userId }' 
   			var boardNo = ${ c.boardNo }
   			var content = $('#rWrite').val();
   			$.ajax({
   				url: 'insertComment.cb',
   				data: {userId:userId, boardNo:boardNo, content:content},
   				success: function(data){
   					$replyTable = $('#content4');
					$replyTable.html("");
					for(var i = 0; i < data.length; i++){
						var $reply = $('<div>').attr('id', 'reply' + i).attr('class','reply');
						var $div = $('<div>').attr('id', 'info2');
						var $profile = $('<div>').attr('class','info').attr('id','rProfile');
						
						if(data[i].userFile == null){
							var $img = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg').attr('class','info').attr('id','rImg');
						} else {
							var $img = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/' + data[i].userFile).attr('class','info').attr('id','rImg');
						}
						var $writer = $('<div>').text(data[i].nickname).attr('class','info').attr('id','rWriter');
						var $date = $('<div>').text(data[i].rCreateDate).attr('class','info').attr('id','replyDate');
						if(data[i].rUserId == userId){
						var $rubtn = $('<button>').text("수정").attr('class','btn').attr('id','rUpdateBtnAjax');
						var $rdbtn = $('<button>').text("삭제").attr('class','btn').attr('id','rDeleteBtnAjax');
						}
						var $content = $('<textarea>').text(data[i].rContent);	
						
						var $divv = $('<div>');
						var $rreply = $('<button>').text("답글").attr('class','btn').attr('id','replyBtn');
						var $like1 = $('<div>').attr('class','likeBtn3').attr('id','likeBtn3');
						var $img1 = $('<img>').attr('id','likeImg3').attr('src', '${ pageContext.servletContext.contextPath }/resources/images/like.png');
						var $like2 = $('<div>').attr('class','likeBtn4').attr('id','likeBtn4');
						var $img2 = $('<img>').attr('id','likeImg4').attr('src', '${ pageContext.servletContext.contextPath }/resources/images/like2.png');
						var $count = $('<div>').text("0").attr('class','likeCount');
						
						
						var $pprofile = $('<div>').attr('class','info').attr('id','rProfile');
						if(data[i].userFile == null){
							var $iimg = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg').attr('class','info').attr('id','rImg');
						} else {
							var $iimg = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/' + data[i].userFile).attr('class','info').attr('id','rImg');
						}
						var $wwriter = $('<div>').text(data[i].nickname).attr('class','info').attr('id','rWriter');
						var $ddate = $('<div>').text(data[i].rCreateDate).attr('class','info').attr('id','replyDate');
						var $replyUpdate = $('<div>').attr('class', 'reply').attr('id','replyUpdate' + i).css('display','none');
						var $ddiv = $('<div>').attr('id', 'info2')
						var $rrubtn = $('<button>').text("수정완료").attr('class','btn').attr('id','rUpdateBtnC');
						var $rrdbtn = $('<button>').text("수정취소").attr('class','btn').attr('id','rDeleteBtnC'+i);
						var $ccontent = $('<textarea>').attr('class','rrContent'+i).text(data[i].rContent);
						
						
	
						
						
						$profile.append($img);
						
						$div.append($profile);
						$div.append($writer);
						$div.append($date);
						$div.append($rubtn);
						$div.append($rdbtn);
						
						$divv.append($rreply);
						$like1.append($img1);
						$like2.append($img2);
						$divv.append($like1)
						$divv.append($like2)
						$divv.append($count)
						 
						$reply.append($div);
						$reply.append($content);

						
						$reply.append($divv);
						
						
						$pprofile.append($iimg);
						$ddiv.append($pprofile);
						$ddiv.append($wwriter);
						$ddiv.append($ddate);
						$ddiv.append($rrubtn);
						$ddiv.append($rrdbtn);
						$replyUpdate.append($ddiv);
						$replyUpdate.append($ccontent);
						
						
						$replyTable.append($reply);
						$replyTable.append($replyUpdate);
						
						var aaa = $content.prop('scrollHeight');
						var aaaa = $ccontent.prop('scrollHeight');
						$content.height(aaa + 20);
						$ccontent.height(aaaa + 20);

						
 	
				

					}

					$('#rWrite').val("");
   				}
   			})
   		})
   		
   		$(document).on('click', '#rUpdateBtnAjax',function(){
			$(this).parent().parent().css('display','none');
			$(this).parent().parent().next().css('display','inline-block');

		}); 		   	
   		
   		$(document).on('click', '#rUpdateBtnC',function(){
			$(this).parent().parent().css('display','none');
			$(this).parent().parent().next().css('display','inline-block');

		}); 
   		
   		
   		
		function updateReply(a, b){
  	   			var boardNo = ${ c.boardNo }
   				var rNo = b
   				var content = $('.rrContent' + a).val();
  	   			$.ajax({
  	   				url: 'updateComment.cb',
  	   				data: {boardNo:boardNo, content:content, rNo:b},
  	   				success: function(data){
  	   					$replyTable = $('#content4');
  						$replyTable.html("");
  						for(var i = 0; i < data.length; i++){
  							var $reply = $('<div>').attr('id', 'reply');
  							var $div = $('<div>').attr('id', 'info2');
  							var $profile = $('<div>').attr('class','info').attr('id','rProfile');
  							
  							if(data[i].userFile == null){
  								var $img = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg').attr('class','info').attr('id','rImg');
  							} else {
  								var $img = $('<img>').attr('src', '${ pageContext.servletContext.contextPath }/resources/uploadFiles/' + data[i].userFile).attr('class','info').attr('id','rImg');
  							}
  							var $writer = $('<div>').text(data[i].nickname).attr('class','info').attr('id','rWriter');
  							var $date = $('<div>').text(data[i].rCreateDate).attr('class','info').attr('id','replyDate');
  							var $rubtn = $('<button>').text("수정").attr('class','btn').attr('id','rUpdateBtnAjax');
  							var $rdbtn = $('<button>').text("삭제").attr('class','btn').attr('id','rDeleteBtnAjax');

  							var $content = $('<textarea>').text(data[i].rContent);	
  							
  							var $divv = $('<div>');
  							var $rreply = $('<button>').text("답글").attr('class','btn').attr('id','replyBtn');
  							var $like1 = $('<div>').attr('class','likeBtn3').attr('id','likeBtn3');
  							var $img1 = $('<img>').attr('id','likeImg3').attr('src', '${ pageContext.servletContext.contextPath }/resources/images/like.png');
  							var $like2 = $('<div>').attr('class','likeBtn4').attr('id','likeBtn4');
  							var $img2 = $('<img>').attr('id','likeImg4').attr('src', '${ pageContext.servletContext.contextPath }/resources/images/like2.png');
  							var $count = $('<div>').text("0").attr('class','likeCount');
  							
  							$profile.append($img);
  							$div.append($profile);
  							$div.append($writer);
  							$div.append($date);
  							$div.append($rubtn);
  							$div.append($rdbtn);
  							$reply.append($div);
  							$reply.append($content);
  							$divv.append($rreply);
  							$like1.append($img1);
  							$like2.append($img2);
  							$divv.append($like1)
  							$divv.append($like2)
  							$divv.append($count)
  							$reply.append($divv);

  							$replyTable.append($reply);
  							console.log(data);
  							var aaa = $content.prop('scrollHeight');
  							$content.height(aaa + 20);

  						}

   						$('#rWrite').val("");
   	   				}
   	   			})  		
   		}
		

   		
   		

   		
   		
   		$('.likeBtn').click(function(){
			$(this).parent().children('.likeBtn2').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text(); 
			count *= 1;
			count = count + 1;
			$(this).parent().children('.likeCount').text(count);
		}); 
   		
   		$(document).on('click', '.likeBtn3',function(){
			$(this).parent().children('.likeBtn4').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text(); 
			count *= 1;
			count = count + 1;
			$(this).parent().children('.likeCount').text(count);
		}); 
		
		

		
		$('.likeBtn2').click(function(){
			$(this).parent().children('.likeBtn').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text();
			count *= 1;
			count = count - 1;
			$(this).parent().children('.likeCount').text(count);
		});
		
		$(document).on('click', '.likeBtn4', function(){
			$(this).parent().children('.likeBtn3').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text();
			count *= 1;
			count = count - 1;
			$(this).parent().children('.likeCount').text(count);
		});
		
		
/* 		$(document).on('click', '#rDeleteBtnAjax', function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
   				location.href="deleteClub.cb";
   			}
		}); */
		

	</script> 

</body>
</html>
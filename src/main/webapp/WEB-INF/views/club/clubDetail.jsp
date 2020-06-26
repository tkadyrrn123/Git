<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
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
 	
 	#replyInput2{width:72% ; margin: 10px 0px 0px 300px; border: 1px solid black; height: 204px; background:skyblue;} 
 	#rrWrite{border: 1px solid black; width: 75%; margin: 0px 0px 0px 30px; height:100px; background:skyblue;}  
 	 
 	#rProfile{width: 40px; height:40px; margin-top: 10px;}
 	#rImg{ border-radius: 50%;  width: 100%; height:100%; }  
 	#rWriter{vertical-align: middle; margin-top: -28px; margin-right: 10px; margin-left:10px;width:7%;}
 	#rHo{vertical-align: middle; margin-top: -28px;}
 	#info{display: inline-block;  height:50px; margin-left: 30px; width:80%;}
 	#info2{display: inline-block;  height:50px; margin-top: 12px; margin-left: 30px; width:100%;}
 	.info{display: inline-block;} 
 	#insertBtn{width: 70px;  margin-top: 20px;} 
 	#counter{margin-top: 70px;float: right;margin-right: 50px;}
 	
 
 	
 	#content4 textarea{width: 75%; margin: 20px 0px 14px 50px; border:none; font-size:18px; font-weight: bold; min-height: 34px;} 
 	 .reply{width:80% ; margin: 10px 0px 0px 200px; border: 1px solid black; }  
 	.rreply{width: 110%; margin: 10px 0px 0px 200px; border: 1px solid black; background: skyblue; } 
/*  	#rUpdateBtn{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 500px;}  
 	#rDeleteBtn{width: 70px;  vertical-align: middle; margin-top: 20px;}  */ 
 	
/*  	#rUpdateBtnC{width: 70px;  vertical-align: middle; margin-top: 20px; margin-left: 500px;}  
 	#rDeleteBtnC{width: 70px;  vertical-align: middle; margin-top: 20px;}   */
 	
 	#rUpdateBtnAjax{margin-left: 29px;}  
 	#rDeleteBtnAjax{margin-left: 16px;}  
 	
 	#rrUpdateBtn{width: 70px; margin-left: 617px;}  
 	#replyDate{width: 12%; font-size: 12px; color: gray; margin-left: 10px; margin-top: 29px; margin-right:500px;}
 	#rreplyDate{width: 12%; font-size: 12px; color: gray; margin-left: 10px;     margin-top: 29px; margin-right: 372px; vertical-align: top;}
 	#rrContent{background: skyblue;}
 	
 	
 	#replyBtn{margin: 10px 0 10px 60px;}
 	.likeBtn{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}  
 	.likeBtn2{margin-left: 745px; width: 3%; height:3%; vertical-align: middle; display:none;} 
 	
 	#likeBtn3{margin-left: 753px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}   
 	#likeBtn4{margin-left: 753px; width: 3%; height:3%; vertical-align: middle; display:none;}  
 	#likeImg{width: 100%; height:100%;}  
 	#likeImg2{width:100%; height:100%;}    
 	#likeImg3{width: 100%; height:100%;}  
 	#likeImg4{width:100%; height:100%;}    
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
			<input type="hidden" name="userId" value="${ loginUser.userId }"> 

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

				<textarea class="rWrite" id="rWrite" style="overflow: hidden; overflow-wrap: break-word; resize: none;" required placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea> 
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
							<button type="button" class="btn" id="rUpdateBtn${ status.index }">수정</button> 
							<button type="button" class="btn" id="rDeleteBtn${ status.index }">삭제</button>
							<div style="display:none">${b.rNo}</div>
						</c:if>
					</div>

						<textarea class="rContent${ status.index }" readonly >${b.rContent}</textarea>
 
					<div> 
						<button class="btn" id="replyBtn">답글</button>
						<div style="display:none">${b.rNo}</div>
						<div class="likeBtn" id="likeBtn1">
							<img id="likeImg" src="${ pageContext.servletContext.contextPath }/resources/images/like.png">
						</div>
						<div class="likeBtn2" id="likeBtn2">
							<img id="likeImg2"  src="${ pageContext.servletContext.contextPath }/resources/images/like2.png">
						</div>
						<div class="likeCount">
						<c:set var="likeCount" value="0"/>
						<c:if test="${likeList.size() > 0}">
						<c:forEach var="i" begin="0" end="${likeList.size()-1}">
						<c:if test="${likeList[i].rNo eq b.rNo}">
						<c:set var="likeCount" value="${likeCount+1}"/>
						</c:if>
						</c:forEach>
						</c:if>
						${likeCount}
						</div>
					</div>
				</div>
				<script>
				var reply = $('#reply${ status.index }');
				var likeBtn1 = reply.children().next().next().children().next().next();
				var likeBtn2 = reply.children().next().next().children().next().next().next();
					<c:if test="${likeList.size() > 0}">
					<c:forEach var="i" begin="0" end="${likeList.size()-1}">
					<c:if test="${loginUser.userId eq likeList[i].rUserId and b.rNo eq likeList[i].rNo}">
						likeBtn1.css('display','none');
						likeBtn2.css('display','inline-block');
					</c:if>
					</c:forEach>
					</c:if>
				</script>
				
				
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
			   		$('#reply${ status.index }').show();
		   			$('#replyUpdate${ status.index }').hide();
			   	})
			   	
			   	
			   	$('#rDeleteBtn${ status.index }').click(function(){
						<c:url var="dc" value="deleteComment.cb">
							<c:param name="rNo" value="${b.rNo}"></c:param>
							<c:param name="clubName" value="${ c.clubName }"></c:param>
							<c:param name="userId" value="${ loginUser.userId }"></c:param>
							<c:param name="boardNo" value="${ c.boardNo }"></c:param>
						</c:url>
					if(confirm("댓글을 삭제하시겠습니까?")){
						$.ajax({
							url:"${dc}",
							success:function(){
								document.location.reload();
							}
							
						});
		   				// location.href="${dc}";
		   			}
			   		});

				</script>
				
				
		<!-- 대댓글 -->
		<div id="content5">
			<c:forEach var="a" items="${comment2}" varStatus="status">
			<c:if test="${a.rNo eq b.rNo }">
			<div class="rreply" id="rreply${ status.index }">
				<div id="info2">
					<c:if test="${!empty a.userFile }">
						<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${a.userFile}"></div>
					</c:if>
					<c:if test="${empty a.userFile }"> 
						<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
					</c:if>
					<div class="info"  id="rWriter">${a.nickname}</div>
					<div class="info"  id="rreplyDate">${a.rCreateDate}</div>
					<c:if test="${loginUser.userId eq a.rUserId }">
						<button type="button" class="btn" id="rrUpdateBtn">수정</button> 
						<button type="button" class="btn" id="rrDeleteBtn">삭제</button>
						<div style="display:none">${a.rNo}</div>
						<div style="display:none">${a.rrNo}</div>
						<div style="display:none">${ status.index }</div>
					</c:if> 
				</div>

				<textarea class="rContent${ status.index }" id="rrContent" readonly >${a.rContent}</textarea>
			</div>
			</c:if>
			</c:forEach>
		</div>		
				
				
			</c:forEach>
		</div>
	</div>		
	
		<jsp:include page="../common/Footer.jsp"/>
	
	
	
	<script type="text/javascript">
	
		/** 댓글 글자수 제한 **/
		$(document).on('keyup','.rWrite', function (e){
		    var content = $(this).val();
		    $(this).next().html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $(this).next().html("(200 / 최대 200자)");
		    }
		});
		
		$(document).on('keydown','.rWrite', function (e){
			var content = $(this).val();
		    $(this).next().html("("+content.length+" / 최대 200자)");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $(this).next().html("(200 / 최대 200자)");
		    }
		});
		
		
		/** textarea 높이 자동 조절 **/
		$(function () {
			
		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
		});

		

		
		

		
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
   		

   		
/* 댓글 추가 ajax */
   		$('#insertBtn').on('click', function(){
   			var userId = '${ loginUser.userId }';
   			var boardNo = ${ c.boardNo };
   			var content = $('#rWrite').val();  			
   			$.ajax({
   				url: 'insertComment.cb',
   				data: {userId:userId, boardNo:boardNo, content:content},
   				success: function(data){
   					document.location.reload();
   				}
   			});
   		})
/* 댓글 추가 후 수정버튼 이벤트 */   		
   		$(document).on('click', '#rUpdateBtnAjax',function(){
			$(this).parent().parent().css('display','none');
			$(this).parent().parent().next().css('display','inline-block');

		});

/* 댓글 추가 수정 후 삭제버튼 이벤트 */   		
   		$(document).on('click', '#rDeleteBtnAjax',function(){
   			var rNo = $(this).next().text();
   			var i = $(this).next().next().text();
   			if(confirm("댓글을 삭제하시겠습니까?")){
				
   			$.ajax({
   				url: 'deleteComment2.cb',
   				data: {rNo:rNo},
   				success: function(data){
   					$reply = $('#reply' + i);
   					$replyUpdate = $('#replyUpdate' + i);
					$reply.html("");
					$replyUpdate.html("");
					$reply.css('display', 'none');
					$replyUpdate.css('display', 'none');
   				}
			}); 
   		}	
   	});
   	
   	/* 댓글 추가 수정 후  수정 취소 */
   		$(document).on('click', '#rDeleteBtnC',function(){
   			$(this).parent().parent().hide();
   			$(this).parent().parent().prev().show();

   	});
   		
   		
/* 댓글 수정 */  		
		function updateReply(a, b){
  	   			var boardNo = ${ c.boardNo };
   				var rNo = b;
   				var content = $('.rrContent' + a).val();
   				var userId = '${ loginUser.userId }'
  	   			$.ajax({
  	   				url: 'updateComment.cb',
  	   				data: {boardNo:boardNo, content:content, rNo:b},
  	   				success: function(data){
  	   				document.location.reload();
   	   				}
   	   			});
   		}
		

   		/* 대댓글 입력창  */
   		$(document).on('click','#replyBtn', function(){
   			var $rreplyInsertTable = $(this).parent().parent(); /* 댓글 수정 창 */
   			$rreplyInsertTable.next().css('display','none');
   			var rreplys = '<div id="replyInput2">' +
						 '	<div id="info">' +
						 '		<c:if test="${!empty loginUser.userFile }">' +
						 '			<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${loginUser.userFile}"></div>' +
						 '		</c:if>' +
						 '		<c:if test="${empty loginUser.userFile }">' +
						 '			<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>' +
						 '	 	</c:if>' +
						 '			<div class="info"  id="rWriter">${ loginUser.nickName }</div>' +
						 '	</div>' +
						 '	<button class="btn" id="insertBtnRe" style="width:70px;">댓글 등록</button>' +
						 '  <div style="display:none;">' + $(this).next().text() + '</div>' +
						 '	<textarea class="rWrite" id="rrWrite" style="border:1px solid black; overflow: hidden; overflow-wrap: break-word; resize: none;" required  placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea>'  +
						 '	<span style="color:black;" id="counter">(0 / 최대 200자)</span>' +
						 '</div>'
   			$rreplyInsertTable.after(rreplys);
   		});
		
   		/* 대댓글 등록  */
   		$(document).on('click','#insertBtnRe', function(){
   			var userId = '${ loginUser.userId }';
   			var rNo = $(this).next().text();
   			var content = $(this).next().next().val();
   			$.ajax({
   				url: 'insertComment2.cb',
   				data: {userId:userId, rNo:rNo, content:content},
   				success: function(data){
   					document.location.reload();
   				}
   			});
   		})
   		
   		/* 대댓글 수정창  */
   		$(document).on('click','#rrUpdateBtn', function(){
   			var rrNo = $(this).next().next().next().text();
   			var i = $(this).next().next().next().next().text();
   			var $textarea = '<textarea class="rContent'+ i +'" id="rrContent" style="border:1px solid black; min-height:100px;" >'+$(this).parent().next().text() + '</textarea>';
   			$(this).after('<button type="button" class="btn" id="rrUpdateBtnCancel" style="width:70px;">수정 취소</button>')
   			$(this).after('<button type="button" class="btn" id="rrUpdateBtnSubmit" style="width:70px;">수정 완료</button>')

   			

   			
   			$(this).parent().next().remove();
   			$(this).parent().next().css('display','none'); 
   			$(this).parent().parent().append($textarea);
   			var content = $(this).parent().next().next().text();
   			$(this).next().next().next().remove();
   			$(this).remove();
   		   	});
   		
   		/* 대댓글 수정 */
   		$(document).on('click','#rrUpdateBtnSubmit', function(){
   			var content = $(this).parent().next().val();
   			var rrNo = $(this).next().next().next().text();
   			$.ajax({
   				url:"updateComment3.co",
   				data:{rrNo:rrNo, content:content},
   				success:function(){
   					document.location.reload();
   				}
   			});
   		});
   		
   		/* 대댓글 수정 취소 */
   		$(document).on('click','#rrUpdateBtnCancel', function(){
   			document.location.reload();
   		});
   		
 		/* 대댓글 삭제  */
   		$(document).on('click','#rrDeleteBtn', function(){
   			var rrNo = $(this).next().next().text();
   			var i = $(this).next().next().next().text();
   				if(confirm("댓글을 삭제하시겠습니까?")){
   					$.ajax({
   		   				url: 'deleteComment3.cb',
   		   				data: {rrNo:rrNo},
   		   				success: function(data){
   		   					$rreply = $('#rreply' + i);
   		   					$rreply.html("");
							$rreply.css('display', 'none');
   		   				}
   					}); 
   		   		}	
   		   	}); 		
   		
   		
   		// 댓글 좋아요
   		$('.likeBtn').click(function(){
   			var rNo = $(this).prev().text();
   			var userId = '${ loginUser.userId }';
   			var thisBtn = $(this);
   			$.ajax({
   				url:"CommentLike.co",
   				data:{rNo:rNo, userId:userId},
   				success: function(){
   					thisBtn.parent().children('.likeBtn2').css('display','inline-block');
   					thisBtn.css('display','none');
   					var count = thisBtn.parent().children('.likeCount').text(); 
   					count *= 1;
   					count = count + 1;
   					thisBtn.parent().children('.likeCount').text(count);
   				}
   			});
		}); 
   		
   		$(document).on('click', '.likeBtn3',function(){
			$(this).parent().children('.likeBtn4').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text(); 
			count *= 1;
			count = count + 1;
			$(this).parent().children('.likeCount').text(count);
		}); 
		
   		// 댓글 좋아요 취소
		$('.likeBtn2').click(function(){
			var rNo = $(this).prev().prev().text();
   			var userId = '${ loginUser.userId }';
   			var thisBtn = $(this);
			$.ajax({
				url:"CommentNotLike.co",
   				data:{rNo:rNo, userId:userId},
   				success: function(){
   					thisBtn.parent().children('.likeBtn').css('display','inline-block');
   					thisBtn.css('display','none');
   					var count = thisBtn.parent().children('.likeCount').text();
   					count *= 1;
   					count = count - 1;
   					thisBtn.parent().children('.likeCount').text(count);
   				}
   			});
		});
		
		$(document).on('click', '.likeBtn4', function(){
			$(this).parent().children('.likeBtn3').css('display','inline-block');
			$(this).css('display','none');
			var count = $(this).parent().children('.likeCount').text();
			count *= 1;
			count = count - 1;
			$(this).parent().children('.likeCount').text(count);
		});
		
		

		

	</script> 

</body>
</html>
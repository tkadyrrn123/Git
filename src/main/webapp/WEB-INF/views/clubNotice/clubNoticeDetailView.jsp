<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<link rel=" shortcut icon" href="resources/images/favicon.png">
<link rel="icon" href="resources/images/favicon.png">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
/* 좋아요버튼 */
    .likeBtn{margin-left: 15px; margin-top:10px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}  
 	.likeBtn2{margin-left: 15px; margin-top:10px; width: 3%; height:3%; vertical-align: middle; display:none;} 
 	
 	#likeBtn3{margin-left: 20px; width: 3%; height:3%; vertical-align: middle; display: inline-block;}   
 	#likeBtn4{margin-left: 20px; width: 3%; height:3%; vertical-align: middle; display:none;}  
 	#likeImg{width: 100%; height:100%;}  
 	#likeImg2{width:100%; height:100%;}    
 	#likeImg3{width: 100%; height:100%;}  
 	#likeImg4{width:100%; height:100%;}    
 	.likeCount{display: inline-block; vertical-align: sub; margin-left: 10px;}

/* 바디 */
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 95px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
 	.detailTable_title{margin-left: 10px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}
	.img {filter: brightness(70%); width: 100%; height: 400px;}	
	.nDongview{color:lightcoral; margin-left: 60px; margin-bottom: 20px;}
	
/* 글내용 */
	.board_content{width: 800px;    height: auto;    margin-left: 100px;    margin-top: 40px;    margin-bottom: 40px;}

 /*수정삭제  */
	.pop{padding:5px 0px; cursor: pointer;}
 	.pop:hover label{background-color: lightgray;}
 	#popup{width: 100px; height: 65px; position: absolute; top: 80px; right: 18px; background-color: white; text-align: center;
			    border: 1px solid #d5d5d5; border-radius: 3px; box-shadow: rgba(0,0,0,.1) 0 1px 1px 0; display: none;}
	.fa-ellipsis-v{font-size:25px; display:inline; float: right; margin-top: 15px; margin-right: 20px; background-color: white;
				border: none; cursor: pointer;}
 	
/* 목록으로 가기 버튼 */
	.go_list_box{text-align: right;padding-right: 50px;}
	.go_list{width:70px; height:25px; background-color:lightgray; border:0; outline:0; border-radius:0.34em; cursor: pointer;}		

/* 댓글작성 */
	.reply1_box{width: 800px; margin-left: 100px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: dotted; border-color: rgb(201, 232, 255);}
	.comment_img{width: 38px; height: 38px; border-radius: 100%; margin-top: 5px; margin-left: 10px; margin-bottom: 5px; margin-right: 10px; vertical-align: middle;}
	.dong{line-height:3; display: inline; margin-left: 10px; margin-right: 10px;}
	.dong2{display: inline; margin-left: 10px; margin-right: 10px;}
	/* 댓글등록버튼  */
	.reply1_btn{margin-right: 15px; float:right; width:70px; height:25px; background-color:lightgray; color:white; border:0; outline:0; border-radius:0.34em; cursor: pointer; margin-top: 10px;}
	/* 댓글 textarea */	
	.reply{width: 800px; margin-left: 100px; margin-top: 8px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: solid; border-color: rgb(201, 232, 255);}
	#rCount{margin-left: 5px;}
	#rWrite{border-radius:0.34em; border-color: lightgrey; resize:none; margin-left: 10px; margin-top: 20px;}	
	.rWrite{border-radius:0.34em; border-color: lightgrey; resize:none; margin-left: 10px; margin-top: 20px;}	
	.info{display: inline-block;} 	
	#info{display: inline-block;} 	
	.commnuity_header { position: absolute;
						left: 45%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
	
	
	
	.fa-comment-dots{margin-left: 7px; color: #62b3b6;}
	.Reply_list_title{margin-left: 120px; color: #62b3b6; margin-top: 10px; margin-bottom: 10px;}
/* 원댓글  */
	#rWriter{display: inline; margin-left: 10px; margin-right: 10px;}
	#replyDate{margin-left: 10px; color: gray;}

/* 	.replyDate{display: inline; margin-left: 10px; margin-right: 10px;} */

/* 댓글 입력창 */

	.update_btn{margin-right: 10px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	.delete_btn{margin-right: 10px; margin-left: 15px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	.counter{color:#aaa; float: right; margin-top: 80px; margin-right: 15px;}
	.counter2{color:#aaa; float: right; margin-right: 15px; margin-top: 85px;}
	 
/* 대댓글  */	
	#replyInput2{margin-top: 10px; width: 800px; height: auto; margin-left: 100px; padding-left: 10px; padding-right: 10px; 
	padding-top: 10px; padding-bottom: 10px;border: dotted; border-color: rgb(201, 232, 255);}
	#replyInput2{width: 760px; 
/*      height: auto;  */
     margin-left: 140px; 
     background-color: rgb(201, 232, 255); 
     padding-left: 10px; 
     padding-right: 10px; 
     padding-top: 10px; 
     padding-bottom: 10px; 
     margin-top: 8px;}
 	.rreply{width: 760px; 
/*      height: auto;  */
     margin-left: 140px; 
     background-color: rgb(201, 232, 255); 
     padding-left: 10px; 
     padding-right: 10px; 
     padding-top: 10px; 
     padding-bottom: 10px; 
     margin-top: 8px;}
	
	.re_reply_btn{margin-right: 10px;
    background-color: rgb(201, 232, 255);
    cursor: pointer;
    padding: 7px;
    width: 65px;
    float: right;
    border: 0px;
    border-radius: 6px;
    }
 
</style>
</head>
<body>
<img class="img" src="resources/images/noticeImage.jpg">
<jsp:include page="../common/menubar.jsp"/>
<div class="commnuity_header">
	<h2 style="font-weight:700;">동호회 공지사항</h2>
	</div>
	<div class="outer">
	<!----------- 게시글 상단부 시작  ---------->	
		<br>
		<h2 style="margin-left: 15px;">동호회 공지사항 상세보기</h2>
		<hr>
		<br>
		<div class="nDongview"><i class="fas fa-crown"></i>  ${ cn.clubName } </div>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div class="detailTable_title">${ cn.cnTitle }</div>
				<div id="notice_profile" style="float:left;display:inline;">
					<c:if test="${!empty cn.cnoticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ cn.cnoticeFile }">
					</c:if>
					<c:if test="${empty cn.cnoticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg">
					</c:if>
                 </div> 
				<div class="dong">${ cn.cnoticeNickname }</div>
				
				<div style="display:inline;"><i class="far fa-clock" style="margin-right: 10px;"></i>${ cn.cnCreateDate }</div>
				
				<div style="display:inline;"><i class="far fa-eye" style="margin-right: 10px;"></i>${ cn.cnCount }</div>
	<!-------------수정 /삭제 선택 -------------->	
				<c:if test="${ loginUser.userId eq cn.userId }">
				<i class="fas fa-ellipsis-v"></i>
				<div id="popup">
						<c:url var="cnModify" value="ClubNoticeUpdateView.cn">
							<c:param name="page" value="${ page }"/>
							<c:param name="cnNo" value="${ cn.cnNo }"/>
						</c:url>
						<c:url var="cnDelete" value="ClubNoticeDelete.cn">
							<c:param name="cnNo" value="${ cn.cnNo }"/>
						</c:url>
					<div class="pop" onclick="location.href='${ cnModify }'"><label>수정</label></div>
					<div class="pop" onclick="location.href='${ cnDelete }'"><label>삭제</label></div>
				</div>
				</c:if>
				<hr>
			</div>
		<!---------- 게시글 상단부 끝  ----------->	
		<!---------- 게시글 내용  ----------->
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			<div class="board_content">${ fn:replace( cn.cnContent, newLineChar, "<br>") }</div>
		<!---------- 게시글 내용 끝 ------------>	
		<!-------- 첨부파일 O 때 ------------>		
			<c:if test="${ !empty cn.renameFileName }">
				<div>
					<img src="${contextPath}/resources/uploadFiles/${ cn.renameFileName }" style="width: 850px; margin-left:50px;">
				</div>
			</c:if>
		<!---------- 첨부파일 O 끝  ---------->		
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록" onclick="location.href='clubNoticeList.cn'">
			</div>
			<br>
 		<!-------------댓글 작성  ------------>
			<div class="reply1_box" id="rtb">
				<div id="notice_profile" style="float:left;display:inline;">
					<c:if test="${!empty cn.cnoticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ cn.cnoticeFile }">
					</c:if>
					<c:if test="${empty cn.cnoticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg">
					</c:if>
                 </div> 
				<div class="dong">${ loginUser.userId }</div>
					<input type="button" id="insertBtn" class="reply1_btn" value="댓글등록">
				<div style="margin-left: 10px; margin-top: 12px;">
					<textarea id="rWrite" class="rWrite" cols="92" rows="4" placeholder="댓글을 입력해주세요."></textarea>
				<div class="counter" id="counter">0/200</div>
				</div>
			</div>
 		<!-------------댓글 작성  끝------------>
			<div class="Reply_list_title">Reply list<i class="far fa-comment-dots"></i><span id="rCount"></span></div>
	<!-------------댓글 가져오기 ------------>
<!-- 도훈쓰 코드 시작  -->
		<div id="content4">
			<c:forEach var="b" items="${comment}" varStatus="status">
				<div class="reply" id="reply${ status.index }">
					<div id="info2">
						<c:if test="${!empty b.userFile }">
							<img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${b.userFile}">
						</c:if>
						<c:if test="${empty b.userFile }"> 
							<img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg">
						</c:if>
							<div class="info"  id="rWriter">${b.nickname}</div>
							<div class="info"  id="replyDate">${b.rCreateDate}</div>
						<c:if test="${loginUser.userId eq b.rUserId }">
							<button type="button" class="update_btn" id="rUpdateBtn${ status.index }">수정</button> 
							<button type="button" class="delete_btn" id="rDeleteBtn${ status.index }">삭제</button>
							<div style="display:none">${b.rNo}</div>
						</c:if>
					</div>

						<textarea id="rWrite" class="rContent${ status.index }" readonly cols="92" rows="4">${b.rContent}</textarea>
 
					<div> 
						<button class="re_reply_btn" id="replyBtn">답글</button>
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
							<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${b.userFile}"></div>
						</c:if>
						<c:if test="${empty b.userFile }">
							<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
						</c:if>
							<div class="info"  id="rWriter">${b.nickname}</div>
							<div class="info"  id="replyDate">${b.rCreateDate}</div>
						<c:if test="${loginUser.userId eq b.rUserId }">
							<button class="update_btn" id="rUpdateBtnC" onclick="updateReply(${ status.index }, ${b.rNo })" >수정완료</button> 
							<button class="update_btn" id="rDeleteBtnC${ status.index }">수정취소</button>
						</c:if>
					</div>

						<textarea id="rWrite" class="rrContent${ status.index }" cols="92" rows="4">${b.rContent}</textarea>
				</div>
				
	
				
				
				
  				<script>
				$(function () {
// 					$('.rContent${ status.index }').height(1).height( $('.rContent${ status.index }').prop('scrollHeight') + 32  );
// 					$('.rrContent${ status.index }').height(1).height( $('.rContent${ status.index }').prop('scrollHeight') + 32  );
					  
					  
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
						<c:url var="dc" value="deleteComment.cn">
							<c:param name="rNo" value="${b.rNo}"></c:param>
							<c:param name="clubName" value="${ cn.clubName }"></c:param>
							<c:param name="userId" value="${ loginUser.userId }"></c:param>
							<c:param name="cnNo" value="${ cn.cnNo }"></c:param>
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
			<div id="content5" class="rreply" id="rreply${ status.index }">
				<div id="info2">
					<c:if test="${!empty a.userFile }">
						<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${a.userFile}"></div>
					</c:if>
					<c:if test="${empty a.userFile }"> 
						<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
					</c:if>
					<div class="info"  id="rWriter">${a.nickname}</div>
					<div class="info"  id="rreplyDate">${a.rCreateDate}</div>
					<c:if test="${loginUser.userId eq a.rUserId }">
						<button type="button" class="update_btn" id="rrUpdateBtn">수정</button> 
						<button type="button" class="delete_btn" id="rrDeleteBtnAjax">삭제</button>
						<div style="display:none">${a.rNo}</div>
						<div style="display:none">${a.rrNo}</div>
						<div style="display:none">${ status.index }</div>
					</c:if> 
				</div>

				<textarea id="rWrite" class="rContent${ status.index }" id="rrContent" readonly cols="87" rows="4">${a.rContent}</textarea>
			</div>
			</c:if>
			</c:forEach>
		</div>		
				
			</c:forEach>
		</div>
<!-- 도훈쓰 코드 끝 -->		
	</div>
	<script>
	/* 게시글 수정 삭제 보이기 */
	$(".fa-ellipsis-v").click(function(){
           var submenu = $(this).next();
              // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
              console.log(submenu);
                  
               if(submenu.css("display") == "none"){
               	submenu.show();
      	        }else{
      	        	submenu.hide();
      	        }
     });
	
	
		/** 댓글 글자수 제한 **/
		$(document).on('keyup','.rWrite', function (e){
		    var content = $(this).val();
		    $(this).next().html(content.length+"/200");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $(this).next().html("200/200");
		    }
		});
		
		$(document).on('keydown','.rWrite', function (e){
			var content = $(this).val();
		    $(this).next().html(content.length+"/200");    //글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $(this).next().html("200/200");
		    }
		});
		
		
		/** textarea 높이 자동 조절 **/
// 		$(function () {
			
// 		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
// 		});
	
			
	/* 댓글 추가 ajax */
			$('#insertBtn').on('click', function(){
				var userId = '${ loginUser.userId }';
				var cnNo = ${ cn.cnNo };
				var content = $('#rWrite').val();  			
				$.ajax({
					url: 'insertComment.cn',
					data: {userId:userId, cnNo:cnNo, content:content},
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
					url: 'deleteComment2.co',
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
		   			var cnNo = ${ cn.cnNo };
					var rNo = b;
					var content = $('.rrContent' + a).val();
					var userId = '${ loginUser.userId }'
		   			$.ajax({
		   				url: 'commentUpdate.cn',
		   				data: {cnNo:cnNo, content:content, rNo:b},
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
						 '			<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${loginUser.userFile}"></div>' +
						 '		</c:if>' +
						 '		<c:if test="${empty loginUser.userFile }">' +
						 '			<div class="info" id="rProfile"><img class="comment_img" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>' +
						 '	 	</c:if>' +
						 '			<div class="info"  id="rWriter">${ loginUser.nickName }</div>' +
						 '	</div>' +
						 '	<button class="update_btn" id="insertBtnRe" style="width:70px;">댓글 등록</button>' +
						 '  <div style="display:none;">' + $(this).next().text() + '</div>' +
						 '	<textarea class="rWrite" id="rrWrite" cols="87" row="4" style=" margin-left: 10px; margin-top: 10px; border-radius: 0.34em; border-color: lightgrey; overflow: hidden; overflow-wrap: break-word; resize: none;" required  placeholder="댓글을 입력해주세요."></textarea>'  +
						 '	<span style="color:black;" class="counter" id="counter">0/200</span>' +
						 '</div>'
				$rreplyInsertTable.after(rreplys);
			});
		
			/* 대댓글 등록  */
			$(document).on('click','#insertBtnRe', function(){
				var userId = '${ loginUser.userId }';
				var rNo = $(this).next().text();
				var content = $(this).next().next().val();
				$.ajax({
					url: 'insertComment2.co',
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
				var $textarea = '<textarea class="rContent'+ i +'" id="rrContent" cols="87" row="4" style="margin-left: 10px; margin-top: 20px; border-radius: 0.34em; border-color: lightgrey; overflow: hidden; overflow-wrap: break-word; resize: none;">'+$(this).parent().next().text() + '</textarea>';
				$(this).after('<button type="button" class="update_btn" id="rrUpdateBtnCancel" style="width:70px;">수정 취소</button>')
				$(this).after('<button type="button" class="update_btn" id="rrUpdateBtnSubmit" style="width:70px;">수정 완료</button>')
	
				
	
				
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
			$(document).on('click','#rrDeleteBtnAjax', function(){
				var rrNo = $(this).next().next().text();
				var i = $(this).next().next().next().text();
				
				console.log(rrNo);
				console.log($(this).next().next().next().text());
				
					if(confirm("댓글을 삭제하시겠습니까?")){
						$.ajax({
			   				url: 'deleteComment3.co',
			   				data: {rrNo:rrNo},
			   				success: function(data){
			   					$rreply = $('#rreply' + i);
			   					$rreply.html("");
							$rreply.css('display', 'none');
							document.location.reload();
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

	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
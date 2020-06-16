<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 공지사항 상세보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 95px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
 	.detailTable_title{margin-left: 10px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}
	.img {filter: brightness(70%); width: 100%; height: 400px;}	
	.clubNameview{color:lightcoral; margin-left: 60px; margin-bottom: 20px;}
	
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
	.reply1_box{width: 800px; height: auto; margin-left: 100px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: dotted; border-color: rgb(201, 232, 255);}
	.comment_img{width: 38px; height: 38px; border-radius: 100%; margin-top: 5px; margin-left: 10px; margin-bottom: 5px; margin-right: 10px; vertical-align: middle;}
	.dong{line-height: 50px; display: inline; margin-left: 10px; margin-right: 10px;}
	.reply1_btn{margin-right: 15px; float:right; width:70px; height:25px; background-color:lightgray; color:white; border:0; outline:0; border-radius:0.34em; cursor: pointer; margin-top: 10px;}
	.reply_TEXT{margin-right: 15px; border-radius:0.34em; border-color: lightgrey; resize:none;}
	.update_reply_TEXT{border-radius:0.34em; border-color: lightgrey; resize:none;}

/* 원댓글  */	
	.reply2_box{width: 800px; height: auto; margin-left: 100px; margin-top: 8px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: solid; border-color: rgb(201, 232, 255);}
	
	.update_btn{margin-right: 15px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	
	.delete_btn{margin-right: 10px; margin-left: 15px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	.counter{color:#aaa; float: right; margin-top: 45px; margin-right: 15px;}
	
	.fa-thumbs-up{cursor: pointer; float: right; margin-top: 10px; margin-right: 10px;}
	 
/* 대댓글  */	
	.reply3_box{width: 763px; height: auto; margin-left: 140px; background-color: rgb(201, 232, 255); padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; margin-top: 8px;}
 	
</style>
</head>
<body>
<img class="img" src="resources/images/noticeImage.jpg">
<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<form>
	<!----------- 게시글 상단부 시작  ---------->	
		<br>
		<h2 style="margin-left: 15px;">동호회 공지사항 상세보기</h2>
		<hr>
		<br>
		<div class="clubNameview"><i class="fas fa-crown"></i>  ${ ClubNotice.clubName } </div>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div class="detailTable_title">${ ClubNotice.cnTitle }</div>
				
				<div id="notice_profile" style="float:left;display:inline;">
					<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ ClubNotice.cnoticeFile }"></div>
				
				<div class="dong">${ ClubNotice.cnoticeNickname }</div>
				
				<div style="display:inline;"><i class="far fa-clock"></i>${ ClubNotice.cnCreateDate }</div>
				
				<div style="display:inline;"><i class="far fa-eye"></i>${ ClubNotice.cnCount }</div>
	<!-------------수정 /삭제 선택 -------------->	
				<c:if test="${ loginUser.userId eq ClubNotice.userId }">
				<i class="fas fa-ellipsis-v"></i>
				<div id="popup">
						<c:url var="cnModify" value="ClubNoticeUpdateView.cn">
							<c:param name="page" value="${ page }"/>
							<c:param name="cnNo" value="${ ClubNotice.cnNo }"/>
						</c:url>
						<c:url var="cnDelete" value="ClubNoticeDelete.cn">
							<c:param name="cnNo" value="${ ClubNotice.cnNo }"/>
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
			<div class="board_content">${ fn:replace( ClubNotice.cnContent, newLineChar, "<br>") }</div>
		<!---------- 게시글 내용 끝 ------------>	
		<!-------- 첨부파일 O 때 ------------>		
			<c:if test="${ !empty ClubNotice.renameFileName }">
				<div>
					<img src="${contextPath}/resources/uploadFiles/${ ClubNotice.renameFileName }" style="width: 850px; margin-left:50px;">
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
				<div id="notice_profile" style="float: left; display: inline;">
					<img id="userFile" class="comment_img" src="${contextPath}/resources/uploadFiles/${ ClubNotice.cnoticeFile }">
				</div>
				<div class="dong">${ loginUser.userId }</div>
					<input type="button" id="rSubmit" class="reply1_btn" value="댓글등록">
				<div style="margin-left: 10px; margin-top: 12px;">
					<textarea id="rContent" class="reply_TEXT" name="reply_TEXT" cols="95" rows="4" placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea>
				<div class="counter" id="counter">(0/200자)</div>
				</div>
			</div>
		<!-------------댓글 작성  끝------------>
		<!-------------댓글 가져오기 ------------>	
			<div id="noticeComment_outer">
			</div>
		<!-------------댓글 가져오기 끝------------>			
		</form>
	</div>
	
	<script>
	
	// 댓글 등록 textarea 체크
	$('.reply_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+"/200자)");//글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("(200/200자)");
	    }
	});
	
	// 댓글 수정 update textarea 체크
	$('.update_reply_TEXT').keyup(function (e){
	    var content = $(this).val();
	    console.log(content);
	    $('#update_counter').html("("+content.length+"/200자)");//글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#update_counter').html("(200/200자)");
	    }
	});
	
	/* 수정 삭제 보이기 */
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
	
// 	// 댓글 리스트 불러오기
// 	function getCommentList(){
// 		var cnNo = ${ ClubNotice.cnNo };
		
// 		$.ajax({
// 			url: 'cList.cn',
// 			data: {cnNo:cnNo},
// 			dataType: 'json',
// 			success: function(data){
				
// 				$noticeComment_outer = $('#noticeComment_outer');
// 				$noticeComment_outer.html('');
				
// 				var $div;
// 				var $userFile;
// 				var $rUserId;
// 				var $rContent;
// 				var $rCreateDate;
				
// 				var $rModify;
// 				var $rDelete;
				
// 				if(data.length > 0){
// 					for(var i in data){
						
// 						$div = $('<div id="noticeComment'+data[i].rNo+'" class="reply2_box">');
// 						$div_userFile = $('<div style="float:left;display:inline;">');
// 						$userFile = $('<img class="comment_img" src="${contextPath}/resources/uploadFiles/'+data[i].userFile+'">');
						
// 						if("${loginUser.userId}"== data[i].rUserId){
// 							$rModify = $('<a class="update_btn" onclick="commentUpdateForm('+data[i].rNo+',\''+data[i].rContent+'\');"> 수정 </a>');
// 							$rDelete = $('<a class="delete_btn" onclick="commentDelete('+data[i].rNo+');"> 삭제 </a> </div>');
// 						}else{
// 							$rModify = "";
// 							$rDelete = "";
// 						}
						
// 						$rUserId = $('<div class="dong">').text(data[i].rUserId);
// 						$rContent = $('<div class="rContent'+data[i].rNo+'" style="margin-left: 10px; margin-top: 10px; margin-bottom: 10px;">').text(data[i].rContent.replace(/\+/g, ' '));
// 						$rCreateDate = $('<div style="margin-left: 10px; color: gray;">').text(data[i].rCreateDate);

// 						$div.append($userFile);
// 						$div.append($rUserId);
						
// 						$div.append($rModify);
// 						$div.append($rDelete);
						
// 						$div.append($rContent);
// 						$div.append($rCreateDate);
// 						$noticeComment_outer.append($div);
// 					}
// 				}else{
// 					$div = $('<div id="noticeComment" class="reply2_box">');
// 					$rContent = $('<div style="text-align: center;">').text('등록된 댓글이 없습니다.');
					
// 					$div.append($rContent);
// 					$noticeComment_outer.append($div);
// 				}

// 			}
// 		});
// 	}
// 	$(function(){
// 		getCommentList();
		
// 		setInterval(function(){
// 			getCommentList();
// 		}, 1000);
// 	});
	
// 	//댓글 등록
// 	$('#rSubmit').on('click', function(){
// 		var rContent = $("#rContent").val(); //댓글내용
// 		var noticeNo = ${ notice.nNo }; //댓글이 참조하는 공지번호
		
		
// 		$.ajax({
// 			url:'addNoticeComment.no',
// 			data:{rContent:rContent, noticeNo:noticeNo},
// 			success: function(data){
				
// 				if(data == 'success'){
// 					getCommentList();
// 					$('#rContent').val('');
// 				}
// 			}
// 		});
// 	});
	
// 	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
// 	function commentUpdateForm(rNo, rContent){
// 	    var a ='';
	    
// 	    a += '<div class="input-group">';
// 	    a += '<div>';
// 	    a += '<textarea name="rContent_'+rNo+'" class="update_reply_TEXT" id="update_reply_TEXT_'+rNo+'" cols="95" rows="4" onkeyup="plus('+rNo+');">'+rContent+'</textarea>';
//  	    a += '<div class="counter" id="update_counter">(0/200자)</div>';
// 	    a += '<i class="fas fa-check" onclick="commentUpdate('+rNo+');"></i>';
// 	    a += '</div>';
	    
// 	    $('.rContent'+rNo).html(a);
	    
// 	}
	
// 	function plus(rNo){
// 	    var content = $("#update_reply_TEXT_"+rNo+"").val();
// 	    console.log(content);
// 	    $('#update_counter').html("("+content.length+"/200자)");//글자수 실시간 카운팅

// 	    if (content.length > 200){
// 	        alert("최대 200자까지 입력 가능합니다.");
// 	        $(this).val(content.substring(0, 200));
// 	        $('#update_counter').html("(200/200자)");
// 	    }
// 	}
	
// 	//댓글 수정
// 	function commentUpdate(rNo){
// 	    var updateContent = $('[name=rContent_'+rNo+']').val();
	    
// 	    $.ajax({
// 	        url : 'commentUpdate.no',
// 	        dataType: 'json',
// 	        data : {'rContent' : updateContent, 'rNo' : rNo},
// 	        success : function(data){
// 	        	console.log(data);
// 	            if(data == 1) getCommentList(rNo); //댓글 수정후 목록 출력 
// 	        }
// 	    });
// 	}
	
// 	//댓글 삭제 
// 	function commentDelete(rNo){
// 		 var deleteCf = confirm("정말 삭제하시겠습니까?")
		
// 	    $.ajax({
// 	        url : 'commentUpdate.no'+rNo,
// 	        dataType: 'json',
// 	        success : function(data){
	           
// 	            if(deleteCf==true && data == 1) getCommentList(rNo); //댓글 삭제후 목록 출력 
	            
// 	        }
// 	    });
// 	}
	
	
	</script>
	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
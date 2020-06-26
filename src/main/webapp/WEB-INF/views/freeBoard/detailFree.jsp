<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판-상세보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.img { 
     filter: brightness(70%);
     width: 100%;
     height: 400px;
}
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-top: 70px; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 95px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
 	.detailTable_title{margin-left: 10px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}

/* 글내용 */
	.board_content{width: 800px;    height: auto;    margin-left: 100px;    margin-top: 40px;    margin-bottom: 40px;}

 /* 수정삭제  */
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
	.reply1_box{width: 800px; height: 180px; margin-left: 100px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: 1px dotted; border-color: rgb(201, 232, 255);}
	.profileImg{width: 38px; height: 38px; border-radius: 100%; margin-top: 5px; margin-left: 10px; margin-bottom: 5px; margin-right: 10px; vertical-align: middle;}
	.dong{line-height: 50px; display: inline; margin-left: 10px; margin-right: 10px;}
	.reply1_btn{float:right; width:70px; height:25px; background-color: navy; color:white; border:0; outline:0; border-radius:0.34em; cursor: pointer; margin-top: 10px;}
	.reply_TEXT{border-radius:0.34em; border-color: lightgrey; resize:none;}

/* 원댓글  */	
	.reply2_box{width: 800px; height: auto; margin-left: 100px; margin-top: 8px; padding-left: 10px; 
				padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: 1px solid; border-color: rgb(201, 232, 255);}
	.reply2_box_btn{cursor: pointer; float: right; margin-top: 15px; margin-right: 15px; border:0;}
	.reply2_box_btn2{cursor: pointer;margin-left: 10px; margin-top: 10px; margin-bottom: 10px;  border:0; outline:0;}
	.fa-thumbs-up{cursor: pointer; float: right; margin-top: 10px; margin-right: 10px;}
	.rOuter{border-color: red;}
	.nickname{display: inline-block;}
	.mdBtn{border: none; color: gray; margin-right: 5px;}
/* 대댓글  */	
	.reply3_box{width: 763px; height: auto; margin-left: 140px; background-color: rgb(201, 232, 255); padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; margin-top: 8px;}
 	
 	#rtb{border: 1px solid black;}
</style>
</head>
<body>

<img class="img" src="resources/images/noticeImage.jpg">
<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<form>
			<!-- 게시글 상단부 시작  -->	
			<br>
			<h4 style="margin-left: 15px; color: gray;">자유게시판 상세보기</h4>
			<hr>
			<br>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div class="detailTable_title">
					<b>${ fb.boardTitle } </b>
				</div>
				<c:if test="${ !empty loginUser.userFile }">
					<div id="cdt_profile" style="float:left;display:inline;">
						<img class="profileImg" src="${ contextPath}/resources/uploadFiles/${ fb.userFile} ">
					</div>
				</c:if>
				<c:if test="${ empty loginUser.userFile }">
					<div id="cdt_profile" style="float:left;display:inline;">
						<img class="profileImg" src="${ contextPath}/resources/images/로고.png">
					</div>
				</c:if>
					<div class="dong">${ fb.nickname }</div>
					<div style="display:inline;"><i class="far fa-clock"></i> ${ fb.createDate }</div>
					<div style="display:inline;"><i class="far fa-eye"></i> ${ fb.boardCount }</div>
				<!--수정 /삭제 선택 -->	
		<c:url var="bdelete" value="bdelete.fr">
			<c:param name="boardNo" value="${ fb.boardNo }"/>
		</c:url>
		<c:url var="modifyView" value="modifyView.fr">
			<c:param name="boardNo" value="${ fb.boardNo }" />
			<c:param name="page" value="${ page }" />
		</c:url>
			<c:if test="${ loginUser.userId eq fb.userId }">
				<i class="fas fa-ellipsis-v"></i>
				<div id="popup">
					<div class="pop"><label onclick="location.href='${ modifyView }'">수정</label></div>
					<div class="pop"><label onclick="deleteMsg();">삭제</label></div>
				</div>
			</c:if>
				<hr>
			</div>
		<!-- 게시글 상단부 끝  -->	
		
		
		<!-- 첨부파일 -->
		<c:if test="${ !empty fb.fileName }">
			<img src="${ contextPath}/resources/buploadFiles/${ fb.fileName} ">
			<a href="${ contextPath }/resources/buploadFiles/${ fb.fileName }">
				${ fb.fileName }
			</a>
		</c:if>
		<!-- 게시글 내용  -->
			<div class="board_content">
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			${ fn:replace(fb.boardContent, newLineChar, "<br>") }
			</div>
		<!-- 게시글 내용 끝 -->	
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록" onclick="location.href='list.fr'">
			</div>
			<br>
			<!--댓글 작성  -->
			<div class="reply1_box">
				<c:if test="${ !empty loginUser.userFile }">
					<div id="cdt_profile" style="float: left; display: inline;">
						<img class="profileImg" src="<%=request.getContextPath()%>/resources/uploadFiles/${ loginUser.userFile }">
					</div>
				</c:if>
				<c:if test="${ empty loginUser.userFile }">
					<div id="cdt_profile" style="float: left; display: inline;">
						<img class="profileImg" src="<%=request.getContextPath()%>/resources/images/로고.png">
					</div>
				</c:if>
				<div class="dong">${ loginUser.nickName }</div>
					<input type="button" class="reply1_btn" value="댓글등록" id="rSubmit">
				<div style="margin-left: 10px; margin-top: 12px;">
					<textarea id="rContent" class="reply_TEXT" name="reply_TEXT" cols="105" rows="4" placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea>
				</div>
				<div style="color:#aaa; float: right;" id="counter">(0/200자)</div>
			</div>
			<!--원 댓글  -->
			<div class="rOuter">
<%--		<div class="reply2_box" id="replyBox">
 				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="comment2-1img" src="<%=request.getContextPath()%>/resources/uploadFiles/">
				</div>
				<div class="dong" id="nickname">닉네임공간(202동)</div>
					<input type="button" value="삭제" class="reply2_box_btn">
					<input type="button" value="수정" class="reply2_box_btn">
				<div class="rContent" style="margin-left: 10px;" id="content">댓글 내용 공간</div>
				<div style="margin-left: 10px; color: gray;" id="createDate">날짜공간</div>
				<input type="button" value="답글" class="reply2_box_btn2">
			</div>
--%>

			</div>
			<table class="replyTable" id="rtb">
				<thead>
					<tr>
						<td colspan="2"><b id="rrCount"></b></td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>								
			<!-- 대 댓글 -->			
<%-- 			<div class="reply3_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="profileImg"src="${ contextPath }/resources/images/로고.png">
				</div>
				<div class="dong">뾰로롱</div>
					<input type="button" value="삭제" class="reply2_box_btn">
					<input type="button" value="수정" class="reply2_box_btn">
				<div style="margin-left: 10px;">와! 이런식으로 어쩌구 저쩌구한 투표결과를 보니 좋네요!</div>
				<div style="margin-left: 10px; color: gray;">2020.2.29. 19:16</div>
				<input type="button" value="답글" class="reply2_box_btn2">
			</div> --%>
		</form>
	</div>
	<script>
	/* 웹소켓  */
	var bNo = '${ fb.boardNo }';
	var replyWriter = '${ loginUser.userId }';
	var BoardWriter = '${ fb.userId }';
	
	$(function(){
			$('#rSubmit').on('click', function(evt) {
				  evt.preventDefault();
			  	if (socket.readyState !== 1) return;
			    	  let msg = $('#rContent').val();
			    	  
			    	  if(socket){
			    		  let socketMsg = "free," + replyWriter + "," + BoardWriter + "," + bNo;
			    		  console.log(socketMsg);
			    		  socket.send(socketMsg);
			    	  }
			    });
		});
	</script>
	
	
	
	
	<script>
	$(function(){
		getRereList();
	});
	
 	function getRereList(){
		var boardNo = ${ fb.boardNo};
		
/* 		$.ajax({
			url: 'rereList.fr',
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(data){
				console.log(data);
				$tableBody = $('#rtb tbody');
				$tableBody.html('');
				$rOuter = $('.rOuter');
				$rereTable = $('.replyTable');
				
				var $div;
				var $tr;
				var $nickname;
				var $rContent;
				var $rCreateDate;
				
				if(data.length > 0){
					for(var i in data){
						$div = $('<div class="reply2_box" id="replyBox'+data[i].rNo+'">');
						
						$tr = $('<tr>');
						$nickname = $('<td width="100">').text(data[i].nickname);
						$rContent = $('<td>').text(data[i].rContent.replace(/\+/g, ' '));
						$rCreateDate = $('<td width="100">').text(data[i].rCreateDate);
						
						$tr.append($nickname);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
						
					
					}
				}
			}
		}); */
	} 
	
	$(function(){
		getReplyList();
		
// 		setInterval(function(){
// 			getReplyList();
// 		}, 1000); 
	});	
	
	function getReplyList(){
		var boardNo = ${ fb.boardNo };
		
		$.ajax({
			url: 'rList.fr',
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(data){
			//	console.log(data);
				$rOuter = $('.rOuter');
				$rOuter.html('');
				
				var $div;
				var $profileImg;
				var $nickname;
				var $rContent;
				var $rCreateDate;
				var $noprofileImg = $('<img class="profileImg" src="${ contextPath }/resources/uploadFiles/normal.jpg>');				
				 
				if(data.length > 0){
					for(var i in data){
						$div = $('<div class="reply2_box" id="replyBox'+data[i].rNo+'">');
						
						if(data[i].userFile != null){
						$profileImg = $('<img class="profileImg" src="${ contextPath }/resources/uploadFiles/'+	data[i].userFile +'">');																
						} else {
						$profileImg = $('<img class="profileImg" src="${ contextPath }/resources/images/로고.png">');
						}
						
						$nickname = $('<div class="nickname" id="nickname" style="display: inline-block;">').text(data[i].nickname);
						$rContentdiv = $('<div>')
						$rContent = $('<textarea onkeyup="plus('+ data[i].rNo +');"class="rContent'+data[i].rNo+'" readonly style="resize:none; width: 100%; min-height: 100px; outline:none; border-color: #f3f2f2;">').html(data[i].rContent);
						
						$rCreateDate = $('<div class="rCreateDate" style="margin-left: 680px;">').text(data[i].rCreateDate);
						$rMBtn = $('<input type="button" class="mdBtn" id="mBtn'+data[i].rNo+'" onclick="modifyR('+ data[i].rNo +', this);" value="수정">');
						$rDBtn = $('<input type="button" class="mdBtn" id="dBtn'+data[i].rNo+'" onclick="deleteR('+ data[i].rNo +');" value="삭제">');
						$rereBtn = $('<input type="button" class="mdBtn" id="rrBtn'+data[i].rNo+'" onclick="rereR('+ data[i].rNo +');" value="답글">');

						$div.append($profileImg);

						$div.append($nickname);		
						$div.append($rCreateDate);
						
						$div.append($rContentdiv);
						$rContentdiv.append($rContent);
						
						console.log(data[i].nickname);
						
						if('${loginUser.nickName}' == data[i].nickname){
							$div.append($rMBtn);
							$div.append($rDBtn);
						}
						
					//	$div.append($rereBtn);
						console.log(i);
						
		// 대댓 목록
		$.ajax({
			url: 'rereList.fr',
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(datas){
				console.log(datas);
				$tableBody = $('#rtb tbody');
				$tableBody.html('');
				$rereTable = $('.replyTable');

				var $tr;
				var $nickname;
				var $rContent;
				var $rCreateDate;
				
				if(datas.length > 0){
					for(var j in datas){
						console.log(datas[j].rNo);
						console.log(i);
						if(datas[j].rNo == data[i].rNo){
						$tr = $('<tr>');
						$nickname = $('<td width="100">').text(datas[j].nickname);
						$rContent = $('<td>').text(datas[j].rContent.replace(/\+/g, ' '));
						$rCreateDate = $('<td width="100">').text(datas[j].rCreateDate);
						
						$tr.append($nickname);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
						$div.append($rereTable);
						$rOuter.append($div);
						
						}
					}
				}
			}
		});						
						
						
						$rOuter.append($div);	
						
						
					}
				} else{
					$div = $('<div class="reply2_box">');
					$rContent = $('<div class="rContent">').text('댓글 없음');
					
					$div.append($rContent);
					$rOuter.append($div);
				} 
			}
		});

	}
	
	// 댓글 등록	
	$('#rSubmit').on('click', function(){
		var rContent = $('#rContent').val();
		var boardNo = ${ fb.boardNo};
		
 		$.ajax({
			url: 'addReply.fr',
			data: {rContent:rContent, boardNo:boardNo},
			success: function(data){
				if(data == 'success'){
					getReplyList();
					$('#rContent').val('');
				}
			}
		}); 
		
	});
	
	// 댓글 수정
 	function modifyR(rNo, e){
 	//	alert(rNo);
	$('.rContent'+rNo).prop('readonly', false);
	$('.rContent'+rNo).css('border-color', 'pink');
	
	var save1 ="";

	if($('#mBtn'+rNo).val() == '수정'){
		save1 = $(e).parent().find('textarea').text();
		console.log("값"+save1);
		
//	 	$('#mBtn'+rNo).val('완료');
	 	$('#mBtn'+rNo).val('수정취소');
	 	
	 	$div = $(".reply2_box");
		$ok = $('<input type="button" class="mdBtn" onclick="modifyRup('+rNo+')" value="수정완료">');
	 	$(e).parent($div).append($ok);
	 	
	 	var counter = '<div style="color:#aaa; float: right;" id="counter'+rNo+'">(0/200자)</div>';
	 	$(e).next().after(counter);
	 	var content = $(e).prev().find('textarea').text();
	 	console.log(content.length);
	 	$('#counter'+rNo).html(content.length+"/200");
	 	
		$('#dBtn'+rNo).hide();
	}else if($('#mBtn'+rNo).val() == '수정취소'){
		$('.rContent'+rNo).prop('readonly', true);
		$(e).prev().find('textarea').val(save1);
		console.log("값"+save1);
		console.log($(e).prev().find('textarea'));
		getReplyList();

//원본
//  	 	$('#mBtn'+rNo).on('click', function(){
// 		 	var rContent = $('.rContent'+rNo).val();
		 	
// 		 	$.ajax({
// 		 		url: 'modifyReply.fr',
// 		 		data: {rContent:rContent, rNo:rNo},
// 		 		success: function(data){
// 		 			if(data == 'success'){
// 		 				getReplyList();
// 		 			}
// 		 		}
// 		 	});	 		
//  	 	})

	}
		
	}

// 수정 댓글 저장 
 	function modifyRup(rNo){
		 	var rContent = $('.rContent'+rNo).val();
		 	
		 	$.ajax({
		 		url: 'modifyReply.fr',
		 		data: {rContent:rContent, rNo:rNo},
		 		success: function(data){
		 			if(data == 'success'){
		 				getReplyList();
		 			}
		 		}
		 	});	 		
		}	
	

// 원댓글 수정시 글자 카운팅
	 function plus(rNo){
	    var content = $('.rContent'+rNo).val();
	    console.log(content);
	    $('#counter'+rNo+'').html(content.length+"/200");//글자수 실시간 카운팅
	
	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter'+rNo+'').html("200/200");
	    }
	} 


// 댓글 삭제
	function deleteR(rNo, rContent){
		
		$.ajax({
			url: 'deleteReply.fr',
			data: {rNo:rNo, rContent:rContent},
			success: function(data){
				if(data == 'success'){
					alert('확인을 누르면 삭제가 완료됩니다.');
					getReplyList();
				}
			}
		});
	}
	
	function deleteMsg(){
		var del = confirm('정말 삭제합니까?');
		if(del){
			location.href='${ bdelete }';
		}
	}
	
	// 댓글작성 글자수 체크
	$('.reply_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+"/200자)");//글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("(200/200자)");
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
	</script>
	<jsp:include page="../common/Footer.jsp"/>	
</body>
</html>
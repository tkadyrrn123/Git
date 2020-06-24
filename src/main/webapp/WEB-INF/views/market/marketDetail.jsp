<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/marketDetail.css"> 

</head>
<body>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<img class="img" src="resources/images/market6.jpg">
	<div class="header_wrap">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">중고장터</b>
	</div>
	<div id= all>
			<div id="itemName">${ma.boardTitle}</div>
			<div id="hit">조회수 : ${ ma.boardCount }</div>
			<div id="date">등록일 : ${ ma.createDate } </div>
			<div id="name">작성자 : ${ma.nickName}</div>
 			<div id="line1"></div> 
<%--  				<c:forEach  --%>
				<c:if test="${empty ma.fileName}">
					<div id=sellPic><img id=img src="resources/images/basicMarket.jpeg"/></div>
				</c:if>
				<c:if test="${!empty ma.fileName}">
					<div id=sellPic><img id=img class="bxslider" src="resources/marketUploadFiles/${ ma.fileName }"/></div>
				</c:if>
			<div class="content_wrap">
				<div id="price">가격 : ${ma.price}</div>			
				<div id="content2">${ ma.boardContent }</div>
			</div>
		
		<div id="line2"></div>
		<c:url var="deleteMarket" value="deleteMarket.ma">
			<c:param name="boardNo" value="${ma.boardNo}"/>
		</c:url>
		<c:url var="updateView" value="updateView.ma">
			<c:param name="boardNo" value="${ma.boardNo}"/>
			<c:param name="page" value="${page}"/>
		</c:url>
		
		<div id="btn">
				<button class="btn" id="updateBtn" onclick="location.href='${updateView}'">수정</button>
				<button class="btn" id="deleteBtn">삭제</button>
				<button class="btn" id="listBtn" onclick="location.href='market.ma'" >목록</button>
		</div>
		
		<!--  댓글 작성  -->
		<div id="content3">
			<div id="replyInput">
				<div id="info">
					<c:if test="${!empty loginUser.userFile}">
					<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${loginUser.userFile}"></div>
					</c:if>
					<c:if test="${empty loginUser.userFile}">
					<div class="info"  id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
					</c:if>
					<div class="info"  id="rWriter">${loginUser.nickName}</div>
				</div>
				<button class="btn" id="insertBtn">댓글 등록</button>

				<textarea id="rWrite" class="reply_TEXT" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea> 
				<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
			</div>
		</div> 
		
		
		
		<!--  댓글   -->
		 <div class="rOuter">
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
				<div>
					<p id="rContent">010-1234-5678 쪽으로 연락 주세요</p>
				</div> 
				<div>
					<button class="btn" id="replyBtn">답글</button>
					<div class="likeBtn" id="likeBtn3">
						<img id="likeImg" src="${ pageContext.servletContext.contextPath }/resources/images/like3.png">
					</div>
					<div class="likeBtn2" id="likeBtn4">
						<img id="likeImg2"  src="${ pageContext.servletContext.contextPath }/resources/images/like4.png">
					</div>
				</div>
			</div>
		</div>
		</div>
		<jsp:include page="../common/Footer.jsp"/>
	
	
	<script type="text/javascript">
	
		$('#deleteBtn').on('click',function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="${deleteMarket}";
			}
		});
		
		/** textarea 높이 자동 조절 **/
		$(function () {
			
		  $('.textarea').height(1).height( $('.textarea').prop('scrollHeight') - 10  );	
		});
	
	
		/** 댓글 글자수 제한 **/
		$('.reply_TEXT').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+"/200자)");//글자수 실시간 카운팅
	
		    if (content.length > 200){
		        alert("최대 200자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#counter').html("(200/200자)");
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
		
		/* 댓글 목록 조회*/
   		$(function(){
		getReplyList();
		/* 
		setInterval(function(){
			getReplyList();
		}, 1000); */
	});	
	
	function getReplyList(){
		var boardNo = ${ ma.boardNo };
		
		$.ajax({
			url: 'rList.ma',
			data: {boardNo:boardNo},
			dataType: 'json',
			success: function(data){
				console.log(data);
				$rOuter = $('.rOuter');
				$rOuter.html('');
				
				var $div;
				var $profileImg;
				var $nickname;
				var $rContent;
				var $rCreateDate;
			
				 
				if(data.length > 0){
					for(var i in data){
						$div = $('<div id="reply">');
						$profileImg = $('<img class="rProfile" src="${ contextPath }/resources/uploadFiles/'+ data[i].userFile +'">');
						$nickname = $('<div class="info" id="rWriter">').text(data[i].nickname);
						
						$rContent = $('<div class="rContent'+data[i].rNo+'">').html(data[i].rContent);
						
						$rCreateDate = $('<div class="rCreateDate">').text(data[i].rCreateDate);
						$rMBtn = $('<input type="button" class="btn" id="rUpdateBtn'+data[i].rNo+'" onclick="modifyR('+ data[i].rNo +',\''+data[i].rContent+'\');" value="수정">');
						$rDBtn = $('<input type="button" class="btn" id="rDeleteBtn'+data[i].rNo+'" onclick="deleteR('+ data[i].rNo +',\''+data[i].rContent+'\');" value="삭제">');
						
						$div.append($profileImg);
						$div.append($nickname);
						$div.append($rCreateDate);
						$div.append($rContent);
						$div.append($rMBtn);
						$div.append($rDBtn);
						$rOuter.append($div);						
					}
				} else{
					$div = $('<div id="reply">');
					$rContent = $('<div class="rContent">').text('댓글 없음');
					
					$div.append($rContent);
					$rOuter.append($div);
				} 
			}
		});
	}
	
	/* 댓글 추가 ajax */
		$('#insertBtn').on('click', function(){
			var userId = '${ loginUser.userId }';
			var boardNo = ${ ma.boardNo };
			var content = $('#rWrite').val();  			
			$.ajax({
				url: 'insertComment.co',
				data: {userId:userId, boardNo:boardNo, content:content},
				success: function(data){
					document.location.reload(true);
				}
			});
		})
		
		
	/* 댓글 수정 */  		
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
		}
	}
	
		function modifyRup(rNo){
		 	var rContent = $('.rContent'+rNo).val();
		 	
		 	$.ajax({
		 		url: 'updateComment.co',
		 		data: {rContent:rContent, rNo:rNo},
		 		success: function(data){
		 			if(data == 'success'){
		 				getReplyList();
		 			}
		 		}
		 	});	 		
		}
		
		//댓글 수정시 글자 카운팅
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
		
	</script> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/marketDetail.css"> 

</head>
<body>

	<script> 
	var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
	j(document).ready(function(){ 
	    var main = j('.bxslider').bxSlider({ 
	    mode: 'fade', 
	    auto: true,	//자동으로 슬라이드 
	    controls : true,	//좌우 화살표	
	    autoControls: true,	//stop,play 
	    pager:true,	//페이징 
	    pause: 3000, 
	    autoDelay: 0,	
// 	    slideWidth: 600, 
	    speed: 600, 
	    stopAutoOnclick:true
	}); 
	
	j(".bx-stop").click(function(){	// 중지버튼 눌렀을때 
	    main.stopAuto(); 
	    j(".bx-stop").hide(); 
	    j(".bx-start").show(); 
	    return false; 
	}); 
	
	j(".bx-start").click(function(){	//시작버튼 눌렀을때 
	    main.startAuto(); 
	    j(".bx-start").hide(); 
	    j(".bx-stop").show(); 
	    return false; 
	}); 
	
	j(".bx-start").hide();	//onload시 시작버튼 숨김. 
	}); 
	</script>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<img class="img" src="resources/images/market6.jpg">
	<div class="header_wrap">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">중고마켓</b>
	</div>
	<div id= all>
			<div id="itemName">${ma.boardTitle}</div>
			<div id="hit">조회수 : ${ ma.boardCount }</div>
			<div id="date">등록일 : ${ ma.createDate } </div>
			<div id="name">작성자 : ${ma.nickName}</div>
 			<div id="line1"></div> 
			<div id=sellPic>
				<c:if test="${empty ma.fileName || !ma.fileName.contains('.')}">
					<img id=img src="resources/images/basicMarket.jpeg"/>
				</c:if>
				<c:if test="${ma.fileName.contains('.')}">
					<div class="bxslider">
						<c:forEach var="i" items="${ma.fileName}" varStatus="is">
							<img id=img src="resources/marketUploadFiles/${ fileArr[is.index] }"/>
						</c:forEach>
					</div>
				</c:if>
			</div>
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
				<button class="btn_standard" id="updateBtn" onclick="location.href='${updateView}'">수정</button>
				<button class="btn_standard" id="deleteBtn">삭제</button>
				<button class="btn_standard" id="listBtn" onclick="location.href='market.ma'" >목록</button>
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
				<button class="reply1_btn" id="insertBtn">댓글 등록</button>

				<textarea id="rWrite" class="reply_TEXT" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; "  required placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea> 
				<span style="color:#aaa;" class="counter">(0 / 최대 200자)</span>
			</div>
		</div> 
		
		
		<!--  댓글   -->
		 <div class="rOuter">
		</div>
		
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
		</div>
		<jsp:include page="../common/Footer.jsp"/>
	
	
	<script type="text/javascript">
	
		$('#deleteBtn').on('click',function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href="${deleteMarket}";
			}
		});
		
	
		/** 댓글 글자수 제한 **/
		$('.reply_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html(content.length+"/200");//글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#counter').html("200/200");
	    }
	});
		
		/* 댓글 목록 조회*/
   		$(function(){
			getReplyList();
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
				var $noprofileImg = $('<img class="profileImg" src="${ contextPath }/resources/uploadFiles/normal.jpg>');	
			
				 
				if(data.length > 0){
					for(var i in data){
						$div = $('<div class="reply2_box">');
						$div2 = $('<div class="info2">');
						
						if(data[i].userFile != null){
						$profileImg = $('<img class="profileImg" src="${ contextPath }/resources/uploadFiles/'+	data[i].userFile +'">');																
						} else {
						$profileImg = $('<img class="profileImg" src="${ contextPath }/resources/images/로고.png">');
						}
						
						$nickname = $('<div class="nickname" id="nickname" style="display: inline-block; margin: 7px;">').text(data[i].nickname);
						$rContentdiv = $('<div>')
						$rContent = $('<textarea onkeyup="plus('+ data[i].rNo +');"class="rContent'+data[i].rNo+'" readonly style="border-radius: 5px; border: 1px solid black; margin-left:10px; padding:2px; resize:none; width: 78%; min-height: 100px; outline:none; ">').html(data[i].rContent);
						
						$rCreateDate = $('<div class="rCreateDate" style="display:inline-block;">').text(data[i].rCreateDate);
						$rDBtn = $('<input type="button" class="delete_btn" id="dBtn'+data[i].rNo+'" onclick="deleteR('+ data[i].rNo +');" value="삭제">');
						$rMBtn = $('<input type="button" class="modify_btn" id="mBtn'+data[i].rNo+'" onclick="modifyR('+ data[i].rNo +', this);" value="수정">');
						

						$div.append($profileImg);

						$div.append($nickname);		
						$div.append($rCreateDate);
						
						if('${loginUser.nickName}' == data[i].nickname){
							$div.append($rDBtn);
							$div.append($rMBtn);
						}
						
						$div.append($rContentdiv);
						$rContentdiv.append($rContent);
						
						console.log(data[i].nickname);
						
						
						$div.append($div2);
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
		$('.rContent'+rNo).css('border-color', '#6c9ab1');
		
		var save1 ="";
	
		if($('#mBtn'+rNo).val() == '수정'){
			save1 = $(e).parent().find('textarea').text();
			console.log("값"+save1);
			
			
	//	 	$('#mBtn'+rNo).val('완료');
		 	$('#mBtn'+rNo).val('수정취소');
// 		 	$('#dBtn'+rNo).val('수정완료');
		 	
		 	$div = $('.reply2_box');
			$ok = $('<input type="button" class="mdBtn" onclick="modifyRup('+rNo+')" value="수정완료">');
		 	$(e).parent($div).append($ok);
// 		 	$div.append($ok);

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
	
// 		수정 댓글 저장 
	 	function modifyRup(rNo){
			 	var rContent = $('.rContent'+rNo).val();
			 	
			 	$.ajax({
			 		url: 'modifyReply.ma',
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
		 
		// 댓글 삭제
			function deleteR(rNo){
				$.ajax({
					url: 'deleteComment.ma',
					data: {rNo:rNo},
					success: function(data){
						if(data == 'success'){
							alert('확인을 누르면 삭제가 완료됩니다.');
							getReplyList();
						}
					}
				});
			}
		
			$(function(){
				console.log($('#price').text());
				$('#price').text($('#price').text().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')) ;
			});
		
	</script> 

</body>
</html>
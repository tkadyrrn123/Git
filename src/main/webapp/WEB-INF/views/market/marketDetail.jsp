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
<style>
   #all{margin-top: 20px; margin-bottom: 40px;}
	#menu{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;}
	#line1{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px;}
	#line2{width: 80%; background: lightgray; height:2px; margin: auto;}
	.sellAll{width: 80%; margin: 40px 0px 0px 200px;}

  	#content2{overflow:scroll; white-space:pre-wrap;} 
	#content3{width: 65%; margin-left:100px;}
	#content4{width: 65%; margin-left:100px;} 
	#content5{width: 61.8%; margin-left:150px;} 

	#title{font-size:30px; width: 50%; font-weight:bold; margin-top: 20px; display: inline-block; margin-left: 130px;} 
	#hit{display: inline-block; width: 7%; float:right; margin-top: 30px; margin-right: 140px;} 
	#date{display: inline-block; width: 8%; float:right; margin-top: 30px; margin-right: 50px;}
	
	#sellPic{width: 30%; height: 400px; margin-left : 100px; margin-top: 20px; display: inline-block;}
 	#img{margin-left : 130px; width: 100%} 
	#itemName{display: inline-block; font-size: 30px; font-weight:bold;margin-left: 220px;}
/* 	#price{display: inline-block;} */

	.content_wrap{display:inline-block;
				  vertical-align:top;background-color:tomato;
				  width: 45%;
				  margin-top:20px;
				  margin-left:170px;}
	
	#name{display: inline-block; margin-top: 30px; float:right; margin-right: 50px;}  
 	#sellContent{width: 80%; min-height: 200px; border:none; font-size: 16px;}
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
 	 
 	#rProfile{width: 40px; hieght:40px; display:inline-block;}
 	#rWriter{display:inline-block;}
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
 	
	.img{width:100%; height:400px;}
	.header_wrap{background-color:rgba(0, 0, 0, 0.5); width:100%; height: 400px;position:absolute;top:0;}
	#headcomment{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em;}
</style> 
 
  


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
			<div id="name">판매자 : ${ma.nickName}</div>
 			<div id="line1"></div> 
			<c:if test="${empty ma.fileName}">
				<div id=sellPic><img id=img src="resources/images/basicMarket.jpeg"/></div>
			</c:if>
			<c:if test="${!empty ma.fileName}">
				<div id=sellPic><img id=img src="resources/marketUploadFiles/${ ma.fileName }"/></div>
			</c:if>
			<div class="content_wrap">
				<div id="status">판매중 : </div>
				<div id="price">판매가 : ${ma.price}</div>			
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
		 <div id="content4">
		 	<c:forEach var="b" items="${comment}" varStatus="status">
			<div id="reply" id="reply${ status.index }">
				<div id="info2">
					<c:if test="${!empty b.userFile}">
						<div class="info" id="rProfile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${loginUser.userFile}"></div>
					</c:if>
					<c:if test="{empty b.userFile}">
						<div class="info" id="rPrrofile"><img id="rImg" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/normal.jpg"></div>
					</c:if>
					<div class="info"  id="rWriter">${ b.nickname }</div>
					<div class="info"  id="replyDate">${ b.rCreateDate }</div>
					<c:if test="${loginUser.userId eq b.rUserId}">
						<button class="btn" id="rUpdateBtn${ status.index }">수정</button> 
						<button class="btn" id="rDeleteBtn${ status.index }">삭제</button>
						<div style="display:none">${b.rNo}</div> 
					</c:if>
				</div>
					<textarea id="rContent${ status.index }"  readonly>${ b.rContent }</textarea>
				<div>
					<button class="btn" id="replyBtn">답글</button>
					<div style="display:none">${ b.rNo }</div>
				</div>
			</div>
				</c:forEach>
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
		
		/* 댓글 추가 ajax */
   		$('#insertBtn').on('click', function(){
   			var userId = '${ loginUser.userId }';
   			var boardNo = ${ ma.boardNo };
   			var content = $('#rWrite').val();  			
   			$.ajax({
   				url: 'insertComment.ma',
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

						var $rubtn = $('<button>').text("수정").attr('class','btn').attr('id','rUpdateBtnAjax');
						var $rNo2 = $('<div>').text(data[i].rNo).css('display','none');
						var $rdbtn = $('<button>').text("삭제").attr('class','btn').attr('id','rDeleteBtnAjax');
						var $turn2 = $('<div>').text(i).css('display','none');
						
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
						var $rNo = $('<div>').text(data[i].rNo).css('display','none');
						var $turn = $('<div>').text(i).css('display','none');
						var $rrdbtn = $('<button>').text("수정취소").attr('class','btn').attr('id','rDeleteBtnC');
						var $ccontent = $('<textarea>').attr('class','rrContent'+i).text(data[i].rContent).css('border', '1px solid black');
						
						$profile.append($img);
						
						$div.append($profile);
						$div.append($writer);
						$div.append($date);
						if(data[i].rUserId == userId){
							$div.append($rubtn);
							$div.append($rdbtn);
							$div.append($rNo2);
							$div.append($turn2);
						}
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
						$ddiv.append($rNo);
						$ddiv.append($turn);
						$ddiv.append($rrdbtn);
						$replyUpdate.append($ddiv);
						$replyUpdate.append($ccontent);
						
						
						$replyTable.append($reply);
						$replyTable.append($replyUpdate);
						
						var aaa = $content.prop('scrollHeight');
						
						$content.height(aaa + 20);
						
						var aaaa = $ccontent.prop('scrollHeight');
						$ccontent.height(aaaa + 110);
					}
					$('#rWrite').val("");
   				}
   			})
   		})
		
		
	</script> 

</body>
</html>
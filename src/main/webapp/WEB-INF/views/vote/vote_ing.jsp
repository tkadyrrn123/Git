<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표진행중</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	/* ----전체틀-------- */
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-top: 185px; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 80px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
	.detailTable_title{margin-left: 75px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
	.list_bar{display:inline; float: right; margin-top: 15px; margin-right: 20px; background-color: white; border: none; cursor: pointer;}

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
	.comment2-1img{width: 38px; height: 38px; border-radius: 100%; margin-top: 5px; margin-left: 10px; margin-bottom: 5px; margin-right: 10px; vertical-align: middle;}
	.dong{line-height: 50px; display: inline; margin-left: 10px; margin-right: 10px;}
	.reply1_btn{float:right; width:70px; height:25px; background-color:lightgray; color:white; border:0; outline:0; border-radius:0.34em; cursor: pointer; margin-top: 10px;}
	.reply_TEXT{border-radius:0.34em; border-color: lightgrey; resize:none;}

/* 원댓글  */	
	.reply2_box{width: 800px; height: auto; margin-left: 100px; margin-top: 8px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: solid; border-color: rgb(201, 232, 255);}
	.reply2_box_btn{cursor: pointer; float: right; margin-top: 15px; margin-right: 15px; border:0;}
	.reply2_box_btn2{cursor: pointer;margin-left: 10px; margin-top: 10px; margin-bottom: 10px;  border:0; outline:0;}
	.fa-thumbs-up{cursor: pointer; float: right; margin-top: 10px; margin-right: 10px;}
	
/* 대댓글  */	
	.reply3_box{width: 763px; height: auto; margin-left: 140px; background-color: rgb(201, 232, 255); padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; margin-top: 8px;}

/* 투표 */
	.vam{margin-bottom: 10px;}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<div class="outer" >
		<form name="pollVoteForm">
		<!-- 게시글 상단부 시작  -->	
			<br>
			<h2 style="margin-left: 15px;">투표결과창 상세보기</h2>
			<hr>
			<br>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div style="width: 60px; height: 25px; float: left; display: inline; background-color: skyblue; text-align: center; color: white; font-variant: all-petite-caps;">투표중</div>
					<div class="detailTable_title">
						<b>여기는 제목을 쓰는 공간으로 현재 투표중 투표중입니다.</b>
					</div>
					<div id="cdt_profile" style="float:left;display:inline;">
						<img class="comment2-1img" src="<%= request.getContextPath() %>/css/화단사진.jpg">
					</div>
					<div class="dong">닉네임(101동)</div>
					<div style="display:inline;"><i class="far fa-clock"></i> 2020.2.29. 19:16</div>
					<div style="display:inline;"><i class="far fa-eye"></i> 120</div>
				<!--수정 /삭제 선택 -->	
				<i class="fas fa-ellipsis-v"></i>
				<div id="popup">
					<div class="pop"><label>수정</label></div>
					<div class="pop"><label>삭제</label></div>
				</div>
				<hr>
			</div>
		<!-- 게시글 상단부 끝  -->	
		<!-- 게시글 내용  -->
			<div style="width: 800px; height: auto; margin-left: 100px; margin-top: 50px;"> 여러분 오늘 어떤 투표를 할지 말씀드릴게요. 오늘은 뭐냐면 대충 투표는 해야겠는데 글을 어디서 가져오기는 좀 귀찮고 무슨 텍스트든 적기는 해야할 것같으니까 일단 
			찌끄려 보는 그런거거든요. 일단 아래 보시면 아시겠지만, 땅문서 어쩌구 랄랄라하는 투표를 할거구요, 익명 투표로 진행될 예저입니다.. 투표 도중에 댓글은 못달고 투표결과 나오면
			댓글 달수 있도록해드릴거에요.</div>
		<!-- 게시글 내용 끝 -->	
		<!-- 투표진행부분 
			중복투표는 체크박스, 단일투표는 라디오박스-->
			<div style="font-size: 12px; line-height: 1.6; text-align: center; margin-top: 30px;">
				<div style="width: 90% !important; max-width: 542px !important; min-width: 300px !important; margin: 0 auto;
    				text-align: left; border: 1px solid #d5d5d5;">
    				<div style="padding: 13px 18px 11px; color: #444444; background-color: #f7f7f7; font-size: 12px; line-height: 1.6;"><b>투표하기</b>
					<span> 기간 : <span>2020.05.26 ~ 2020.06.01</span> <span>|</span>
						참여자수 : <strong>0</strong> 명</span>
					</div>
					<ol style="padding: 16px 18px 9px; margin: 0; list-style: none; background-color: #fff;">
						<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="1015217"><label style="vertical-align: text-bottom;">김근오</label></li>
						<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="1015218"><label style="vertical-align: text-bottom;">박종훈</label></li>
						<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="1015219"><label style="vertical-align: text-bottom;">허무지개</label></li>
						<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="1015220"><label style="vertical-align: text-bottom;">이도훈</label></li>
						<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="1015221"><label style="vertical-align: text-bottom;">임민주</label></li>
					</ol>
				</div>
				<div class="poll_btn_area">
					<div class="poll_btn_center" style="margin-top:20px;">
						<input type="submit" value="투표하기" onclick="javascript:pollSubmit();">
<!-- 						<input type="button" value="결과보기">			 -->
					</div>
				</div>
			</div>
		<!--목록으로   -->	
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록">
			</div>
			<br>
			<!--투표중에는 댓글 작성 불가 -->
			<div class="reply1_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="comment2-1img" src="<%=request.getContextPath()%>/css/화단사진.jpg">
				</div>
				<div class="dong">라랄라(202동)</div>
					<button type="button" class="reply1_btn">댓글등록</button>
				<div style="margin-left: 10px; margin-top: 12px;">
					<textarea class="reply_TEXT" name="reply_TEXT" cols="105" rows="4" placeholder="투표 진행 중 에는 댓글 작성이 불가합니다. 투표가 완료되면 댓글작성이 가능합니다." readonly></textarea>
				</div>
			</div>
		</form>
	</div>
		
	<script>
	
		//투표결과창 js
		var resultBars = $(".poll-choices-listing .poll-result-bar");

		if (resultBars.is(':hidden')) {
			var time = 800;
			resultBars.each(function(index) {
				$(this).animate({
					width : "toggle"
				}, time);
				time += 100;
			});
		}

		// textarea 체크
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
		//체크박스
		function pollSubmit() {
			if (!checkData()) {
				alert("보기를 선택하세요");
				return;
			}
// 			document.pollVoteForm.pollseq.value = "437405";
// 			document.pollVoteForm.return_url.value = "http://cafe.daum.net/_c21_/poll/status?grpid=1XFJP&fldid=eHrC&dataid=89";
			document.pollVoteForm.submit();
		}

		function checkData() {
			var choice = document.pollVoteForm.article_poll_fldpoll_egseq;
			if(choice.length > 0) {
				for(i = 0; i < choice.length; i++)
					if (choice[i].checked) return true;
			} else {
				return choice.checked;
			}
		}
	</script>
		
</body>
</html>
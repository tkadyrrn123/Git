<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표종료</title>
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


/* 투표결과 */
	#topic-poll-option {position: relative; width: 100%; min-height: 45px;}
	#topic-poll-option .add-poll-bttn {margin-bottom: 10px; position: absolute; top: 0;}
	#topic-poll-option .topic-add-poll-controls {z-index: 10;}
	#edit_topic_poll_modal #topic-poll-option {position: initial;}
	#edit_topic_poll_modal #topic-poll-option .topic-add-poll-controls {display: block;  width: 100%;  padding: 0px;  border: 0px;  padding: 10px;  box-sizing: border-box;  margin-bottom: 0px;}
	
	.topic-add-poll-controls {  background-color: #FFFFFF;  padding: 20px;  border-radius: 10px;  border: 1px solid #dfdfdf;  width: 515px;  margin-bottom: 20px;  display: none;}
	.topic-add-poll-controls input#poll_title {  display: block;  width: 300px;}
	.topic-add-poll-controls input#poll_max_votes {  display: block;  width: 100px;}
	.topic-add-poll-controls label {  display: inline-block;}
	.topic-add-poll-controls .poll-controls {  margin-bottom: 10px;}
	.topic-add-poll-controls .poll-controls:last-child {  margin-bottom: 0px;}
	.topic-add-poll-controls .poll-choices-controls {  margin-bottom: 25px;}
	.topic-add-poll-controls input[type='checkbox'] {  margin: 0px 5px 0px 0px;}
	.topic-add-poll-controls .poll-choice-add {  margin-bottom: 10px;}
	.topic-add-poll-controls .poll-choice-add input {  margin: 0px 10px;  width: 300px;}
	.topic-add-poll-controls .poll-choice-add.old-choice input {  margin: 0 6px;}
	.topic-add-poll-controls .remove-poll-bttn {  float: right;}
	.topic-add-poll-controls .icon-drag:hover {  cursor: move;  background-position: -696px 0px;}
	.topic-add-poll-controls .icon-remove:hover {  cursor: pointer;  background-position: 0 0;}
	.topic-add-poll-controls .poll-max-votes-input {  margin-bottom: 15px;}
	.topic-add-poll-controls .poll-max-votes-input input {  margin-bottom: 0px;}
	.topic-add-poll-controls .poll-max-votes-input.hidden {  display: none;}
	
	#topic-poll-option.with-poll .topic-add-poll-controls {  display: block;}
	#topic-poll-option.with-poll .add-poll-bttn {  display: none;}
	
	#topic-poll-wrapper {  margin-top: 30px;}
	
	#topic-poll {  border: 1px solid lightgray;  width: 675px;  padding: 15px;  vertical-align: top;  border-radius: 10px;  font-size: 14px;  margin-left: 140px;  margin-top: 10px;  margin-bottom: 10px;}
	#topic-poll .icon-edit:hover {  background-position: -384px 0;}
	#topic-poll .poll-header {  overflow: hidden;  padding-bottom: 10px;  border-bottom: 1px solid lightgray;  position: relative;  min-height: 20px;}
	#topic-poll .poll-header .poll-title {  display: inline-block;  position: absolute;  bottom: 10px;  font-size: 17px;}
	#topic-poll .poll-header .poll-edit-link {  display: inline-block;  float: right;  color: #999999;}
	#topic-poll .poll-header .poll-edit-link .sui-bttn {  padding: 3px 9px;}
	#topic-poll .poll-header .poll-edit-link .icon-edit {  margin-left: 10px;}
	#topic-poll .poll-header .poll-edit-link .change-view-link {  font-size: 13px;}
	#topic-poll .poll-header .poll-edit-link .divider {  margin: 0px 5px;}
	#topic-poll .anonymous-marker {  vertical-align: top;  background: #CECECE;  -webkit-border-radius: 3px;  -moz-border-radius: 3px;  border-radius: 3px;  color: #FFF;  display: inline-block;  font-size: 10px;  font-weight: bold;  line-height: 9px;  padding: 4px 5px;  text-transform: uppercase;  margin: 0px 5px;}
	#topic-poll .poll-choice-limit {  margin-top: 10px;}
	#topic-poll .poll-choices-listing {  padding: 10px 20px 0px 20px;}
	#topic-poll .poll-choices-listing .poll-choice {  padding: 5px 0px;}
	#topic-poll .poll-choices-listing .poll-choice .choice-name {  margin-left: 5px;}
	#topic-poll .poll-choices-listing .add-choice-control {  margin: 10px 0px 5px 0px;}
	#topic-poll .poll-choices-listing .add-choice-control .add-user-choice-bttn {  margin-left: 3px;}
	#topic-poll .poll-choices-listing .add-choice-control .add-user-choice-bttn i {  margin-right: -4px;}
	#topic-poll .poll-choices-listing .add-choice-control input {  width: 300px;}
	#topic-poll .poll-choices-listing .add-choice-control.error input {  color: #C03E2B;  border-color: #FDA099;}
	#topic-poll .poll-choices-listing .add-choice-error {  display: none;}
	#topic-poll #poll-voting-form .footer-actions {  margin-top: 10px;}
	
	.poll-error-message {  color: #C03E2B;  margin-top: 5px;  font-weight: normal;  font-style: italic;  font-size: 13px;}
	
	input.text.input-error {  border-color: #FDA099;}
	
	#topic-poll.results .poll-total-votes {  color: #999999;  font-size: 14px;}
	#topic-poll.results .poll-choices-listing .choice-name {  margin-left: 0px;  display: block;  margin-bottom: 5px;}
	#topic-poll.results .poll-choices-listing .choice-name.voted {  font-weight: bold;}
	#topic-poll.results .poll-choices-listing .choice-name.voted .choice-voted-marker {  font-size: 12px;  font-weight: normal;  color: #999999;}
	#topic-poll.results .poll-choices-listing .choice-name.voted .choice-voted-marker a:hover {  text-decoration: none;}
	#topic-poll.results .poll-choices-listing .poll-result-bar {
	  border-radius: 10px 0px 0px 10px;
	  background: #4EB9FF;
	  /* Old browsers */
	  background: -webkit-linear-gradient(left, #4EB9FF, #2186CA);
	  /* For Safari 5.1 to 6.0 */
	  background: -o-linear-gradient(right, #4EB9FF, #2186CA);
	  /* For Opera 11.1 to 12.0 */
	  background: -moz-linear-gradient(right, #4EB9FF, #2186CA);
	  /* For Firefox 3.6 to 15 */
	  background: linear-gradient(to right, #4EB9FF, #2186CA);
	  /* Standard syntax */
	  height: 20px;
	  display: none;
	}
	#topic-poll.results .poll-choices-listing .poll-result {  min-height: 30px;  width: 100%;  display: inline-block;  position: relative;  box-sizing: border-box;}
	#topic-poll.results .poll-choices-listing .poll-votes-count {  height: 100%;  vertical-align: middle;  position: absolute;  right: 0px;  top: 0px;  font-weight: bold;  color: #666666;}
	#topic-poll.results .poll-choices-listing .poll-result-bar-wrapper {  height: 20px;  display: inline-block;  margin-left: -4px;  width: 520px;  margin-bottom: 5px;  overflow: hidden;  border-radius: 10px 0px 0px 10px;  border-top-right-radius: 10px;  border-bottom-right-radius: 10px;  background-color: #E2E2E2;}
	#topic-poll.results .poll-choices-listing .poll-percentage {  width: 35px;  display: inline-block;  vertical-align: top;  padding-left: 5px;  padding-top: 2px;  color: #999999;}
	
	#topic-poll.unavailable .poll-unavailable-msg {  padding: 20px;  text-align: center;}
	#topic-poll.unavailable .change-vote {  font-size: 12px;  margin-top: 10px;}
	
	#poll_choice_voters .modal-body {  padding: 20px;}
	
	.poll-choice-info {  max-height: 700px;  overflow-y: auto;}
	.poll-choice-info .info-label {  font-size: 17px;}
	.poll-choice-info .info-block {  padding: 0px 10px;}
	.poll-choice-info .suggested-by-info .suggested-by-label {  position: relative;  top: 50%;  transform: translateY(-75%);  display: inline-block;  margin-right: 5px;}
	.poll-choice-info .suggested-by-user {  display: inline-block;}
	.poll-choice-info .user-listing .user-name {  display: inline-block;  position: relative;  top: 50%;  transform: translateY(-81%);  margin-left: 5px;}
	.poll-choice-info hr {  margin: 10px 0;}
	.poll-choice-info .voters-listing-label {  margin-bottom: 10px;}
	.poll-choice-info .voter {  margin-bottom: 10px;  margin-left: 10px;}
	
	.topic-poll-popup #topic-poll.popup {  border: 0px;  width: 100%;  padding: 0px;}
	.topic-poll-popup #topic-poll.popup .poll-popup-header {  text-align: center;}
	.topic-poll-popup #topic-poll.popup .poll-popup-header a {  font-weight: bold;  color: #333333;}
	.topic-poll-popup #topic-poll.popup .poll-popup-header .poll-popup-total-votes {  color: #999999;  font-weight: normal;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing {  padding: 10px 10px 5px 10px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice {  padding: 0px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice .choice-name {  margin-bottom: 0px;  font-size: 13px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice .poll-result {  min-height: 20px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice .poll-result-bar {  height: 15px;  margin-bottom: 0px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice .poll-result-bar-wrapper {  width: 400px;  height: 15px;}
	.topic-poll-popup #topic-poll.popup .poll-choices-listing .poll-choice .poll-percentage {  height: 15px;  font-size: 10px;  padding-top: 0px;}
	.topic-poll-popup .add-choice-control {  margin-top: 15px;}
	.topic-poll-popup .choices-for-voting .poll-choice {  margin-bottom: 5px;}
	.topic-poll-popup .poll-more-options {  margin-top: 10px;  font-size: 13px;}
	
	.topic-listing-poll-marker {  vertical-align: middle;  margin-left: 5px;}
 	
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
	<div class="outer" >
		<form>
		<!-- 게시글 상단부 시작  -->	
			<br>
			<h2 style="margin-left: 15px;">투표결과창 상세보기</h2>
			<hr>
			<br>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div style="width: 60px; height: 25px; float: left; display: inline; background-color: skyblue; text-align: center; color: white; font-variant: all-petite-caps;">투표완료</div>
					<div class="detailTable_title">
						<b>여기는 제목을 쓰는 공간으로 깨끗하고 살기 좋은 아파트를 위하여</b>
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
			댓글 달수 있도록해드릴거에요.
			</div>
		<!-- 게시글 내용 끝 -->	
		<!-- 투표결과부분 -->
			<div id="topic-poll-wrapper" style="display: block;">
				<div class="topic-poll">
					<div id="topic-poll" class="results" data-max-votes="3">
						<div class="poll-header">
							<div class="poll-title">
								하우스스토리를 통해 땅문서를 가지는 방법은? <span class="anonymous-marker">
									Anonymous </span> <span class="poll-total-votes"> | 24 Votes </span>
							</div>

							<div class="poll-edit-link">

								<a href="#" data-target="#edit_topic_poll_modal"
									data-toggle="modal"><i class="icon-edit icon-light "></i></a>
							</div>
						</div>

						<div class="poll-choices-listing">

							<div class="poll-choice">
								<span class="choice-name voted"> 부동산투기 <span
									class="choice-voted-marker"> <a
										href="/topic_polls/33/change_vote" class="change-view-link">-
											Your vote <i class="icon-edit icon-light "></i>
									</a>
								</span>
								</span> <span class="poll-result"> <span class="poll-percentage">
										25% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 520px;"></div>
								</span> <span class="poll-votes-count">6 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name "> 로또당첨 </span> <span class="poll-result">
									<span class="poll-percentage"> 20% </span> <span
									class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 430px;"></div>
								</span> <span class="poll-votes-count">5 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name "> 땅문서 훔친다 </span> <span
									class="poll-result"> <span class="poll-percentage">
										16% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 344px;"></div>
								</span> <span class="poll-votes-count">4 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name voted"> 부모님한테 물려받기 <span
									class="choice-voted-marker"> <a
										href="/topic_polls/33/change_vote" class="change-view-link">-
											Your vote <i class="icon-edit icon-light "></i>
									</a>
								</span>
								</span> <span class="poll-result"> <span class="poll-percentage">
										12% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 258px;"></div>
								</span> <span class="poll-votes-count">3 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name "> 있을수없음 </span> <span
									class="poll-result"> <span class="poll-percentage">
										12% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 258px;"></div>
								</span> <span class="poll-votes-count">3 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name voted"> 회사에 열심히 다닌다 90년정도<span
									class="choice-voted-marker"> <a
										href="/topic_polls/33/change_vote" class="change-view-link">-
											Your vote <i class="icon-edit icon-light "></i>
									</a>
								</span>
								</span> <span class="poll-result"> <span class="poll-percentage">
										8% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 172px;"></div>
								</span> <span class="poll-votes-count">2 Votes</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name "> 포기한다 </span> <span
									class="poll-result"> <span class="poll-percentage">
										4% </span> <span class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 86px;"></div>
								</span> <span class="poll-votes-count">1 Vote</span>
								</span>
							</div>
							<div class="poll-choice">
								<span class="choice-name "> 열심히 한다 </span> <span class="poll-result">
									<span class="poll-percentage"> 0% </span> <span
									class="poll-result-bar-wrapper">

										<div class="poll-result-bar" visibility="hidden"
											style="width: 0px;"></div>
								</span> <span class="poll-votes-count">0 Votes</span>
								</span>
							</div>

						</div>

					</div>
				</div>
			</div>
			<!-- 투표결과부분 끝 -->
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록">
			</div>
			<br>
			<!--댓글 작성  -->
			<div class="reply1_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="comment2-1img" src="<%=request.getContextPath()%>/css/화단사진.jpg">
				</div>
				<div class="dong">라랄라(202동)</div>
					<input type="button" class="reply1_btn" value="댓글등록">
				<div style="margin-left: 10px; margin-top: 12px;">
					<textarea class="reply_TEXT" name="reply_TEXT" cols="105" rows="4" placeholder="댓글을 입력해주세요. 비방, 홍보글, 도배글 등은 예고없이 삭제될 수 있습니다."></textarea>
				<div style="color:#aaa; float: right; margin-top: 45px;" id="counter">(0/200자)</div>
				</div>
			</div>
			<!--원 댓글  -->
			<div class="reply2_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="comment2-1img" src="<%=request.getContextPath()%>/css/화단사진.jpg">
				</div>
				<div class="dong">라랄라(202동)</div>
					<input type="button" value="삭제" class="reply2_box_btn">
					<input type="button" value="수정" class="reply2_box_btn">
				<div style="margin-left: 10px;">와! 이런식으로 어쩌구 저쩌구한 투표결과를 보니 좋네요!</div>
				<div style="margin-left: 10px; color: gray;">2020.2.29. 19:16</div>
				<input type="button" value="답글" class="reply2_box_btn2">
				<i class="far fa-thumbs-up">0</i>
				</div>
			
			<!-- 대 댓글 -->
			<div class="reply3_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<img class="comment2-1img"src="<%=request.getContextPath()%>/css/화단사진.jpg">
				</div>
				<div class="dong">뾰로롱(201동)</div>
					<input type="button" value="삭제" class="reply2_box_btn">
					<input type="button" value="수정" class="reply2_box_btn">
				<div style="margin-left: 10px;">와! 이런식으로 어쩌구 저쩌구한 투표결과를 보니 좋네요!</div>
				<div style="margin-left: 10px; color: gray;">2020.2.29. 19:16</div>
				<input type="button" value="답글" class="reply2_box_btn2">
				<i class="fas fa-thumbs-up">1</i>
			</div>
		</form>
	</div>

	<script>
		//투표결과창
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
	</script>
</body>
</html>
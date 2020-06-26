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
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 80px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
	.detailTable_title{margin-left: 75px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
	.list_bar{display:inline; float: right; margin-top: 15px; margin-right: 20px; background-color: white; border: none; cursor: pointer;}
	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}

/*수정삭제  */
	.pop{padding:5px 0px;}
 	.vLabel:hover {background-color: lightgray; cursor: pointer;}
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
	
	#topic-poll {  border: 1px solid lightgray;  width: 695px;  padding: 15px;  vertical-align: top;  border-radius: 10px;  font-size: 14px;  margin-left: 140px;  margin-top: 10px;  margin-bottom: 10px;}
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
	#topic-poll.results .poll-choices-listing .poll-result-bar-wrapper {  height: 20px;  display: inline-block;  width: 520px;  margin-bottom: 5px;  overflow: hidden;  border-radius: 10px 0px 0px 10px;  border-top-right-radius: 10px;  border-bottom-right-radius: 10px;  background-color: #E2E2E2;}
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
	#content4{width: 65%; margin-left:14.5%;} 
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
 	
 	

 	#content4>textarea{ readonly; resize:none; border:none;}
 	#content4>textarea:focus {outline: none;}
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
<img class="img" src="resources/images/voteImage.png">
<jsp:include page="../common/menubar.jsp"/>
<div class="commnuity_header">
<h2>투표 게시판</h2>
</div>
	<div class="outer" >
		<form name="pollVoteForm" action="choiseVote.vo" method="post">
		<!-- 투표 Id,check,page 담는 hidden -->
		<input type="hidden" name="vId" value="${Vote.vId}">
		<input type="hidden" name="check" value="${check }">
		<input type="hidden" name="page" value="${currentPage }">
		<!-- 게시글 상단부 시작  -->	
			<br>
			<h2 style="margin-left: 15px;">투표게시판 상세보기</h2>
			<hr>
			<br>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div style="width: 60px; height: 25px; float: left; display: inline; background-color: skyblue; text-align: center; color: white; font-variant: all-petite-caps;">
				<c:if test="${check}">
				투표중
				</c:if>
				<c:if test="${!check}">
				투표완료
				</c:if>
				</div>
					<div class="detailTable_title">
						<b>${Vote.vName}</b>
					</div>
					<div id="cdt_profile" style="float:left;display:inline;">
						<c:if test="${!empty loginUser.userFile }">
						<img class="comment2-1img" src="resources/uploadFiles/${loginUser.userFile}">
						</c:if>
						<c:if test="${empty loginUser.userFile }">
						<img class="comment2-1img" src="resources/uploadFiles/normal.jpg">
						</c:if>
					</div>
					<div class="dong">${writer.nickName}</div>
					<div style="display:inline;"><i class="far fa-clock"></i> ${Vote.createDate }</div>
					<div style="display:inline;"><i class="far fa-eye"></i> ${Vote.vCount }</div>
				<!--수정 /삭제 선택 -->	
				<c:if test="${(loginUser.userId).equals(writer.userId)}">
					<i class="fas fa-ellipsis-v"></i>
					<div id="popup">
						<div class="pop"><label id="vModify" class="vLabel" onclick="location.href='voteModifyView.vo?vId=${Vote.vId}&page=${currentPage}'">수정</label></div>
						<div class="pop"><label id="vDelete" class="vLabel" onclick="deleteYN();">삭제</label></div>
					</div>
				</c:if>
				<hr>
			</div>
		<!-- 게시글 상단부 끝  -->	
		<!-- 게시글 내용  -->
			<div style="width: 800px; height: auto; margin-left: 100px; margin-top: 50px;">${Vote.vContent}</div>
		<!-- 게시글 내용 끝 -->	
		<!-- 투표진행부분 중복투표는 체크박스, 단일투표는 라디오박스-->
			<c:set var="invoteCheck" value="false"/>
			<c:forEach var="i" begin="0" end="${vInlist.size()}">
				<c:if test="${not invoteCheck}">
					<c:if test="${vInlist[i].userId eq loginUser.userId}">
						<c:set var="invoteCheck" value="true"/>
					</c:if>
				</c:if>
			</c:forEach>
			
			<!-- 내가 이 투표게시판의 투표를 안했으며 투표 중 일 경우 보여주는 부분 -->
			<c:if test="${!invoteCheck && check}">
			<div id = "vote_ing"style="font-size: 12px; line-height: 1.6; text-align: center; margin-top: 30px;">
				<div style="width: 90% !important; max-width: 542px !important; min-width: 300px !important; margin: 0 auto;
    				text-align: left; border: 1px solid #d5d5d5;">
    				<div style="padding: 13px 18px 11px; color: #444444; background-color: #f7f7f7; font-size: 12px; line-height: 1.6;"><b>투표하기</b>
					<span> 기간 : <span>${Vote.createDate} ~ ${Vote.endDate}</span> <span>|</span>
						참여자수 : <strong>
						<c:if test="${vInlist != null && !vInlist.isEmpty() }">
							${vInlist.size()}
						</c:if>
						<c:if test="${vInlist == null || vInlist.isEmpty() }">
							0
						</c:if>
						</strong> 명</span>
					</div>
					<ol style="padding: 16px 18px 9px; margin: 0; list-style: none; background-color: #fff;">
						<c:if test="${vclist != null && !vclist.isEmpty() }">
							<c:if test="${(Vote.overlapYN).equals('N') }">
								<c:forEach var="i" begin="0" end="${vclist.size()-1}">
									<li><input type="radio" name="article_poll_fldpoll_egseq" class="vam" value="${vclist[i].vcId}"><label style="vertical-align: text-bottom;">${vclist[i].vcName}</label></li>
								</c:forEach>
							</c:if>
							<c:if test="${(Vote.overlapYN).equals('Y') }">
								<c:forEach var="j" begin="0" end="${vclist.size()-1}">
									<li><input type="checkbox" name="article_poll_fldpoll_egseq" class="vam" value="${vclist[j].vcId}"><label style="vertical-align: text-bottom;">${vclist[j].vcName}</label></li>
								</c:forEach>
							</c:if>
						</c:if>
					</ol>
				</div>
				<div class="poll_btn_area">
					<div class="poll_btn_center" style="margin-top:20px;">
						<input type="submit" value="투표하기" onclick="javascript:pollSubmit();">
					</div>
				</div>
			</div>
			</c:if>
			
			<!-- 내가 이 투표게시판의 투표를 했거나 투표가 끝났을 경우 보여주는 부분 -->
			<c:if test="${invoteCheck || !check}">
				<!-- 투표결과부분 -->
					<div id="topic-poll-wrapper" style="display: block;">
						<div class="topic-poll">
							<div id="topic-poll" class="results" data-max-votes="3">
								<div class="poll-header">
									<div class="poll-title">${Vote.vName}<span class="poll-total-votes"> | ${vInlist.size()} Votes </span>
									</div>
		
									<div class="poll-edit-link">
										<a href="#" data-target="#edit_topic_poll_modal"
											data-toggle="modal"><i class="icon-edit icon-light "></i></a>
									</div>
								</div>
								<div class="poll-choices-listing">
									<c:set var="invoteMax" value="${vInlist.size()}"/>
									<!-- 투표결과 보여주는 부분  -->
									<c:forEach var="i" begin="0" end="${vclist.size()-1}">
										<div class="poll-choice">
											<span class="choice-name voted"> ${vclist[i].vcName} <span class="choice-voted-marker">
												<c:set var="Votes" value="0"/>
												
												<!-- 내가 투표했는지 확인하고 몇명이 했는지 확인하는 부분 -->
												<c:if test="${vInlist != null && !vInlist.isEmpty() }">
												<c:forEach var="j" begin="0" end="${vInlist.size()-1}">
													<c:if test="${(vInlist[j].userId eq loginUser.userId) and (vclist[i].vcId eq vInlist[j].vcId)}">
														<a class="change-view-link" style="color:blue;">
														- Your vote
														<i class="icon-edit icon-light "></i>
														</a>
													</c:if>
													<c:if test="${vclist[i].vcId eq vInlist[j].vcId}">
														<c:set var="Votes" value="${Votes+1}"/>
													</c:if>
												</c:forEach>
												</c:if>
												<c:set var="percent" value="${ Math.round(Votes / invoteMax * 100) }"/>
											</span>
											</span> <span class="poll-result"> <span class="poll-percentage">
													${percent}% </span> <span class="poll-result-bar-wrapper">
			
													<div class="poll-result-bar" visibility="hidden"
														style="width: ${percent}%;"></div>
											</span> <span class="poll-votes-count">${Votes} Votes</span>
											</span>
										</div>
									</c:forEach>
									
								</div>
		
							</div>
						</div>
					</div>
				<!-- 투표결과부분 끝 -->
				</c:if>
			<!--목록으로   -->	
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록" onclick="location.href='voteList.vo?page=${currentPage}'">
			</div>
			<br>
			<!--투표중에는 댓글 작성 불가 -->
			<div class="reply1_box">
				<div id="cdt_profile" style="float: left; display: inline;">
					<c:if test="${!empty loginUser.userFile }">
					<img class="comment2-1img" src="resources/uploadFiles/${loginUser.userFile}">
					</c:if>
					<c:if test="${empty loginUser.userFile }">
					<img class="comment2-1img" src="resources/uploadFiles/normal.jpg">
					</c:if>
				</div>
				<div class="dong">${loginUser.nickName }</div>
				<c:if test="${!check}">
				<button type="button" id="addComment" class="reply1_btn">댓글등록</button>
				</c:if>
				<div style="margin-left: 10px; margin-top: 12px;">
				<c:if test="${check}">
				<textarea id="reply_TEXT" class="reply_TEXT" name="reply_TEXT" cols="105" rows="4" placeholder="투표 진행 중 에는 댓글 작성이 불가합니다. 투표가 완료되면 댓글작성이 가능합니다." readonly></textarea>
				</c:if>
				<c:if test="${!check}">
				<textarea id="reply_TEXT" class="reply_TEXT" name="reply_TEXT" cols="105" rows="4"></textarea>
				</c:if>
				</div>
			</div>
		</form>
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
			   		var rNo = ${b.rNo};
			   		var voteId = ${Vote.vId};
					if(confirm("댓글을 삭제하시겠습니까?")){
						$.ajax({
			   				url: 'deleteVoteComment.co',
			   				data: {voteId:voteId, rNo:rNo},
			   				success: function(){
			   					document.location.reload();
			   				}
			   			});
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
	
		<jsp:include page="../common/Footer.jsp"/>
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
				return false;
			}
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
		
		function deleteYN(){
			var result = confirm("정말로 삭제하시겠습니까?");
			vId = "${Vote.vId}";
			if(result){
				location.href='voteDelete.vo?vId=' + vId;
			}
		}
		$(window).scroll(function() {
		     sessionStorage.scrollTop = $(this).scrollTop();
		});

		$(document).ready(function() {
		     if (sessionStorage.scrollTop != "undefined") {
		       $(window).scrollTop(sessionStorage.scrollTop);
		     }
		});
		// 댓글 등록
		$('#addComment').on('click', function(){
			var userId = '${ loginUser.userId }';
			var voteId = ${Vote.vId};
			var content = $('#reply_TEXT').val();
			$.ajax({
   				url: 'insertComment.co',
   				data: {userId:userId, voteId:voteId, content:content},
   				success: function(){
   					document.location.reload();
   				}
   			});
		});
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
  	   			var voteId = ${ Vote.vId };
   				var rNo = b;
   				var content = $('.rrContent' + a).val();
   				console.log(typeof voteId);
   				console.log(typeof b);
   				console.log(typeof content);
  	   			$.ajax({
  	   				url: 'updateVoteComment.co',
  	   				data: {voteId:voteId, content:content, rNo:b},
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
   				url: 'insertVoteReComment.co',
   				data: {userId:userId, rNo:rNo, content:content},
   				success: function(data){
   					document.location.reload();
   				}
   			});
   		});
   		
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
   		   				url: 'deleteComment3.co',
   		   				data: {rrNo:rrNo},
   		   				success: function(data){
   		   					$rreply = $('#rreply' + i);
   		   					$rreply.html("");
							$rreply.css('display', 'none');
   		   				}
   					}); 
   		   		}	
   		   	}); 		
   		
   		
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
	</script>
		
</body>
</html>
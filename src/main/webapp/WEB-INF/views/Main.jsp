<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body{min-height: 100%; letter-spacing: -1px; position: relative;}
	.back{border: 1px solid black; height: 60%;}
	.back>img{width: 100%; height: 100%;}
	.board_box{margin-top: 20px; overflow: hidden; width: 80%; margin-left: auto;     margin-bottom: 1%; margin-right: auto;}
	.mboard{border: 1px solid #dedede; float: left;}
	.board_box .noti_board{width: 666px; margin-right: 60px; }
	.mboard .title{padding: 20px; border-bottom: 1px solid #dedede; font-size: 16px; font-weight: bold; color: #222; margin: 0;}
	.mboard .title span{font-size: 12px; font-weight: normal; color: #6a6a6a; margin-left: 7px;}
	.noti_board_cate, .comu_board_cate{padding: 20px; position: relative;}
	.noti_board_cate ul{margin-bottom: 20px;}
	.comu_board_cate ul{margin-bottom: 20px;}
	.cate a:hover{color: #62B3B6;}
	
	.noti_board_cate .cate a, .comu_board_cate .cate a{font-size: 14px; font-weight: bold; letter-spacing: -2px;}
	.board_box .comu_board{width: 400px;}
	.comu_board_cate li{float: left; padding: 0 10px;}
	.comu_board_cate li:first-child{padding-left: 0;}
	.comu_board_cate li:nth-child(2){background: url(resources/images/tab_bar.gif) 0 center no-repeat;}
	.noti_more, .comu_more{display: block; width: 21px; height: 21px; position: absolute; top: 20px; right: 20px; background: url(resources/images/tab_more_btn.jpg) 0 0 no-repeat;}
	#comunity_list li{
		float:none;
		background: white;
		padding: 0;
	}
	.li{
		 display: inline-block;
		 overflow: hidden; 
		 text-overflow: ellipsis; 
		 white-space: nowrap;
	}
	.cate{
		cursor : pointer;
	}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	<div class="back"><img src="resources/images/main_back2.png"></div>
	<div class="board_box">
		<div class="mboard noti_board">
			<p class="title">공지사항<span>아파트 새 소식을 확인해주세요!</span></p> 
			<div class="noti_board_cate">
				<ul>
					<li class="cate"><a>공지사항</a></li>
				</ul>
				<a href="noticeList.no" class="noti_more"></a>
				<ul id="notice_list">
					
				</ul>
			</div>
		</div>
		<!-- 공지사항 불러오기 -->
		<script>
			$(function(){
				$.ajax({
					url:'getRealNoticeList.main',
					success:function(data){
						
						$noticeUlBody = $('#notice_list');
						$noticeUlBody.html("");
						
						if(data.length == 0){
							$li = $('<li>').text("불러올 목록이 없습니다.");
							$noticeUlBody.append($li);
						}else{
							for(var i=0; i<data.length; i++){
								$li = $('<li>');
								$no = $('<b class="li" style="width: 10%;">').text(data[i].nNo);
								$title = $('<b class="li" style="width: 55%; cursor: pointer;" onclick="noticeDetail('+data[i].nNo+');">').text(data[i].nTitle);
								$id = $('<b class="li" style="width: 25%;">').text(data[i].nWriter);
								$count = $('<b class="li" style="width: 10%;">').text(data[i].nCount);
								
								$li.append($no);
								$li.append($title);
								$li.append($id);
								$li.append($count);
								$noticeUlBody.append($li);
							}
						}
					}
				});
				getRealFreeBoard();
			});
			function getRealFreeBoard(){
				$.ajax({
					url:'getRealFreeBoard.main',
					success:function(data){
						
						$('.comu_more').attr("href","list.fr");
						
						$freeUlBody = $('#comunity_list');
						$freeUlBody.html("");
						
						if(data.length == 0){
							$li = $('<li>').text("불러올 목록이 없습니다.");
							$freeUlBody.append($li);
						}else{
							for(var i=0; i<data.length; i++){
								$li = $('<li>');
								$no = $('<b class="li" style="width: 10%;">').text(data[i].boardNo);
								$title = $('<b class="li" style="width: 55%; cursor: pointer;" onclick="freeDetail('+data[i].boardNo+');">').text(data[i].boardTitle);
								$id = $('<b class="li" style="width: 25%;">').text(data[i].userId);
								$count = $('<b class="li" style="width: 10%;">').text(data[i].boardCount);
								
								$li.append($no);
								$li.append($title);
								$li.append($id);
								$li.append($count);
								$freeUlBody.append($li);
							}
						}
					}
				});
			}
			function getRealClub(){
				$.ajax({
					url:'getRealClub.main',
					success:function(data){
						
						$('.comu_more').attr("href","clubList.cb");
						
						$clubUlBody = $('#comunity_list');
						$clubUlBody.html("");
						
						if(data.length == 0){
							$li = $('<li>').text("불러올 목록이 없습니다.");
							$clubUlBody.append($li);
						}else{
							for(var i=0; i<data.length; i++){
								$li = $('<li>');
								$no = $('<b class="li" style="width: 10%;">').text(data[i].boardNo);
								$cName = $('<b class="li" style="width: 55%; cursor: pointer;" onclick="clubDetail(' + "'" + data[i].clubName + "'," + data[i].boardNo + ');">').text(data[i].clubName);
								$cPrice = $('<b class="li" style="width: 25%;">').text(data[i].clubPlace+"원");
								if(data[i].endYn == 'N'){
									$cEnd = $('<b class="li" style="width: 10%;">').text("모집중");
								}else if(data[i].endYn == 'Y'){
									$cEnd = $('<b class="li" style="width: 10%;">').text("모집마감");
								}
								
								$li.append($no);
								$li.append($cName);
								$li.append($cPrice);
								$li.append($cEnd);
								$clubUlBody.append($li);
							}
						}
					}
				});
			}
			function noticeDetail(data){
				location.href="ndetail.no?nNo="+data+"&page=1";
			}
			function freeDetail(data){
				location.href="bdetail.fr?boardNo="+data+"&page=1";
			}
			function clubDetail(name,no){
				location.href="clubDetail.cb?clubName="+name+"&boardNo="+no+"&userId="+'${loginUser.userId}'+"&page=1";
			}
		</script>
		<div class="mboard comu_board">
			<p class="title">커뮤니티<span>입주민간 자유로운 소통 공간!</span></p> 
			<div class="comu_board_cate">
				<ul>
					<li class="cate"><a onclick="getRealFreeBoard();">자유게시판</a></li>
					<li class="cate"><a onclick="getRealClub();">동호회</a></li>
				</ul>
				<br clear="all">
				<a class="comu_more"></a>
				<ul id="comunity_list">
				</ul>
			</div>
		</div>
	</div>
	
	<jsp:include page="common/Footer.jsp"/>
</body>

</html>
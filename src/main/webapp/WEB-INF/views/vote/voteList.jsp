<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/freeBoard.css"> -->
<style>
	* { box-sizing: border-box; }
	 .img {filter: brightness(70%);
		    width: 100%;
		    height: 400px;}
	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    .board_wrab {text-align: center; 
    			  color:rgb(94, 92, 92);
    			  margin-top:20px;
    			  width:100%;
    			  postion:relative;
    			  } 
    .board_wrab table{border-collapse: collapse;
    				  width: 1500px;
    				  margin: 0 auto;}
    .board_wrab thead{font-weight: bold;}
    .board_wrab td{border-bottom: 1px solid #aaa; 
    				padding:15px;}
	.board_wrab tr:first-child>td{border-top: 2px solid black;}
	.state{color: #d075a3}
    .btitle{white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;}
    .board_btn{position:absolute;
    		   margin-top:10px;
    		   margin-left:86%;}
    .btn_standard{padding:7px; 
    			  border-radius: 5px; 
    			  font-size: 0.9em; 
    			  font-weight: bold; 
                  color:rgb(139, 134, 134);}
    #writeView{padding:7px; 
    			  border-radius: 5px; 
    			  font-size: 0.9em; 
    			  font-weight: bold; 
                  color:rgb(139, 134, 134);}
	.page_wrap{display:inline-block; position:absolute; margin-top: 10px; margin-left: 47%;}
	.form_wrap{margin:30px auto 0 auto; width: 340px; margin-bottom: 80px;}

	#selectBox{
	  display: block;
	  margin-left: 85%;
	  }
	.select-box {
	  position: relative;
	  display: inline-block;
	  width: 85px;
	  margin: 40px auto 0 auto;
	  font-size: 0.9em;
	  color: #60666d;
	  }
	.select-box__current {
	  position: relative;
	  box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
	  cursor: pointer;
	  outline: none;
	  }
	.select-box__current:focus + .select-box__list {
	  opacity: 1;
	  animation-name: none;
	  }
	.select-box__current:focus + .select-box__list .select-box__option {
	  cursor: pointer;
	  }
	.select-box__current:focus .select-box__icon {
	  transform: translateY(-50%) rotate(180deg);
	  }
	.select-box__icon {
	  position: absolute;
	  top: 50%;
	  right: 15px;
	  transform: translateY(-50%);
	  width: 15px;
	  opacity: 0.3;
	  transition: 0.2s ease;
	  }
	.select-box__value {
	  display: flex;
	  }
	.select-box__input {
	  display: none;
	  }
	.select-box__input2 {
	  display: none;
	  }
	.select-box__input:checked +.select-box__input-text {
	  display: block;
	  }
	.select-box__input2:checked +.select-box__input-text {
	  display: block;
	  }
	.select-box__input-text {
	  display: none;
	  width: 100%;
	  margin: 0;
	  padding: 8px;
	  background-color: #fff;
	  }
	.select-box__list {
	  position: absolute;
	  width: 100%;
	  padding: 0;
	  list-style: none;
	  opacity: 0;
	  animation-name: HideList;
	  animation-duration: 0.5s;
	  animation-delay: 0.5s;
	  animation-fill-mode: forwards;
	  animation-timing-function: step-start;
	  box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
	  }
	.select-box__option {
	  display: block;
	  padding: 8px;
	  background-color: #fff;
	  }
	.select-box__option:hover, .select-box__option:focus {
	  color: #546c84;
	  background-color: #fbfbfb;
	  }
	
	@keyframes HideList {
	  from {
	            transform: scaleY(1);
	  }
	  to {
	            transform: scaleY(0);
	  }
	}
	
	.search_input{height:33.75px; margin:0 5px;}
	
	#paging_table a{
	 	color:black;
	}
	
	.vlist:hover{
		background-color: #f7f7f7;
		cursor: pointer;
	}
	.btn-standard {border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px;}
</style>
</head>
<body>
<!-- 	<img class="img" src="resources/images/voteImage.png"> -->
	<img class="img" src="resources/images/투표3.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2 style="font-weight:700;">투표 게시판</h2>
	</div>
	<div class="select-box" id="selectBox">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="latest" value="latest" name="Ben" checked="checked"/>
		      <p class="select-box__input-text">최신순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="continue" value="continue" name="Ben"/>
		      <p class="select-box__input-text">진행중</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="finish" value="finish" name="Ben"/>
		      <p class="select-box__input-text">종료순</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list" style="display:hidden">
		    <li>
		      <label class="select-box__option" for="latest" aria-hidden="aria-hidden">최신순</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="continue" aria-hidden="aria-hidden">진행중</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="finish" aria-hidden="aria-hidden">종료순</label>
		    </li>
		  </ul>
	</div>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
	<div class="board_wrab">
        <table>
            <thead>
                <tr>
                    <td style="width: 5%;">번호</td>
                    <td class="btitle">제목</td>
                    <td style="width: 7%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 9%;">진행상태</td>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${vlist != null && !vlist.isEmpty()}">
            		<c:forEach var="i" begin="0" end="${vlist.size()-1}">
            			<tr class="vlist">
            				<td>${vlist[i].vId}</td>
            				<td>${vlist[i].vName}</td>
            				<td>${vlist[i].userId}</td>
            				<td>${vlist[i].createDate}</td>
            				<c:if test="${today < vlist[i].endDate }">
	            				<td>투표중</td>
	            			</c:if>
	            			<c:if test="${today >= vlist[i].endDate }">
	            				<td>투표종료</td>
	            			</c:if>
            			</tr>
            		</c:forEach>
            	</c:if>
            	<c:if test="${vlist == null || vlist.isEmpty()}">
                <tr>
                    <td colspan="5">불러올 투표가 없습니다.</td>
                </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    <div class="page_wrap">
	  	<table id="paging_table">
	  		<!-- 페이징 처리 -->
				<tr align="center" height="20" id="buttonTab">
					<td colspan="4">
					<br>
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							<b class="btn-standard" >이전</b>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="voteList.vo">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="option" value="${ keyword.option }"/>
								<c:param name="search" value="${ keyword.search }"/>
								<c:param name="sOption" value="${ keyword.sOption }"/>
							</c:url>
							<a class="btn-standard" href="${ before }">이전</a>
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font size="4"><b class="btn-standard" style="color: red;">${ p }</b></font>
							</c:if>
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="voteList.vo">
									<c:param name="page" value="${ p }"/>
									<c:param name="option" value="${ keyword.option }"/>
									<c:param name="search" value="${ keyword.search }"/>
									<c:param name="sOption" value="${ keyword.sOption }"/>
								</c:url>
								<a class="btn-standard" href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<b class="btn-standard" >다음</b>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="voteList.vo">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
								<c:param name="option" value="${ keyword.option }"/>
								<c:param name="search" value="${ keyword.search }"/>
								<c:param name="sOption" value="${ keyword.sOption }"/>
							</c:url> 
							<a class="btn-standard" href="${ after }">다음</a>
						</c:if>
					</td>
				</tr>
	  	</table>
    </div>
    <c:if test="${loginUser.userLevel > 1}">
	    <div class="board_btn">
	       <button id="writeView">투표작성</button>
	    </div>
    </c:if>
    <div class="form_wrap">
	    <div class="select-box">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input2" type="radio" id="total" value="total" name="Ben2" checked="checked"/>
		      <p class="select-box__input-text">전체</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input2" type="radio" id="content" value="content" name="Ben2"/>
		      <p class="select-box__input-text">내용</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list">
		    <li>
		      <label class="select-box__option" for="total" aria-hidden="aria-hidden">전체</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="content" aria-hidden="aria-hidden">내용</label>
		    </li>
		  </ul>
		</div>
		<input class="search_input" name="text" type="text">
		<button class="btn_standard" type="submit">검색</button>
	</div>
	<form action="voteDetail.vo" name="detail" method="post">
		<input type="hidden" id="vId" name="vId">
		<input type="hidden" id="check" name="check">
		<input type="hidden" id="page" name="page">
		<input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
	</form>
	<script>
		$(function(){
			// 목록 조건 받아오기 (검색, 최신순 등)
			option = "${ keyword.option }";
			sOption = "${ keyword.sOption }";
			search = "${ keyword.search }";
			if(option == $('#continue').val()){
				$('#continue').prop('checked',true);
			}else if(option == $('#finish').val()){
				$('#finish').prop('checked',true);
			}
		});
		
		// 최신순, 종료순, 진행중 정렬가져오기
		$('.select-box__input').change(function(){
			option = $('input[name="Ben"]:checked').val();
			
			/* location.href="voteList.vo?page=" + ${ pi.currentPage } + "&option=" + option + "&sOption=" + sOption + "&search=" + search; */
			location.href="voteList.vo?page=" + ${ pi.currentPage } + "&option=" + option;
		});
		
		// 검색한 결과 가져오기
		$('.btn_standard').click(function(){
			if($('.search_input').val().length > 0){
				search = $('.search_input').val();
			}else{
				alert('검색어를 입력해주세요.');
				return;
			}
			sOption = $('input[name="Ben2"]:checked').val();
			location.href="voteList.vo?page=" + ${ pi.currentPage } + "&sOption=" + sOption + "&search=" + search;
		});
		
		// 작성 페이지 이동
		$('#writeView').click(function(){
			location.href="writeVoteView.vo";
		});
		
		// 상세 페이지 이동
		$('.vlist').click(function(){
			var vId = $(this).children().eq(0).text();
			var vCheck = $(this).children().eq(4).text();
			
			// 진행중이냐 아니냐에 따라 다른 url을 보냄
			if(vCheck == '투표중'){
				vCheck = true;
			}else{
				vCheck = false;
			}
			
			$('#vId').val(vId);
			$('#check').val(vCheck);
			$('#page').val('${pi.currentPage}');
			
			document.detail.submit();
		});
	</script>
	<jsp:include page="../common/Footer.jsp"/>	
</body>
</html>
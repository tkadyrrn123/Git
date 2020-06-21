<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
   .wrapper{margin-top: 20px;}
/* 	#title{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;} */
/* 	#line{width: 90%; background: lightgray; height:2px; margin: auto; margin-top: 20px;} */
	.sellAll{width: 90%; margin: 100px auto 0px auto; postion:relative;line-height: 1.6}
	.sell{width: 350px; display: inline-block; margin-left: 100px; margin-bottom:50px;text-align:center;
		  border:1px solid #aaa; border-radius:5px; padding-bottom:15px;
		  box-shadow: 0 2px 40px 0 rgba(0,0,0,0.07);
		  transition: box-shadow .3s ease-out, transform .3s ease-out, opacity .2s ease-out;
		  transition-delay: .1s;
		  transform: translateZ(0);
		  }
	.sell:hover{
				cursor:pointer;	
				opacity: 1 !important;
			    box-shadow: rgba(45,45,45,0.05) 0px 2px 2px, rgba(49,49,49,0.05) 0px 4px 4px, rgba(42,42,42,0.05) 0px 8px 8px, rgba(32,32,32,0.05) 0px 16px 16px, rgba(49,49,49,0.05) 0px 32px 32px, rgba(35,35,35,0.05) 0px 64px 64px;
			    transform: translate(0, -4px);
			    z-index: 999;
				}
	.sellDiv{width: 100%; height: 300px;}
	.sellPic{width: 100%; height: 210px;}
	.sellName{width: 100%; height: 10%; font-size: 20px; font-weight:bold;margin-top:10px;}
	.sellName>a{color: black !important;}
	.sellName>a:visited{color: gray !important;}
	.sellAddress{width: 100%; height: 10%;}
	.sellPrice{width: 100%; height: 10%;}
	.btn_standard {
	   border: 1px solid #dad4d4;
	    border-radius: 6px;
	    background-color: #fff;
	    font-weight: 500;
	    color: #666;
	    cursor: pointer;
	    font-size: 12px;
	    padding: 10px;
	}
	#write-btn{
		position: absolute;
		margin-top: -50px;
		right: 180px;
/*  		margin-right: -10px;  */
	}

/* 	.marketFilterForm{position:absolute; width: 300px; display:inline-block; left:44%;} */
/* 	.marketSelect>option{padding: 5px;} */
	.form_wrap{margin:30px auto 0 auto; width: 340px; position:relative;}
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
      border: 1px solid #dad4d4;
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
	.select-box__input:checked +.select-box__input-text {
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
	
 	.search_input{height:37px; margin:0 5px; vertical-align:bottom; border:1px solid #dad4d4;} 
	
/* 	#btn_search{board:1px solid black; } */
	
/* 	#write-btn{float: right; */
/* 				margin-right: 344px; */
/* 			   }	 */
	.pagingArea{margin-top: 90px;}	
	
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
	
	<div class="wrapper">
<!-- 		<div id= title> -->
<!-- 			중고 장터 -->
<!-- 		</div> -->
<!-- 		<div id="line"></div> -->
		
		<!-- 게시글 리스트 -->
		<div class=sellAll>
			<c:forEach var="m" items="${list}">
				<div class=sell>
					<div class=sellDiv>
						<div class="hidden" style="display:none">${m.boardNo}</div>
						<div class=sellPic><img class=sellPic src="resources/marketUploadFiles/${ m.fileName }"/></div>
						<div class=sellName>
							<c:url var="madetail" value="marketDetail.ma">
								<c:param name="boardNo" value="${m.boardNo}"/>
								<c:param name="page" value="${pi.currentPage}"/>
							</c:url>
							<a href="${madetail}">${m.boardTitle}</a>
						</div>
						<div class=sellAddress>${m.userId}</div>
						<div class=sellPrice>${m.price}원</div>
					</div>
				</div>
			</c:forEach>
		</div>		
		<div class="form_wrap">
		    <form class="board_search" name="search_form" action="get">
			    <div class="select-box">
				  <div class="select-box__current" tabindex="1">
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="total" value="total" name="Ben" checked="checked"/>
				      <p class="select-box__input-text">전체</p>
				    </div>
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="writer" value="writer" name="Ben"/>
				      <p class="select-box__input-text">작성자</p>
				    </div>
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="content" value="content" name="Ben"/>
				      <p class="select-box__input-text">내용</p>
				    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
				  </div>
				  <ul class="select-box__list">
				    <li>
				      <label class="select-box__option" for="total" aria-hidden="aria-hidden">전체</label>
				    </li>
				    <li>
				      <label class="select-box__option" for="writer" aria-hidden="aria-hidden">작성자</label>
				    </li>
				    <li>
				      <label class="select-box__option" for="content" aria-hidden="aria-hidden">내용</label>
				    </li>
				  </ul>
				</div>
				<input class="search_input" name="text" type="text">
				<button class="btn_standard" type="submit">검색</button>
			</form>
		</div>
		<button id="write-btn" class="btn_standard" type="button" value="글쓰기" onclick="location.href='writingMarket.ma'">글쓰기</button>
		
		
		<!-- 페이징 처리 -->
		<div class="pagingArea" align="center">
			<!-- [이전] -->
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="blist.bo">
					<c:param name="page" value="${ pi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
				
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
					
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="blist.bo">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
				
			<!-- [다음] -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				[다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="after" value="blist.bo">
					<c:param name="page" value="${ pi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>
        </div>
	</div>
	<jsp:include page="../common/Footer.jsp"/>	
	
	<script>
// 		$('.sell').on('click', function(){
// 			location.href="marketDetail.ma?boardNo=${m.boardNo}&page=${ page }"
// 		});
	</script>

	
	
</body>
</html>
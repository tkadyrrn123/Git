<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/css/marketList.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<c:if test="${empty m.fileName}">
							<div class=sellPic><img class=sellPic src="resources/images/basicMarket.jpeg"/></div>
						</c:if>
						<c:if test="${!empty m.fileName}">
							<div class=sellPic><img class=sellPic src="resources/marketUploadFiles/${ m.fileName }"/></div>
						</c:if>
						<div class=sellName>
							<c:url var="madetail" value="marketDetail.ma">
								<c:param name="boardNo" value="${m.boardNo}"/>
								<c:param name="page" value="${pi.currentPage}"/>
							</c:url>
							<a href="${madetail}">${m.boardTitle}</a>
						</div>
						<div class="insideWrap">
							<span class=sellId><i class="fas fa-user-circle"></i> ${m.nickName}</span>
							<span class="views"><i class="fas fa-eye"></i> ${m.boardCount}</span>
							<span class=sellPrice><i class="fas fa-won-sign"></i> ${m.price}</span>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${ empty list }">
			<span class="emptyCom">
        	 등록된 게시글이 없습니다.
        	 </span>
       		</c:if>
		</div>		
		
		<!-- 페이징 처리 -->
		<c:if test="${!empty list }">
        	<div class="pagingArea" align="center">

		<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn_standard">이전</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="market.ma">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn_standard" onclick="location.href='${ before }'">이전</button>
				</c:if>
				
		<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn_standard">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="market.ma">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn_standard" onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn_standard">다음</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="market.ma">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<button class="btn_standard" onclick="location.href='${ after }'">다음</button>
				</c:if>
       		</div>
       		
       		<div class="form_wrap">
		    <form class="board_search" name="search_form" action="filter.ma">
			    <div class="select-box">
				  <div class="select-box__current" tabindex="1">
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="total" value="title" name="condition" checked="checked"/>
				      <p class="select-box__input-text">제목</p>
				    </div>
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="writer" value="writer" name="condition" />
				      <p class="select-box__input-text">작성자</p>
				    </div>
				    <div class="select-box__value">
				      <input class="select-box__input" type="radio" id="content" value="content" name="condition" />
				      <p class="select-box__input-text">내용</p>
				    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
				  </div>
				  <ul class="select-box__list">
				    <li>
				      <label class="select-box__option" for="title" aria-hidden="aria-hidden">전체</label>
				    </li>
				    <li>
				      <label class="select-box__option" for="writer" aria-hidden="aria-hidden">작성자</label>
				    </li>
				    <li>
				      <label class="select-box__option" for="content" aria-hidden="aria-hidden">내용</label>
				    </li>
				  </ul>
				</div>
				<input class="search_input" name="filterValue" type="text">
				<button class="btn_standard" type="submit">검색</button>
			</form>
		</div>
			</c:if>
		<button id="write-btn" class="btn_standard" type="button" value="글쓰기" onclick="location.href='writingMarket.ma'">글쓰기</button>
	</div>
	<jsp:include page="../common/Footer.jsp"/>	
	
	<script>
		$('.sell').on('click', function(){
			location.href="${madetail}";
		});
		
		
	</script>

	
	
</body>
</html>
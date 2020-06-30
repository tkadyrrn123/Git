<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/freeBoard.css"> -->
<style>
.fbTitle{color: black !important;}
.fbTitle:visited{color: gray !important;}

/* 페이징 */
#prev{color: black !important;}
#present{color: black !important;}
#next{color: black !important;}

	* { box-sizing: border-box; }
/* 	body { background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); } */
 	.commnuity_header { 
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em; 	
 	} 
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
	#board_head{border-top: 2px solid black;}
    .btitle{white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;}
    .board_btn{position:absolute;
    		   margin-top:10px;
    		   margin-left:80%;}
    .btn_standard{padding:7px; 
    			  border-radius: 5px; 
    			  font-size: 0.9em; 
    			  font-weight: bold; 
                  color:rgb(139, 134, 134);
                  border:0;}
    #btnTr{text-align: right; border-bottom: none;}              
	#btnWriting{padding:7px; 
    			  border-radius: 5px; 
    			  font-size: 0.9em; 
    			  font-weight: bold; 
                  color:rgb(139, 134, 134);
                  border:0;}
    /*페이징 버튼  */
	.btn-standard {border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px;}              

	.page_wrap{margin-top: 10px; margin-left: 40%;}
	.form_wrap{margin:30px auto 0 auto; width: 340px; margin-bottom: 150px;}

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
	
#titleCrop{width: 100%; overflow: hidden; max-height: 400px;}
#titleCrp>img{max-height: initial;}
.img { 
     /* filter: brightness(70%); */
     width: 100%;  
}	
</style>
</head>
<body>
	<div id="titleCrop"><img class="img" src="resources/images/gif_title.gif"></div>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<b>자유 게시판</b>
	</div>
	<div class="select-box" id="selectBox">
	
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="latest" value="latest" name="sortCondition" checked="checked"/>
		      <p class="select-box__input-text">최신순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="hits" value="hits" name="sortCondition"/>
		      <p class="select-box__input-text">조회순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="like" value="content" name="sortCondition"/>
		      <p class="select-box__input-text">추천순</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  
		  <ul class="select-box__list" style="display:hidden">
		    <li>
		      <label class="select-box__option" for="latest" aria-hidden="aria-hidden">최신순</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="hits" aria-hidden="aria-hidden">조회순</label>
		    </li>
		  </ul>
	</div>
	<script>
		$(function(){
			var sortCondition = '${ sortCondition }';
			if(sortCondition == ""){
				$('#latest').prop('checked', 'checked');
			} else if(sortCondition == "hits") {
				$('#hits').prop('checked', 'checked');
			}
		})		
		$('.select-box__input').click(function(){
			var sortCondition = $(this).val();
			location.href="sort.fr?sortCondition="+sortCondition;
		});
	</script>
	<div class="board_wrab">
        <table>
            <thead>
                <tr id="board_head">
                    <td style="width: 5%;">번호</td>
                    <td class="btitle">제목</td>
                    <td style="width: 7%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 6%;">조회수</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="fb" items="${ list }">
                <tr>
                    <td>${ fb.boardNo }</td>               
                    <td>
                    	<c:url var="bdetail" value="bdetail.fr">
                    		<c:param name="boardNo" value="${fb.boardNo}"/>
                    		<c:param name="page" value="${pi.currentPage}"/>
                    	</c:url>
                    	<a href="${ bdetail }" class="fbTitle">${ fb.boardTitle}</a>
                    </td>
                    <td>${ fb.nickname }</td>
                    <td>${ fb.createDate}</td>
                    <td>${ fb.boardCount }</td>
                </tr>
            </c:forEach>   
            </tbody>
            <tfoot>
            	<tr>
            		<td colspan="5" id="btnTr">
            			<button id="btnWriting" onclick="location.href='writing.fr'">글쓰기</button>
            		</td>
            	</tr>
            </tfoot>
        </table>
    </div>
    
    <div class="page_wrap">
    <!-- 
    <button type="button" class="btn_standard">1</button>
     -->
    <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn-standard">이전</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
				<c:url var="before" value="list.fr">
<%-- 					<c:url var="before" value="${ loc }"> --%>
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
						<c:if test="${ searchValue ne null }">
							<c:param name="condition" value="${ condition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
					</c:url>
					<button class="btn-standard" id="prev" onclick="location.href='${ before }'">이전</button>
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn-standard" style="color:red;">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
<%-- 						<c:url var="pagenation" value="${ loc }"> --%>
						<c:url var="pagination" value="list.fr">
							<c:param name="page" value="${ p }"/>
						<c:if test="${ searchValue ne null }">
							<c:param name="condition" value="${ condition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
						</c:url>
						<button class="btn-standard" onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn-standard">다음</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
						<c:if test="${ searchValue ne null }">
							<c:param name="condition" value="${ condition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>						
					</c:url> 
					<button class="btn-standard" id="next" onclick="location.href='${ after }'">다음</button>
				</c:if>
				
    </div>
    <!-- 
    <div class="board_btn">
       <button class="btn_standard" onclick="location.href='writing.fr'">글쓰기</button>
    </div>
     -->
    <div class="form_wrap">
    <form class="board_search" name="search_form" action="search.fr">
	    <div class="select-box">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="total" value="title" name="condition" checked="checked"/>
		      <p class="select-box__input-text">제목</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="writer" value="writer" name="condition"/>
		      <p class="select-box__input-text">작성자</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="content" value="content" name="condition"/>
		      <p class="select-box__input-text">내용</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list">
		    <li>
		      <label class="select-box__option" for="total" aria-hidden="aria-hidden">제목</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="writer" aria-hidden="aria-hidden">작성자</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="content" aria-hidden="aria-hidden">내용</label>
		    </li>
		  </ul>
		</div>
		<input class="search_input" name="searchValue" type="text">
		<button class="btn_standard" type="submit">검색</button>
	</form>
	</div>
	<jsp:include page="../common/Footer.jsp"/>	
</body>
</html>
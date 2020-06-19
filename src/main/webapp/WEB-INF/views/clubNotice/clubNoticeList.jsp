<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 공지사항</title>
<style>
	* { box-sizing: border-box; }
	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    .board_wrab {text-align: center; 
    			  color:rgb(94, 92, 92);
    			  margin-top: 20px;
    			  width:100%;
    			  postion:relative;
    			  } 
    .board_wrab table{border-collapse: collapse;
    				  width: 1500px;
    				  margin: 0 auto;}
    .board_wrab thead{font-weight: bold;}
    .board_wrab td{border-bottom: 1px solid #aaa; 
    				padding:15px;}
	#notice_tr{border-top: 2px solid black;}
	.dong{color: #7d6451}
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
                  color:rgb(139, 134, 134);
                  border: 0;}
    .img {filter: brightness(70%);
		    width: 100%;
		    height: 400px;}	    
	#buttonTab{border-left: hidden; border-right: hidden;}
	#notice_list_tb a{color:rgb(139, 134, 134);}
	#notice_page_tb a{color:rgb(139, 134, 134);}	
 	#notice_list_tb thead tr td{background-color:#eff3f9;}
	#notice_list_tb tbody tr:nth-child(even){background-color:#eff3f9;}
	
	/*페이징 버튼  */
	.btn-standard {border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px;}

	/*서치 */
	.form_wrap{margin:30px auto 0 auto; width: 340px; margin-bottom: 200px;}
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
      margin-top: 20px;
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
	  
</style>
</head>
<body>
	<img class="img" src="resources/images/clubNotice.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2>동호회 공지사항</h2>
	</div>
<!--동 정렬 시작--------------------------------------------------------------------------------------------------  -->
	<div class="select-box" id="selectBox">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="latest" value="latest" name="Ben" checked="checked"/>
		      <p class="select-box__input-text">최신순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="hits" value="hist" name="Ben"/>
		      <p class="select-box__input-text">조회순</p>
		    </div>
		    <img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
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
<!--정렬 끝---------------------------------------------------------------------------------------------------->		
	
	<div class="board_wrab">
        <table id="notice_list_tb">
            <thead>
                <tr id="notice_tr">
                    <td style="width: 7%;">번호</td>
                    <td class="dong" style="width: 9%;">동호회명</td>
                    <td class="btitle">제목</td>
                    <td style="width: 10%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 7%;">조회수</td>
                </tr>
            </thead>   

            <tbody>

             <c:forEach var="cn" items="${ list }">
                <tr>
                   <td align="center">${ cn.cnNo }</td>
                    <td class="dong">${ cn.clubName }</td>
                    <td class="notice_list_td">
						<c:url var="cndetail" value="cndetail.cn">
							<c:param name="cnNo" value="${ cn.cnNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="${ cndetail }">${ cn.cnTitle }</a>
                    </td>
                    <td align="center">${ cn.cnoticeNickname }</td>
                    <td align="center">${ cn.cnCreateDate }</td>
                    <td align="center">${ cn.cnCount }</td>
                </tr>
             </c:forEach>

            </tbody>

        </table>
	        <div class="board_btn">
				<button class="btn_standard" onclick="location.href='cnoticeInsertView.cn';">공지작성</button>
	    	</div>
        <!---------- 페이징 처리 -------->
		<table id="notice_page_tb">
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						<button class="btn-standard">이전</button>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="clubNoticeList.cn">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
	<!--검색조건 시작  ----------------------------------------------------->	
						<c:if test="${ cnSearchValue ne null }">
							<c:param name="cnSearchCondition" value="${ cnSearchCondition }" />
							<c:param name="cnSearchValue" value="${ cnSearchValue }" />
						</c:if>
	<!--검색조건  끝 ---------------------------------------------------->	
							
						</c:url>
						<button class="btn-standard" onclick="location.href='${ before }'">이전</button>
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<button class="btn-standard" style="color:red;">${ p }</button>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="clubNoticeList.cn">
								<c:param name="page" value="${ p }"/>
	<!--검색조건 시작 ----------------------------------------------------->	
						<c:if test="${ cnSearchValue ne null }">
							<c:param name="cnSearchCondition" value="${ cnSearchCondition }" />
							<c:param name="cnSearchValue" value="${ cnSearchValue }" />
						</c:if>
	<!--검색조건  끝 ------------------------------------------------------->
								
							</c:url>
							<button class="btn-standard" onclick="location.href='${ pagination }'">${ p }</button>
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<button class="btn-standard">다음</button>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="clubNoticeList.cn">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
	<!--검색조건 시작  ------------------------------------------------------------->	
							<c:if test="${ cnSearchValue ne null }">
								<c:param name="cnSearchCondition" value="${ cnSearchCondition }" />
								<c:param name="cnSearchValue" value="${ cnSearchValue }" />
							</c:if>
	<!--검색조건  끝 --------------------------------------------------------------->	
							
						</c:url> 
						<button class="btn-standard" onclick="location.href='${ after }'">다음</button>
					</c:if>
				</td>
			</tr>
		</table>
    </div>
 <!------------------------ 검색 ---------------------------------->
    <div class="form_wrap" id="nsearchArea">
    <form class="board_search" name="cnsearch_form" action="clubNoticeSearch.cn">
	    <div class="select-box">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="cnTotal" value="cnTotal" name="cnSearchCondition" checked="checked"/>
		      <p class="select-box__input-text">전체</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id=cnoticeNickname value="cnoticeNickname" name="cnSearchCondition"/>
		      <p class="select-box__input-text">작성자</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="cnTitle" value="cnTitle" name="cnSearchCondition"/>
		      <p class="select-box__input-text">제목</p>
		    </div>
		     <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="clubName" value="clubName" name="cnSearchCondition"/>
		      <p class="select-box__input-text">동호회</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="cnContent" value="cnContent" name="cnSearchCondition"/>
		      <p class="select-box__input-text">내용</p>
		    </div>
		    <img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list">
		    <li>
		      <label class="select-box__option" for="cnTotal" aria-hidden="aria-hidden">전체</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="cnoticeNickname" aria-hidden="aria-hidden">작성자</label>
		    </li>
		     <li>
		      <label class="select-box__option" for="cnTitle" aria-hidden="aria-hidden">제목</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="clubName" aria-hidden="aria-hidden">동호회</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="cnContent" aria-hidden="aria-hidden">내용</label>
		    </li>
		  </ul>
		</div>
		<input class="search_input" id="cnSearchValue" name="cnSearchValue" type="search">
		<button class="btn_standard" type="submit">검색</button>
	</form>
	</div>
 <!------------------------ 검색 끝 ---------------------------------->
	
	<jsp:include page="../common/Footer.jsp"/>	
</body>
</html>
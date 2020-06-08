<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* { box-sizing: border-box; }
	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    .board_wrab {text-align: center; 
    			  color:rgb(94, 92, 92);
    			  margin-top: 50px;
    			  width:100%;
    			  postion:relative;
    			  margin-bottom: 200px;
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
</style>
</head>
<body>
	<img class="img" src="resources/images/noticeImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2>공지사항</h2>
	</div>
	<div class="board_wrab">
        <table id="notice_list_tb">
            <thead>
                <tr id="notice_tr">
                    <td style="width: 7%;">번호</td>
                    <td class="dong" style="width: 9%;">동</td>
                    <td class="btitle">제목</td>
                    <td style="width: 10%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 7%;">조회수</td>
                </tr>
            </thead>   

            <tbody>

             <c:forEach var="n" items="${ list }">
                <tr>
                   <td align="center">${ n.nNo }</td>
                    <td class="dong">101동</td><!-- 동표시되어야함 -->
                    <td class="notice_list_td">
						<c:url var="ndetail" value="ndetail.no">
							<c:param name="nNo" value="${ n.nNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="${ ndetail }">${ n.nTitle }</a>
                    </td>
                    <td align="center">${ n.userId }</td>
                    <td align="center">${ n.nCreateDate }</td>
                    <td align="center">${ n.nCount }</td>
                </tr>
             </c:forEach>

            </tbody>

        </table>
        
        <div class="board_btn">
			<button class="btn_standard" onclick="location.href='noticeInsertView.no';">글쓰기</button>
    	</div>
        
        <!---------- 페이징 처리 -------->
		<table id="notice_page_tb">
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="noticeList.no">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }] &nbsp;</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="noticeList.no">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						&nbsp; [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="noticeList.no">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">&nbsp; [다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
    </div>
	<jsp:include page="../common/Footer.jsp"/>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<style>
	#myBoardTable{
		margin:0 auto;
		border-collapse:collapse;
	}
	#myBoardTable thead th{
    background: #6f809a;
    color: #fff;
    border: 1px solid #60718b;
    font-weight: normal;
    text-align: center;
    padding: 8px 5px;
    font-size: 0.92em;
	}
	#myBoardTable tbody td{
	    border: 1px solid #d6dce7;
	    padding: 5px;
	    text-align: center;
	    line-height: 22px;
	}
	.number{
		width: 50px;
	}
	.name{
		width: 450px;
	}
	.date{
		width: 150px;
	}
	.type{
		width: 70px;
	}
	.topBoard>th{
		border-bottom: 2px solid gray;
	}
	.bottomBoard>tr:last-child>td{
		border-bottom: 2px solid gray;
	}
	#pagingTable a{
	color: black;
	}
	.bottomBoard>tr:nth-child(even){
		background-color: #CEF6F5;
	}
	.myPageUl li:nth-child(5) {
	background-color: #8181F7;
	}
	.cContent{
		cursor: pointer;
	}
</style>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">내 댓글</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
	<table id = "myBoardTable">
		<thead>
			<tr class="topBoard">
				<th class="number">No.</th>
				<th class="name">제목</th>
				<th class="date">작성일</th>
				<th class="type">게시판</th>
			</tr>
		</thead>
		<tbody class="bottomBoard">
			<c:if test="${clist != null && !clist.isEmpty()}">
				<c:forEach var="i" begin="0" end="${clist.size()-1}">
					<tr>
						<td>${clist[i].replyNo}</td>
						<td class=cContent onclick="detailBoard('${clist[i].type}',${clist[i].boardNo},${clist[i].noticeNo},${clist[i].voteId},'${clist[i].cName}');">${clist[i].replyContent}</td>
						<td>${clist[i].commentDate}</td>
						<td>${clist[i].type}</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${clist == null || clist.isEmpty()}">
				<tr>
					<td colspan="3">불러올 내 댓글이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab">
				<td colspan="3">
					<br>
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myComment.my">
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
							<c:url var="pagination" value="myComment.my">
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
						<c:url var="after" value="myComment.my">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
	<script>
		function detailBoard(type, no, noticeNo, voteId,cName){
			
			if('자유' == type){
				location.href="bdetail.fr?boardNo=" + no + "&page=1";
			}else if('중고장터' == type){
				location.href="marketDetail.ma?boardNo=" + no + "&page=1";
			}else if('동호회' == type){
				location.href="clubDetail.cb?clubName=" + cName + "&page=1&boardNo=" + no + "&userId=${loginUser.userId}";
			}else if('동호회 공지' == type){
				location.href="cndetail.cn?cnNo=" + no + "&page=1";
			}else if('공지' == type){
				location.href="ndetail.no?nNo=" + noticeNo + "&page=1";
			}else if('투표' == type){
				location.href="voteDetail.vo?vId=" + voteId + "&page=1&userId=${loginUser.userId}";
			}
		}
	</script>
</body>
</html>
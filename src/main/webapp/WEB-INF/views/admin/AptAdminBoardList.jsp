<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>

body,html{
	margin: 0;
    padding: 0;
    font-size: 0.75em;
    font-family: 'Malgun Gothic',"맑은 고딕",AppleGothic,Dotum,"돋움", sans-serif;
    background: #f3f3f3;
    height: 100%;
    position: relative;
}
#wrapper{height: 100%;}
#container{
    margin-top: 100px;
    height: 90%;
    background: #fff;
    min-width: 1200px;
}
#container_title{
	position: fixed;
    top: 38px;
    left: 0;
    width: 100%;
    line-height: 50px;
    font-size: 18px;
    padding: 0 20px;
    padding-left: 70px;
    border-bottom: 1px solid #ddd;
    background: #fff;
    z-index: 99;
}

table{
	clear: both;
    width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
    font-size: 15px;
}
table thead th{
	background: #749a6f;
    color: #fff;
    border: 1px solid #638b60;
    font-weight: normal;
    text-align: center;
    padding: 10px 5px;
    font-size: 0.92em;
}
tbody td{
	border: 1px solid #dde7d6;
    padding: 5px;
    text-align: center;
    line-height: 22px;
}

tbody tr:nth-child(even){background:#f3f9ef}
a:link, a:link{color: #000; text-decoration: none;}
a{cursor: pointer;}

.btn_01{
	display: inline-block;
    line-height: 30px;
    height: 30px;
    font-size: 0.92em;
    vertical-align: top;
}
.btn_01:nth-child(n+2){margin-left: 5px;}
.text{
	float: left;
    background: #9ec6a3;
    color: #fff;
    border-radius: 5px 0 0 5px;
    padding: 0 5px;
}
.num{
	float: left;
    background: #ededed;
    color: #666;
    border-radius: 0 5px 5px 0;
    padding: 0 5px;
}
#button{margin: 13px 0;}
#search{margin: 13px 0;}
#searchOption{
	height: 30px;
    margin-right: 3px;
    border: 1px solid #dcdcdc;
    vertical-align: top;
}
#searchText{
	height: 28px;
    border: 1px solid #dcdcdc;
    padding: 0 5px;
    background: url(resources/images/input.gif) top right no-repeat #fff !important;
    vertical-align: top;
}
textarea, select{    
	font-family: 'Malgun Gothic',"맑은 고딕",AppleGothic,Dotum,"돋움", sans-serif;
    font-size: 1em;
}
#btn_submit{
	width: 30px;
    height: 30px;
    border: 0;
    padding: 0;
    background: url(resources/images/sch_btn.png) no-repeat 50% 50% #eee;
    border: 1px solid #dcdcdc;
    text-indent: -999px;
    overflow: hidden;
    cursor: pointer;
    vertical-align: top;
    margin-left: 5px;
}

#pageBtn{
	clear: both;
    margin: 0 0 20px;
    padding: 60px 0 0;
    text-align: center;

}
.pg{display: inline-block;}

.pg_btn, .pg_current{
	color: black;
    display: inline-block;
    float: left;
    padding: 0 13px;
    line-height: 30px;
    text-decoration: none;
    border: 1px solid #ddd;
    margin-left: -1px;
    background: white;
}
.pg_current{display: inline-block;
    background: #2f9f6b;
    color: #fff;
    font-weight: normal;}
.pg_start{
	border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    background: url(resources/images/page_1.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_end{
	border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    background: url(resources/images/page_4.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_prev{
    background: url(resources/images/page_2.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
.pg_next{
    background: url(resources/images/page_3.png) 50% 50% no-repeat;
    width: 32px;
    text-indent: -999px;
    overflow: hidden;
    padding: 0;
    }
#popup_info{
	background: white;
    width: 25%;
    height: 22%;
    position: fixed;
    top: 31%;
    left: 36%;
    border-radius: 10px;
	text-align: center;
	
}
#popup_layer{
	position: fixed; 
    top: 0; left: 0; 
    width: 100%; height: 100%; 
    background: rgba(0,0,0,0.5);
    z-index: 1001; 
    display: none;
}
#popup_info #deleteMsg{
	margin-top: 10%;
    font-size: 16px;
}
#popup_info .member_btn{
	box-shadow: 0px 10px 14px -7px #3e7327;
	background:linear-gradient(to bottom, #77b55a 5%, #72b352 100%);
	background-color:#77b55a;
	border-radius:4px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	padding:6px 12px;
	text-decoration:none;
	text-shadow:0px 1px 0px #5b8a3c;
}
.member_btn:hover {
	background:linear-gradient(to bottom, #72b352 5%, #77b55a 100%);
	background-color:#72b352;
}
.member_btn:active {
	position:relative;
	top:1px;
}
#popup_info .left_btn{    
	margin-right: 6%;
    margin-top: 4%;
}
#popup_info #topbar{
	background: #2f9f6b;
    height: 16%;
    color: white;
    font-size: 18px;
    padding-top: 1%;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    font-weight: bold;
}


/*이 2개의 스타일은  토글*/
#container.container_small{padding-left: 250px;}
#container.container_small #container_title{padding-left: 280px;}
.container_content{padding: 20px;}

</style>
</head>
<body>
	<jsp:include page="AptAdminMenubar.jsp"/>
	<div id="wrapper">
		<div id="container">
				<h1 id="container_title">전체 게시글 목록</h1>
				<div class="container_content">
					<section>
						<div><h2 style="margin: 10px 0;">전체 게시글 조회</h2></div>
						
						<form id="search" action="AptAdminBoardSearch.adm" onsubmit="return searchChk();">
							<select id="searchOption" name="searchOption">
								<option>제목</option>
								<option>작성자</option>
							</select>
							<input type="hidden" name="num" value="${num}">
							<input type="text" id="searchText" name="searchText">
							<input type="submit" id="btn_submit" name="btn_submit">
							<script>
								function searchChk(){
									if($('#searchText').val()==''){
										alert('검색어를 입력해주세요');
										return false;
									}
									return true;
								}
							</script>
						</form>
						<table>
							<thead>
								<tr>
									 <th scope="col" style="width: 10px;">번호</th>
									 <th scope="col" style="width: 30px;">게시판</th>
							         <th scope="col" style="width: 400px;">제목</th>
							         <th scope="col" style="width: 70px;">작성자</th>
							         <th scope="col" style="width: 100px;">작성일</th>
							         <th scope="col" style="width: 20px;">조회수</th>
							         <th scope="col" style="width: 20px;">삭제여부</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty bList }">
									<tr>
										<td colspan="11" style="text-align: center; padding: 100px 0 !important;">
											자료가 없습니다.
										</td>
									</tr>
								</c:if>
								<c:forEach var="b" items="${bList}">
									<tr>
										<td>${b.bId}</td>
										<td>${b.type}</td>
										<td>${b.title}</td>
										<td>${b.writer}</td>
										<td>${b.createDate}</td>
										<td>${b.count}</td>
										<td>${b.delete}</td>
									</tr>
								</c:forEach>
							</tbody>							
						</table>
						<div id="popup_layer" >
							<div id="popup_info" >
								<div id="topbar">회원 탈퇴</div>
								<p id="deleteMsg"><b></b>님을 탈퇴 시키겠습니까?</p>
								<button class="member_btn left_btn">탈퇴</button>
								<button class="member_btn right_btn">취소</button>
							</div>
						</div>
					</section>
					<!--페이징-->	
					<div id="pageBtn">
						<!--맨 처음으로  -->
						<span class="pg">
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="start" value="${ loc }">
									<c:param name="page" value="1"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_start" href="${ start }">처음</a>
							</c:if>
							<!--10개씩 전 페이징  -->
							<c:if test="${ pi.currentPage > 10 }">
								<c:url var="prev" value="${ loc }">
									<c:param name="page" value="${pi.startPage - 10}"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_prev" href="${ prev }">처음</a>
							</c:if>
							<!-- 기본페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<a class="pg_current">${ p }</a>
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="${ loc }">
										<c:param name="page" value="${ p }"/>
										<c:param name="num" value="${num}"/>
										<c:if test="${ searchText ne null }">
											<c:param name="searchOption" value="${searchOption}"/>
											<c:param name="searchText" value="${searchText}"/>
										</c:if>
									</c:url>
									<a class="pg_btn" href="${ pagination }">${ p }</a> &nbsp;
								</c:if>
							</c:forEach>
							<!--10개씩 다음 페이징  -->
							<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
								<c:url var="next" value="${ loc }">
									<c:param name="page" value="${pi.endPage + 1 }"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url>
								<a class="pg_btn pg_next" href="${ next }">처음</a>
							</c:if>
							<!--맨 끝으로 -->
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="end" value="${ loc }">
									<c:param name="page" value="${ pi.maxPage }"/>
									<c:param name="num" value="${num}"/>
									<c:if test="${ searchText ne null }">
										<c:param name="searchOption" value="${searchOption}"/>
										<c:param name="searchText" value="${searchText}"/>
									</c:if>
								</c:url> 
								<a class="pg_btn pg_end" href="${ end }">마지막</a>
							</c:if>							
						</span>
					</div>
				</div>
			</div>
		<jsp:include page="../common/Footer.jsp"/>
	</div>
</body>
</html>
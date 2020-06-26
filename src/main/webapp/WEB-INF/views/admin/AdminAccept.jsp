<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
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

#container.container_small{padding-left: 250px;}
#container.container_small #container_title{padding-left: 280px;}
.container_content{padding: 20px;}
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
    vertical-align:top;
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
#btn_fixed{
	position: fixed;
    top: 60px;
    right: 10px;
    z-index: 100;
}
.accept_btn{
	cursor:pointer;
	background: #9ec6a3;
    color: #fff;
    height: 30px;
    border: 0;
    border-radius: 5px;
    padding: 0 10px;
    font-weight: bold;
    font-size: 1.5em;
    vertical-align: middle;
}
.accept_btn:hover{background: #2f9f6b;}
</style>
</head>
<body>
	<jsp:include page="AdminMenubar.jsp"/>
	<div id="wrapper">
		<div id="container">
			<h1 id="container_title">가입 승인 관리</h1>
			<div class="container_content">
				<section>
					<div><h2 style="margin: 10px 0;">가입 승인 관리</h2></div>
					<div id="button">
							<a class="btn_01" onclick="textlist(1);">
								<span class="text">총 인원</span>
								<span class="num">${lvCnt.lv1+lvCnt.lv2}명</span>
							</a>
							<a class="btn_01" onclick="textlist(2);">
								<span class="text">관리사무소</span>
								<span class="num">${lvCnt.lv2}명</span>
							</a>
							<a class="btn_01" onclick="textlist(3);">
								<span class="text">입주민</span>
								<span class="num">${lvCnt.lv1}명</span>
							</a>
							<script>
							$(function(){
									var num = ${num};
									$(".text").css('background', '#9ec6a3');
									if(num==1){
										$(".btn_01:nth(0)").find('.text').css('background', '#2f9f6b');
									}else if(num==2){
										$(".btn_01:nth(1)").find('.text').css('background', '#2f9f6b');
									}else if(num==3){
										$(".btn_01:nth(2)").find('.text').css('background', '#2f9f6b');
									}
							});
							function textlist(num){
								if(num==1){
									location.href="AcceptList.adm?num=1";
								}else if(num==2){
									location.href="Acceptselect.adm?num=2";
								}else if(num==3){
									location.href="Acceptselect.adm?num=3";
								}
							}
							</script>
						</div>
						<form id="search" action="searchAccept.adm" onsubmit="return searchChk();">
							<select id="searchOption" name="searchOption">
								<option>회원아이디</option>
								<option>닉네임</option>
								<option>이름</option>
								<option>전화번호</option>
								<option>이메일</option>
								<option>아파트</option>
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
						<form action="MemberAccept.adm" onsubmit="return Memberlist_submit();" >
							<input type="hidden" name="num" value="${num}">
							
							<table>
								<thead>
									<tr>
										 <th style="width: 20px;"><input type="checkbox" id="allCheck"></th>
										 <th style="width: 100px;">회원아이디</th>
								         <th style="width: 100px;">이름</th>
								         <th style="width: 100px;">닉네임</th>
								         <th style="width: 110px;">전화번호</th>
								         <th style="width: 100px;">이메일</th>
								         <th style="width: 400px;">아파트</th>
								         <th style="width: 100px;">동/호수</th>
								         <th style="width: 50px;">권한</th>
								         <th style="width: 100px;">가입일</th>
								         <th style="width: 50px;">승인현황</th>
								         <th style="width: 50px;">탈퇴여부</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty mlist}">
										<tr>
											<td colspan="12" style="text-align: center; padding: 100px 0 !important;">
												자료가 없습니다.
											</td>
										</tr>
									</c:if>
									<c:forEach var="m" items="${mlist}">
										<tr>
											<td><input type="checkbox" class="chkId" name="chkId" value="${m.userId}"></td>
											<td>${m.userId}</td>
											<td>${m.userName}</td>
											<td>${m.nickName}</td>
											<td>${m.phone}</td>
											<td>${m.email}</td>
											<td>${m.aptName}</td>
											<td>${m.aptDong}/${m.aptHosu}</td>
											<c:if test="${m.userLevel eq 1}">
												<td>입주민</td>
											</c:if>
											<c:if test="${m.userLevel eq 2}">
												<td>관리사무소</td>
											</c:if>
											<td>${m.createDate}</td>
											<td>${m.ACCEPT}</td>
											<td>${m.status}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="btn_fixed">
								<input type="submit" name="accept" class="accept_btn" value="선택승인" onclick="javascript: document.pressed=this.value">
								<input type="submit" name="delete" class="accept_btn" value="선택삭제" onclick="javascript: document.pressed=this.value">
							</div>
						</form>
						<script>
							$("#allCheck").click(function(){
								 var chk = $("#allCheck").prop("checked");
								 
								 if(chk) {
								  	$(".chkId").prop("checked", true);
								 } else {
								  	$(".chkId").prop("checked", false);
								 }
							});
							
							$(".chkId").click(function(){
								  $("#allCheck").prop("checked", false);
							});
							
							function Memberlist_submit(){
								console.log(document.pressed);
							    if ($('input[name="chkId"]').is(":checked")==false) {
							        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
							        return false;
							    }

							    if(document.pressed == "선택삭제") {
							        if(!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
							            return false;
							        }
							    }

							    return true;
							 }
							
						</script>
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
				</section>
			</div>
		</div>
		<jsp:include page="../common/Footer.jsp"/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<link rel="stylesheet" type="text/css" href="resources/css/MyPage.css">
<style>
	.myPageUl li:nth-child(4) {
	background-color: #8181F7;
}
	#plus{
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
	}
</style>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">프로필 수정</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<form action="update.my" method="post" onsubmit="return check();">
		<div class="area">
			<ul class="ul">
				<li class="image"><c:if test="${!empty loginUser.userFile }">
					<img src="resources/uploadFiles/${loginUser.userFile}" width="110px" height="110px" id="image">
					</c:if>
					<c:if test="${empty loginUser.userFile }">
					<img src="resources/uploadFiles/normal.jpg" width="110px" height="110px" id="image">
					</c:if>
				</li>
				<li class="top">현재 아파트</li>
				<li>
				<input type="hidden" value="${loginUser.userId }" name="userId">
				<input type="hidden" value="${loginUser.userPwd }" name="userOldPwd">
				<input type="hidden" value="${loginUser.userFile }" name="userFile">
				<input type="text" class="text" value="${loginUser.aptName}" id="aptName" name="aptName">
				<hr>
				</li>
				<li class="top">등급</li>
				<li>
				<c:if test="${loginUser.userLevel == 1}">
					<input type="text" class="text" value="일반등급" readonly>
					<input type="hidden" id="userLevel" name="userLevel" value=1>
				</c:if>
				<c:if test="${loginUser.userLevel == 2}">
					<input type="text" class="text" value="관리사무소" readonly>
					<input type="hidden" id="userLevel" name="userLevel" value=2>
				</c:if>
				<c:if test="${loginUser.userLevel == 3}">
					<input type="text" class="text" value="총관리자" readonly>
					<input type="hidden" id="userLevel" name="userLevel" value=3>
				</c:if>
				<hr>
				</li>
				<li class="top">이름</li>
				<li>
				<input type="text" class="text" value="${loginUser.userName}" id="userName" name="userName">
				<hr>
				</li>
				<li class="top">닉네임</li>
				<li>
				<input type="text" class="text" value="${loginUser.nickName}" id="nickName" name="nickName">
				<hr>
				</li>
				<li class="top">동</li>
				<li>
				<input type="text" class="text" value="${loginUser.aptDong}" id="aptDong" name="aptDong">
				<hr>
				</li>
				<li class="top">호수</li>
				<li>
				<input type="text" class="text" value="${loginUser.aptHosu}" id="aptHosu" name="aptHosu">
				<hr>
				</li>
				<li class="top">이메일</li>
				<li>
				<input type="text" class="text" value="${loginUser.email}" id="email" name="email">
				<hr>
				</li>
				<li class="top">휴대전화 번호</li>
				<li>
				<input type="text" class="text" value="${loginUser.phone}" id="phone" name="phone"> 
				<hr>
				</li>
				<li class="top">현재 비밀번호</li>
				<li>
				<input type="password" class="text" id="nowPass" placeholder="비밀번호는 입력할 경우에만 변경됩니다."> 
				<hr>
				</li>
				<li class="top">새 비밀번호</li>
				<li>
				<input type="password" class="text" id="newPass" placeholder="입력하지않는다면 변경되지 않습니다." name="userPwd"> 
				<hr>
				</li>
				<li class="top">새 비밀번호 확인</li>
				<li>
				<input type="password" class="text" id="newPass2" placeholder="현재, 새 비밀번호, 확인 모두 입력하셔야합니다."> 
				<hr>
				</li>
			</ul>
			<input type="submit" id="submit2" class="button" value="수정">
			<br>
		</div>
	</form>
	<script>
		function check(){
			var userName = $('#userName').val();
			var nickName = $('#nickName').val();
			var aptName = $('#aptName').val();
			var aptDong = $('#aptDong').val();
			var aptHosu = $('#aptHosu').val();
			var email = $('#email').val();
			var phone = $('#phone').val();
			var nowPass = $('#nowPass').val();
			var newPass = $("#newPass").val();
			var newPass2 = $('#newPass2').val();
			if(!userName || !aptName || !nickName || !aptDong || !aptHosu || !email || !phone){
				alert("비밀번호 제외 빈곳없이 전부 입력해주세요.");
				return false;
			}
			if(nowPass.length > 0 || newPass.length > 0 || newPass2.length > 0){
				if(newPass == newPass2 && nowPass == '${loginUser.userPwd}'){
					return true;
				}else if(nowPass != '${loginUser.userPwd}'){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}else{
					alert("새 비밀번호가 일치하지 않습니다.");
					return false;
				}
			}
			return true;
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
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
	<b id="headcomment">프로필</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<form action="updatePage.my" method="post">
		<div class="area">
			<ul class="ul">
				<li class="image">
					<c:if test="${!empty loginUser.userFile }">
					<img src="resources/uploadFiles/${loginUser.userFile}" width="110px" height="110px" id="image">
					</c:if>
					<c:if test="${empty loginUser.userFile }">
					<img src="resources/uploadFiles/normal.jpg" width="110px" height="110px" id="image">
					</c:if>
					<label id="plusbtn" for="plus">+</label>
					<input type="file" id="plus" name="plus">
				</li>
				<li class="top">현재 아파트</li>
				<li>
				<input type="text" class="text" value="${loginUser.aptName}" readonly>
				<hr>
				</li>
				<li class="top">등급</li>
				<li>
				<c:if test="${loginUser.userLevel == 1}">
					<input type="text" class="text" value="일반등급" readonly>
				</c:if>
				<c:if test="${loginUser.userLevel == 2}">
					<input type="text" class="text" value="관리사무소" readonly>
				</c:if>
				<c:if test="${loginUser.userLevel == 3}">
					<input type="text" class="text" value="총관리자" readonly>
				</c:if>
				<hr>
				</li>
				<li class="top">이름</li>
				<li>
				<input type="text" class="text" value="${loginUser.userName}" readonly>
				<hr>
				</li>
				<li class="top">닉네임</li>
				<li>
				<input type="text" class="text" value="${loginUser.nickName}" readonly>
				<hr>
				</li>
				<li class="top">동</li>
				<li>
				<input type="text" class="text" value="${loginUser.aptDong}" readonly>
				<hr>
				</li>
				<li class="top">호수</li>
				<li>
				<input type="text" class="text" value="${loginUser.aptHosu}" readonly>
				<hr>
				</li>
				<li class="top">이메일</li>
				<li>
				<input type="text" class="text" value="${loginUser.email}" readonly>
				<hr>
				</li>
				<li class="top">휴대전화 번호</li>
				<li>
				<input type="text" class="text" value="${loginUser.phone}" readonly>
				<hr>
				</li>
			</ul>
			<input type="submit" id="submit" class="button" value="수정">
			<button type="button" id="cancel" class="button">탈퇴</button>
			<br>
		</div>
	</form>
	<script>
		/* 프로필사진 ajax로 변경 */
		$('#plus').change(function(){
			var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/i;
			
			/* 이미지파일을 넣어 보낼 객체 */
			var formData = new FormData();
			
			var src = $('#image').attr("src");
			
			/* img 태그로부터 파일명 만 뽑아서 저장 */
			var srcFileName = src.replace("resources/uploadFiles/","");
			
			/* 원래 파일이름, 새 파일 넣음*/
			formData.append("originFile",srcFileName);
			formData.append("uploadfile",$("input[id=plus]")[0].files[0]);
			
			/* 이미지 파일일 경우 */
			if((this.value).match(reg)){
				$.ajax({
					type: "post",
					enctype: "multipart/form-data",
					url: "image.my",
					data: formData,
					processData : false,
					contentType : false,
					success : function(data){
						/* 새 파일 */
						var $newFile = data.replace(/\"/gi,"");
						
						/* 새 파일 이미지 태그에 넣어줌 */
						$("#image").attr("src","resources/uploadFiles/" + $newFile);
					},
					error : function(error){
						alert("프로필 사진 변경에 실패하였습니다.");
						alert(error);
					}
				});
			}else{
				alert("이미지 파일이 아닙니다!");
			}
			
		});
	</script>
	<jsp:include page="../common/Footer.jsp"></jsp:include>
</body>
</html>
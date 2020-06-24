<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<link rel="stylesheet" type="text/css" href="resources/css/writingMarket.css">
</head>
<body>
<img class="img" src="resources/images/market6.jpg">
	<div class="header_wrap">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">중고 장터</b>
	</div>
<div id="body">
      <h2 style="color: darksalmon;">작성하기</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form action="updateMarket.ma" method="post" enctype="Multipart/form-data">
         	<input type="hidden" name="page" value="${ page }">
         	<input type="hidden" name="boardNo" value="${ ma.boardNo }">
         	<input type="hidden" name="fileName" value="${ ma.fileName }">
            <table id="tb">
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input name="boardTitle" class="inputs" type="text" value="${ ma.boardTitle }" placeholder="제목을 입력하세요" size="90">
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">가격</td>
                     <td>
                       <input name="price" class="inputs" type="text" value="${ ma.price }" placeholder="가격을 입력하세요" size="90">
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">내용</td>
                     <td>
                        <textarea name="boardContent" id="content">${ ma.boardContent }</textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">물품사진</td>
                     <td>
                     	<div style="margin-left:20px; margin-bottom:3px; margin-top:3px; font-size: 0.9em;"><a style="color:black; cursor:pointer;" onclick="">${ ma.fileName }</a></div>
                  		<input name="reloadFile" type="file" accept=".png, .jpg" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button class="btn" id="cancleBtn" type="reset">취소</button>
                  <button class="btn" onclick="location.href='marketDetail.ma?boardNo=${ma.boardNo}&page=${ page }'">작성완료</button>
            </div>
         </form>
   </div><br>
   <jsp:include page="../common/Footer.jsp"/>
   
   <script>
   		/* 작성 취소  */
   		$('#cancleBtn').on('click', function(){
   			if(confirm("수정을 중단하시겠습니까?")){
   				location.href="market.ma";
   			}
   		});
   	</script>
   
</body>
</html>
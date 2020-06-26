<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

         <form action="writing.ma" method="post" enctype="Multipart/form-data">
            <table id="tb">
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input name="boardTitle" class="inputs" type="text" placeholder="제목을 입력하세요" size="90" required>
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">가격</td>
                     <td>
                       <input name="price" class="inputs" type="text" placeholder="가격을 입력하세요" size="90" required>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">내용</td>
                     <td>
                        <textarea cols="107"rows="24" name="boardContent" id="content" placeholder="내용 입력하세요 " required></textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">물품사진</td>
                     <td>
                  <input name="uploadFile1" type="file" accept=".png, .jpg" style="margin-left: 20px; padding: 5px; display:inline-block; width:25%; font-size: 0.9em;">
                  <input name="uploadFile2" type="file" accept=".png, .jpg" style="margin-left: 20px; padding: 5px; display:inline-block; width:25%; font-size: 0.9em;">
                  <input name="uploadFile3" type="file" accept=".png, .jpg" style="margin-left: 20px; padding: 5px; display:inline-block; width:25%; font-size: 0.9em;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button class="btn" id="cancleBtn" type="reset">취소</button>
                  <button class="btn">작성완료</button>
            </div>
         </form>
   </div><br>
   <jsp:include page="../common/Footer.jsp"/>
   
   <script>
   		/* 작성 취소  */
   		$('#cancleBtn').on('click', function(){
   			if(confirm("작성을 중단하시겠습니까?")){
   				location.href="market.ma";
   			}
   		});
   	</script>
   
</body>
</html>
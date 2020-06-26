<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<style type="text/css">
.img { 
     filter: brightness(70%);
     width: 100%;
     height: 400px;
}
/*    #body{margin-top: 300px;} */
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavenderBlush;}
   h5{ margin: 0 auto;}
   h2{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em; 	  
   }
   hr{border-color: lavenderBlush;}
   #titleInput{height: 60%; border: 1px solid lavenderBlush; margin-left: 20px; width: 80%;}
   
   #tr1{height: 10%}
   #tr2{height: 10%;}
   #tr3{height: 70%;}
   #tr4{height: 10%;}
   #tb{width: 50%; height: 600px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavenderBlush;}
   
   #content{width: 80%; height: 90%; border: 1px solid lavenderBlush;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavenderBlush;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
</style>
</head>
<body>

<img class="img" src="resources/images/myPageImage.jpg">
<jsp:include page="../common/menubar.jsp"/>

<div id="body">
      <h2>&nbsp;자유게시판</h2>
      <!-- <hr style="width: 80%; margin-left: 11%"><br> -->

         <form action="update.fr" method="post" enctype="Multipart/form-data">
         	<input type="hidden" name="page" value="${ page }">
         	<input type="hidden" name="boardNo" value="${ fb.boardNo }">
         	<input type="hidden" name="fileName" value="${ fb.fileName }">
         	
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">수정하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input id="titleInput" type="text" value="${ fb.boardTitle }"
                        placeholder="제목을 입력하세요" size="90" name="boardTitle">
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">내용</td>
                     <td>
                        <textarea id="content" placeholder="내용 입력하세요 " style="margin-left: 20px;" name="boardContent">${ fb.boardContent }</textarea>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">첨부</td>
                     <td>   
                     	<input type="file" name="reloadFile" style="margin-left: 24px;"><br>
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
              	<c:url var="flist" value="list.fr">
              		<c:param name="page" value="${ page }"/>
              	</c:url>
          		<button class="btn" type="button" onclick="location.href='${ flist }'">목록으로</button>  
                <button class="btn" type="reset">취소</button>
                <button class="btn">수정완료</button>
            </div>
         </form>
   </div><br>
   <jsp:include page="../common/Footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<link rel=" shortcut icon" href="resources/images/favicon.png">
<link rel="icon" href="resources/images/favicon.png">
<style type="text/css">
   #notice_write_body{margin-top: 30px; margin-bottom: 30px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: #eff3f9;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif";     margin-left: 11%;}
   hr{border-color: #eff3f9;}
   #titleInput{height: 60%; border: 1px solid #eff3f9; margin-left: 20px; width: 80%;}
   #tr1{height: 10%}
   #tr2{height: 10%;}
   #tr3{height: 70%;}
   #tr4{height: 10%;}
   #tb{width: 60%; height: 600px; margin: 0 auto;}
   .td1{text-align: center; font-size: 11px; background: #eff3f9;}
   #tb a{color:rgb(139, 134, 134);}
   
   #content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: #eff3f9;}
 
    input::placeholder{font-style: italic; color: #38614a;}
    textarea::placeholder{font-style: italic; color: #38614a;}

   .commnuity_header { position: absolute;
						left: 45%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    .img {filter: brightness(70%);
		    width: 100%;
		    height: 400px;}	
	.apt_dong_Select{height: 60%; border: 1px solid #eff3f9; margin-left: 20px; width: 50%;}	    
		    
</style>
</head>
<body>
	<img class="img" src="resources/images/유럽집느낌.jpg">
<jsp:include page="../common/menubar.jsp"/>
<div id="notice_write_body">
         <form action="noticeUpdate.no" method="post" enctype="Multipart/form-data">
	        <input type="hidden" name="page" value="${ page }">
			<input type="hidden" name="nNo" value="${ notice.nNo }">
			<input type="hidden" name="renameFileName" value="${ notice.renameFileName }">
			 
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: #38614a; font-weight: bold; font-size: 30px;">공지사항 수정</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input id="titleInput" name="nTitle" type="text" size="90" value="${ notice.nTitle }">
                     </td>
                </tr>
                <!-- ----------------------------------------------- -->
                <tr id="tr2">
                   <td class="td1">동</td>
                     <td>
                     	<select name="nDong" class="apt_dong_Select" id="apt_dong_Select">
						    <option value="전체 공지" selected>전체 공지</option>
						    <c:forEach var="i" begin="0" end="${nDonglist.size()}" varStatus="status">
						        <c:if test="${nDonglist[i] != selected}">
								    <option value="${nDonglist[i]}">${nDonglist[i]}</option>
						        </c:if>
						    </c:forEach>
						</select>
                     </td>
                 </tr>
 <!-- ----------------------------------------------- -->
                  <tr id="tr3">
                     <td class="td1">내용</td>
                     <td>
                        <textarea id="content" name="nContent" style="margin-left: 20px; resize: none;">${ notice.nContent }</textarea>
                     </td>
                  </tr>    
                    
                  <tr id="tr4">
                     <td class="td1">첨부</td>
                     <td>
                 		<input type="file" name="reloadFile" style="margin-left: 20px; padding: 5px;">
						<c:if test="${ !empty notice.renameFileName }">
							<br><input type="button" value="기존 파일" style="margin-left: 24px;"> 
							<a href="${ contextPath }/resources/nuploadFiles/${ notice.renameFileName }" download="${ notice.renameFileName }">
								${  notice.renameFileName  }
							</a>
							<input type="hidden" name="originalFileName" value="${  notice.renameFileName  }"> 
						</c:if>
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button type="button" class="btn" onclick="location.href='javascript:history.go(-1);'">취소</button>
                  <button class="btn" type="submit">수정하기</button>
            </div>
         </form>
   	</div>
   	<script>
   		$("#apt_dong_Select").val('${notice.nDong}').attr("selected", "selected");
   	</script>
   	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
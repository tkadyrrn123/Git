<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
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
   #tb{width: 60%; height: 600px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: #eff3f9;}
   
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
         <form id="NoticeInsert" action="noticeInsert.no" method="post" enctype="Multipart/form-data">
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: #38614a; font-weight: bold; font-size: 30px;">공지사항 등록</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input id="titleInput" name="nTitle" type="text" placeholder="제목을 입력하세요" size="90" required>
                     </td>
                </tr>
<!-- ----------------------------------------------- -->
                <tr id="tr2">
                   <td class="td1">동</td>
                     <td>
                     	<select name="nDong" class="apt_dong_Select">
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
                        <textarea id="content" name="nContent" placeholder="내용 입력하세요 " style="margin-left: 20px; resize: none;" required></textarea>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">첨부</td>
                     <td>
                  <input type="file" name="uploadFile" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button type="button" class="btn" onclick="location.href='noticeList.no'">취소</button>
                  <button id="nBtn" class="btn" type="button">등록하기</button>
            </div>
         </form>
   	</div>
   	<jsp:include page="../common/Footer.jsp"/>
</body>

<script>
	/* 웹소켓  */
	var NoticeWriter = '${ loginUser.userId }';
	var NoticeTitle = null;
	
	$(function(){
			$('#nBtn').on('click', function(evt) {
				evt.preventDefault();
			  	if (socket.readyState !== 1) return;
			    	  
			    	  if(socket){
			    		  NoticeTitle=$('#titleInput').val();
			    		  let socketMsg = "NoticeWrite," + NoticeWriter + "," + NoticeTitle ;
			    		  console.log(socketMsg);
			    		  socket.send(socketMsg);
			    	  }
			    	  document.getElementById('NoticeInsert').submit();
			    	  
		    });
	});
</script>
</html>
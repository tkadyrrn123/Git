<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<style type="text/css">

/*    #body{margin-top: 300px;} */
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: #eff3f9;}
   h5{ margin: 0 auto;}
   h2{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em; 	  
   }
   hr{border-color: #eff3f9;}
   #titleInput{height: 60%; border: 1px solid #eff3f9; margin-left: 20px; width: 80%;}
   
   #tr1{height: 10%}
   #tr2{height: 10%;}
   #tr3{height: 70%;}
   #tr4{height: 10%;}
   #tb{width: 50%; height: 600px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: #eff3f9; width: 50px;}
   
   #content{width: 80%; height: 90%; border: 1px solid #eff3f9;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: #eff3f9;}
 
    input::placeholder{font-style: italic; color: #38614a;}
    textarea::placeholder{font-style: italic; color: #38614a;}
    
 	.commnuity_header { 
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em; 	
 	}  
#titleCrop{width: 100%; overflow: hidden; max-height: 420px;}
#titleCrp>img{max-height: initial;}
.img { 
     /* filter: brightness(70%); */
     width: 100%; 
}    
</style>
</head>
<body>

<div id="titleCrop"><img class="img" src="resources/images/gif_title3.gif"></div>

<jsp:include page="../common/menubar.jsp"/>
<div id="body">
	<div class="commnuity_header">
	<b>자유 게시판</b>
	</div>
      <!-- <hr style="width: 80%; margin-left: 11%"><br> -->

         <form action="insert.fr" method="post" enctype="Multipart/form-data">
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: #38614a; font-weight: bold;">작성하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input id="titleInput" type="text" placeholder="제목을 입력하세요" size="90" name="boardTitle" required>
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">내용</td>
                     <td>
                        <textarea id="content" placeholder="내용 입력하세요 " style="margin-left: 20px;" name="boardContent" required></textarea>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">첨부</td>
                     <td>
                  <input type="file" style="margin-left: 20px; padding: 5px;" name="uploadFile">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button class="btn" type="button" onclick="location.href='list.fr'">목록으로</button>
                  <button class="btn" type="reset">작성취소</button>
                  <button class="btn">작성완료</button>
            </div>
         </form>
   </div><br>
   <jsp:include page="../common/Footer.jsp"/>
</body>
</html>
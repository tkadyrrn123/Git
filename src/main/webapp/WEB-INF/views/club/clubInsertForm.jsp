<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style type="text/css">
   #body{margin-top: 30px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavender;}
   h2{font-family: "Sans-Serif";     margin-left: 11%;}
   hr{border-color: lavender;}
   #titleInput{height: 60%; border: 1px solid lavender; margin-left: 20px; width: 80%;}
   .countInput{height: 60%; border: 1px solid lavender; margin-left: 20px;}
   
   #tr1{height: 5%}
   #tr2{height: 5%;}
   #tr3{height: 5%;}
   #tr4{height: 23%;}
   #tr5{height: 22%;}
   #tr6{height: 15%;}
   #tr7{height: 20%;}
   #tr8{height: 5%;}
   #tb{width: 60%; height: 1000px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavender;}
   
   .content{width: 80%; height: 90%; border-color: lavender;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavenderBlush;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
	.img{filter: brightness(70%);
     width: 100%;
     height: 400px;}
     #headcomment{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em;
}	    
	textarea{ resize:none;}
</style>
</head>
<body>
<!-- 	<img class="img" src="resources/images/05.PNG"> -->
 	<img class="img" src="resources/images/동호회목록.jpg">
	<jsp:include page="../common/menubar.jsp"/> 
	<b id="headcomment">동호회 신청</b>
<div id="body">
      <h2>&nbsp;동호회 신청</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form action="clubInsert.cb" method="post" enctype="Multipart/form-data">
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">작성하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">동호회 명</td>
                     <td>
                        <input name="clubName" id="titleInput" type="text" placeholder="동호회 명을 입력하세요" size="90">
                     </td>
                  </tr>
                <tr id="tr3">
                   <td class="td1">모집인원</td>
                     <td>
                        <!-- <h5>최소</h5> --><input name="maxPeople" class="countInput" type="text"> 명 
                     </td>
                  </tr>
                  <tr id="tr4">
                     <td class="td1">동호회 소개</td>
                     <td>
                        <textarea name="clubIntro" class="content" placeholder="동호회 소개를 입력해주세요 " style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">활동계획</td>
                     <td>
                        <textarea name="clubPlan" class="content" placeholder="동호회 활동 계획을 입력해주세요" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr6">
                     <td class="td1">장소</td>
                     <td>
                        <textarea name="clubPlace" class="content" placeholder="주 활동 장소, 모임장소 기재" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr7">
                     <td class="td1">기타</td>
                     <td>
                        <textarea name="clubEtc" class="content" placeholder="동호회 활동 규칙 및 유의사항 등 자유롭게 기재" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr8">
                     <td class="td1">첨부</td>
                     <td>
                  <input name="uploadFile" type="file" accept=".gif, .jpg, .png" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      
				<input type="hidden" name="writer" value="${ loginUser.userId }">	
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
   			if(confirm("작성을 중단하고 이전 페이지로 이동하시겠습니까?")){
   				location.href="clubList.cb";
   			}
   		});
   		
   		
   		
   		
   		
   		
   	</script>
   	
</body>
</html>
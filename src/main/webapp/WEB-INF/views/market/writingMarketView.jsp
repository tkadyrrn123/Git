<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #body{margin-top: 20px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavender;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif"; margin-left: 11%;}
   hr{border-color: lavender;}
   .inputs{height: 60%; border: 1px solid lavender; margin-left: 20px; width: 80%;}
   #tr1{height: 10%}
   #tr2{height: 10%;}
   #tr3{height: 10%;}
   #tr4{height: 60%;}
   #tr5{height: 10%;}
   #tb{width: 60%; height: 600px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavender;}
   
   #content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavender;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
    
	.img{width:100%; height:400px;}
	.header_wrap{background-color:rgba(0, 0, 0, 0.5); width:100%; height: 400px;position:absolute;top:0;}
	#headcomment{
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em;}
</style>
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

         <form action="writingMarket.ma" method="post" enctype="Multipart/form-data">
            <table id="tb">
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input class="inputs" type="text" placeholder="제목을 입력하세요" size="90">
                     </td>
                  </tr>
                  <tr id="tr3">
                     <td class="td1">가격</td>
                     <td>
                       <input class="inputs" type="text" placeholder="가격을 입력하세요" size="90">
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">내용</td>
                     <td>
                        <textarea id="content" placeholder="내용 입력하세요 " style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">물품사진</td>
                     <td>
                  <input type="file" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button id="cancle" class="btn" type="reset">취소</button>
                  <button class="btn">작성완료</button>
            </div>
         </form>
   </div><br>
   
   <script>
   	${'#cancle'}.on('click', function(){
   		if(confirm("작성을 중단하고 이전 페이지로 이동하시겠습니까?")){
   			location.href="clubList.cb";
   		}
   	});
   </script>
</body>
</html>
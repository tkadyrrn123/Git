<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #body{margin-top: 300px;}
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
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
<div id="body">
      <h2>&nbsp;동호회 신청</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form>
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">작성하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                     <td>
                        <input id="titleInput" type="text" placeholder="제목을 입력하세요" size="90">
                     </td>
                  </tr>
                <tr id="tr3">
                   <td class="td1">모집인원</td>
                     <td>
                        <!-- <h5>최소</h5> --><input class="countInput" type="text"> 명 이상 ~ 
                        <!-- <h5>최대</h5> --><input class="countInput" type="text"> 명 이하.
                     </td>
                  </tr>
                  <tr id="tr4">
                     <td class="td1">동호회 소개</td>
                     <td>
                        <textarea class="content" placeholder="동호회 소개를 입력해주세요 " style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">활동계획</td>
                     <td>
                        <textarea class="content" placeholder="동호회 활동 계획을 입력해주세요" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr6">
                     <td class="td1">장소</td>
                     <td>
                        <textarea class="content" placeholder="주 활동 장소, 모임장소 기재" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr7">
                     <td class="td1">기타</td>
                     <td>
                        <textarea class="content" placeholder="동호회 활동 규칙 및 유의사항 등 자유롭게 기재" style="margin-left: 20px;"></textarea>
                     </td>
                  </tr>      
                  <tr id="tr8">
                     <td class="td1">첨부</td>
                     <td>
                  <input type="file" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      

            </table><br>
              <div id="btns">
                  <button class="btn" type="reset">취소</button>
                  <button class="btn">작성완료</button>
            </div>
         </form>
   </div><br>
</body>
</html>
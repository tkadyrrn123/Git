<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
   #body{margin-top: 300px;}
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: lavender;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif"; margin-left: 11%;}
   hr{border-color: lavender;}
   .inputs{border: none; margin-left: 20px;}
   #tr1{height: 10%}
   #tr2{height: 5%;}
   #tr3{height: 40%;}
   #tr4{height: 40%;}
   #tr5{height: 5%;}
   #tb{width: 60%; height: 700px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: lavender;}
    #list li{list-style-type: decimal-leading-zero;} 
   .content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: lavender;}
 
    input::placeholder{font-style: italic; color: darksalmon;}
    textarea::placeholder{font-style: italic; color: darksalmon;}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>

<div id="body">
      <h2>&nbsp;투표</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form>
            <table id="tb">
                 <tr id="tr1">
                   <td colspan=2 style="color: darksalmon; font-weight: bold;">작성하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                   <td>
                      <input class="inputs" type="text" placeholder="제목을 입력하세요" size="60">
                   </td>
                   <td class="td1">투표기간</td>                   
                   <td>
                      <input class="inputs" type="date">부터<input class="inputs" type="date">까지
                   </td>
                </tr>
                  <tr id="tr3">
                     <td class="td1">투표내용</td>
                     <td colspan=3>
                        <textarea class="content" placeholder="투표내용을 입력하세요 " style="margin-left: 20px;">

                        </textarea>
                     </td>
                  </tr>      
                  <tr id="tr4">
                     <td class="td1">투표후보</td>
                     <td colspan=3>
                     	<div>
                     		<input type="checkbox"><label>중복 선택 허용</label><br>
                     		<ol id="list" type='1'>
                     			<li><input type="text"></li>
                     			<li><input type="text"></li>
                     			
                     			<li><button type="button" id="add" onclick="add();">후보 추가</button></li>
                     		</ol>
                     	</div>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">첨부파일</td>
                     <td colspan=3>
                  <input type="file" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>      
            </table><br>
	<script type="text/javascript">
		
	</script>
              <div id="btns">
                  <button class="btn">취소</button>
                  <button class="btn">작성완료</button>
            </div>
         </form>
   </div><br>
</body>
</html>
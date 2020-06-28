<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<style type="text/css">
   table, tr, td{border-bottom: 1px solid black; border-collapse: collapse; border-color: #eff3f9;}
   h5{ margin: 0 auto;}
   h2{font-family: "Sans-Serif"; margin-left: 11%;}
   hr{border-color: #eff3f9;}
   #titleInput{height: 60%; border: 1px solid #eff3f9; margin-left: 20px; width: 80%;}
   .inputs{height: 60%; border: 1px solid #eff3f9; margin-left: 20px;}
   #tr1{height: 10%}
   #tr2{height: 6%;}
   #tr3{height: 6%;}
   #tr4{height: 36%;}
   #tr5{height: 36%;}
   #tr6{height: 6%;}
   #tb{width: 60%; height: 700px; margin: 0 auto; }
   .td1{text-align: center; font-size: 11px; background: #eff3f9;}
    /* #list li{list-style-type: decimal-leading-zero;} */ 
   .content{width: 90%; height: 90%; border: none;}
   #btns{text-align: center;}
   .btn{border: none; border-radius: 5px; height: 30px; width: 90px; background-color: #eff3f9;}
 	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    input::placeholder{font-style: italic; color: #38614a;}
    textarea::placeholder{font-style: italic; color: #38614a;}
    .img{filter: brightness(70%);
     width: 100%;
     height: 400px;  }
</style>
</head>
<body>
<img class="img" src="resources/images/voteImage.png">
<jsp:include page="../common/menubar.jsp"/>
<div class="commnuity_header">
<h2 style="margin-left: 0; font-weight:700;">투표 게시판</h2>
</div>
<div id="body">
      <h2>&nbsp;투표</h2>
      <hr style="width: 80%; margin-left: 11%"><br>

         <form action="voteModify.vo" method="post" onsubmit="return check();">
         	<!-- vId값, page값 -->
         	<input type="hidden" name="vId" value="${Vote.vId}">
         	<input type="hidden" name="page" value="${page }">
            <table id="tb">
                <tr id="tr1">
                   <td colspan=2 style="color: #38614a; font-weight: bold;">작성하기</td>
                </tr> 
                <tr id="tr2">
                   <td class="td1">제목</td>
                   <td>
                      <input id="titleInput" name="vTitle" type="text" placeholder="제목을 입력하세요" size="60" value="${Vote.vName}">
                   </td>

                </tr>
                <tr id="tr3">
                   <td class="td1">투표기간</td>                   
                   <td>
                      <input id="vStart" class="inputs" name="vStart" type="date" value="${Vote.createDate}" readonly>부터<input id="vEnd" class="inputs" name="vEnd" type="date" value="${Vote.endDate}">까지&ensp;<b id="sum"></b>
                   </td>                
                </tr>
                  <tr id="tr4">
                     <td class="td1">투표내용</td>
                     <td colspan=3>
                        <textarea id="content" class="content" name="vContent" placeholder="투표내용을 입력하시오" style="margin-left: 20px;">${Vote.vContent }</textarea>
                     </td>
                  </tr>      
                  <tr id="tr5">
                     <td class="td1">투표후보</td>
                     <td colspan=3>
                     	<div id="addCandidate">
                     		<c:if test="${Vote.overlapYN == 'Y' }">
                     			<input type="checkbox" name="overlab" value="Y" checked>
                     		</c:if>
                     		<c:if test="${Vote.overlapYN == 'N' }">
                     			<input type="checkbox" name="overlab" value="Y">
                     		</c:if>
                     		<label>중복 선택 허용</label>
                     		<br>
                     		<ol id="list" type='1'>
                     			<c:set var="num" value="0"/>
                     			<c:if test="${vclist != null && !vclist.isEmpty()}">
	                     			<c:forEach var="i" begin="0" end="${vclist.size()-1}">
	                     			<li>${i+1}. <input type="text" class="vclist" name="vclist" value="${vclist[i].vcName}"></li>
	                     			<c:set var="num" value="${num+1}"/>
	                     			</c:forEach>
	                     		</c:if>
	                     		<c:if test="${vclist == null || vclist.isEmpty()}">
	                     			<li>1. <input type="text" class="vclist" name="vclist"></li>
                     				<li>2. <input type="text" class="vclist" name="vclist"></li>
	                     		</c:if>
                     		</ol>
                     		<button type="button" id="add" onclick="addlist();" style="background-color: #eff3f9; border-radius: 5px;">
                     			후보 추가
                     		</button>
                     		<button type="button" id="remove" onclick="removelist();" style="background-color: #eff3f9; border-radius: 5px;">
                     			후보 제거
                     		</button>
                     	</div>
                     </td>
                  </tr>      
                  <!-- 
                  	파일을 넣는 부분 이었지만 생략
                  <tr id="tr6">
                     <td class="td1">첨부파일</td>
                     <td colspan=3>
                  <input type="file" id="file" name="vFile" style="margin-left: 20px; padding: 5px;">
                     </td>
                  </tr>    -->   
            </table><br>
            <script type="text/javascript">
	            var num = 0;
	            if(${num} > 1){
	            	num = ${num+1};
	            }
				function addlist(){
					const str = '<li>' + num + '. <input type="text" class="vclist" name="vclist"></li>';
					num++;
					$("#list").append(str); 
				}
				function removelist(){
					if(num > 3){
						num--;	
						$("#list>li:last").remove(); 
					}else{
						alert("후보는 최소 둘 이상입니다.");
					}
				}
				$(function(){
					var mdate = new Date(new Date().getTime() + 1 * 24 * 60 * 60 * 1000);
					document.getElementById('vEnd').min = mdate.toISOString().substring(0, 10);
				});
				$('#vEnd').change(function(){
					var start = $('#vStart').val();
					var end = $(this).val();
					
					var s1 = start.split('-');
					var e1 = end.split('-');
					var sDate = new Date(s1[0], s1[1], s1[2]);
					var eDate = new Date(e1[0], e1[1], e1[2]);
					var dif = eDate - sDate;
					var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
					
					var sum = parseInt(dif/cDay)
					$('#sum').html('');
					$('#sum').html(sum+"일간");
				});
				function check(){
					var title = $('#titleInput').val();
					var endDate = $('#vEnd').val();
					var content = $('#content').val();
					var length = $('.vclist').length;
					if(!title || !endDate || !content){
						alert("빈 곳 없이 전부 입력해주세요.");
						return false;
					}
					for(var i = 0; i<length; i++){
						if(!$('.vclist')[i].value){
							alert("빈 곳 없이 전부 입력해주세요.");
							return false;
						}
					}
					var result = confirm("정말로 수정하시겠습니까? \n수정하실경우 지금껏 했던 투표가 초기화됩니다.");
					if(result){
						return true;
					}else{
						alert("수정이 취소되었습니다.");
						return false;
					}
				} 
			</script>
            <div id="btns">
                  <button class="btn" type="button" onclick="javascript:history.back();">취소</button>
                  <input type="submit" value="수정완료" class="btn"/>
            </div>
         </form>
   </div><br>
   <jsp:include page="../common/Footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
html ,body{margin: 0; padding: 0; height: 100%; }


.modal_pop{height: 100%; overflow-y: hidden;}
.modal_pop>p{
		    width: 100%;
		    height: 9%;
		    background: linear-gradient( to right, #0BA29D, #C3EC52);
		    color: white;
		    margin-top: 0;
		    padding-top: 11px;
		    padding-left: 5%;
		    font-family: 'Jua', sans-serif;
		    font-size: 23px;
		    border-bottom-left-radius: 12px;
}


#p1{padding-left: 6%; font-weight: bold; font-family: 'Malgun Gothic'}
#p1>p>img{width: 3%; height: 3%; vertical-align: -2px;}

#search{border: 5px solid #ddeaf2; margin: 0px 25px 0px 25px;}
#search2{
		width: 23%; 
		height: 36px; 
		padding-top: 6px; 
		color:#0BA29D; 
		font-weight:bold; 
		background: #ddeaf2; 
		text-align: center; 
		display: inline-block;
}
#search3{
		display: inline-block;
	    width: 77%;
	    height: 34px;
	    background: #f7fbfe;
	    vertical-align: 5px;
	    margin-left: -6px;
}
#search3>form>input[type="text"]{ vertical-align: -4px; margin-left: 12px;}:focus{outline: none;}
	
.myButton {
	box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	background:linear-gradient(to bottom, #b8e356 5%, #a5cc52 100%);
	background-color:#b8e356;
	border-radius:6px;
	border:1px solid #83c41a;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:4px 9px;
	text-decoration:none;
	text-shadow:0px 1px 0px #86ae47;
	vertical-align: -4.5px;
    margin-left: 6px;
}
.myButton:hover {
	background:linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
	background-color:#a5cc52;
}
.myButton:active {
	position:relative;
	top:1px;
}

.close_btn {
	border-radius: 3px;
    border: none;
    display: inline-block;
    cursor: pointer;
    color: #ffffff;
    background: #11a49b;
    font-family: Arial;
    font-size: 13px;
    font-weight: bold;
    padding:0 20px;
    height : 32px;
    line-height: 32px;
    text-decoration: none;
    transition:background 0.2s;
    text-align: center;
}
.close_btn:active {background: #fff;}
#search_content{height:355px;  border: 5px solid #ddeaf2; margin: 20px 25px 0px 25px; overflow-y: scxroll; }
#search_content>table{
					clear: both;
				    width: 100%;
					border-collapse: collapse;
				    border-spacing: 0;
}
#search_content table thead th{
	background: #6f9a70;
    color: #fff;
    border: 1px solid #60718b;
    font-weight: normal;
    text-align: center;
    padding: 4px 5px;
    font-size: 0.92em;
}
#search_content tbody td{
	border: 1px solid #d6dce7;
    padding: 5px;
    text-align: center;
    line-height: 22px;
    font-size: 13px;
}
#search_content tbody tr{cursor: pointer;}
#search_content tbody tr:hover{background: #88e4e1 !important;}
#search_content tbody tr:nth-child(even){background:#d6e7d9}

</style>
</head>
<body>
	<div class="modal_pop">
		<p>아파트 검색</p>
		<div id="p1">
			<p><img src="resources/images/modal_pop1.png"> 검색창에 찾으시는 아파트를 입력하세요.</p>
		</div>
		
		<div id="search">
			<div id="search2">검색</div>
			<div id="search3">
				<form id="searchApt" action="searchApt.apt">
					<input type="text" id="searchText" name="searchText">
					<a class="myButton" onclick="searchApt();">검색하기</a>
					<script>
						function searchApt(){
							$('#searchApt').submit();
						}
					</script>
				</form>
			</div>
		</div>
		<div id="search_content" >
			<table class="table-hover">
				<thead>
					<tr>
						<th style="width: 55px;">아파트명</th>
						<th style="width: 100px;">아파트 위치</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${!empty msg}">
					<tr>
						<td colspan="2" onclick="event.cancelBubble = true;" style="cursor: default;">검색 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach var="apt" items="${list}">
						<tr>
							<td>${apt.name}</td>
							<td>${apt.address}</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</div>
		<div style="text-align: center; margin-top: 2.5%;"><button class="close_btn" onclick="javascript:self.close();">CLOSE</button></div>
	</div>
	
	
	<script>
		$(function(){
			document.getElementById('searchText').value = opener.document.memberjoinForm.aptName.value;	
		});
		
		$('#search_content tbody tr').click(function(){
			opener.document.memberjoinForm.aptName.value = $(this).children().eq(0).text();
			self.close();
		});
	</script>
</body>
</html>
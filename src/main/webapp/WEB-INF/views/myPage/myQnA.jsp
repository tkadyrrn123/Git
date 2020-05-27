<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style>
	#myBoardTable{
		margin:0 auto;
		border-collapse:collapse;
	}
	#myBoardTable thead th{
    background: #6f809a;
    color: #fff;
    border: 1px solid #60718b;
    font-weight: normal;
    text-align: center;
    padding: 8px 5px;
    font-size: 0.92em;
	}
	#myBoardTable tbody td{
	    border: 1px solid #d6dce7;
	    padding: 5px;
	    text-align: center;
	    line-height: 22px;
	}
	
	.number{
		width: 50px;
	}
	.name{
		width: 450px;
	}
	.date{
		width: 150px;
	}
	.type{
		width: 70px;
	}
	/* .topBoard{
		background-color: #A9D0F5;
	}
	.topBoard>th{
		border-bottom: 2px solid gray;
	}
	.bottomBoard>tr:last-child>td{
		border-bottom: 2px solid gray;
	}
	.bottomBoard>tr>td:nth-child(even){
		border-right: 1px solid black;
	}
	.bottomBoard>tr>td:nth-child(odd){
		border-right: 1px solid black;
	}
	.bottomBoard>tr>td:last-child{
		border-right: 0px;
	} */
	.bottomBoard>tr:nth-child(even){
		background-color: #CEF6F5;
	}
	#write{
		background-color:skyblue;
		height: 40px;
		color: white;
		border-radius: 5px;
		border:none;
		margin-top: 10px;
	}
	#pagingTable{
		width: 100%;
	}
	#pagingTable>tbody>tr>td:first-child{
		width: 87%;
	}
/*-- POPUP common style S --*/
.layerpop {
    display: none;
    z-index: 1000;
    border-radius:5px;
    background: #fff;
    cursor: move; 
    background-color: rgb(253, 249, 234);}

.layerpop_area .content {
    margin: 2%;
    text-align:center;
}
.layerpop_area .content>button {
	width: 85px;
	height: 35px;
}
.layerpop:hover{
	cursor: default;
}
    
.writeCom{
	color: white;
	background-color:#A9BCF5;
	border-radius: 5px;
	border: 0;
}
.close{
	background-color:#D8D8D8;
	border-radius: 5px;
	border: 0;
}
.QnATable{
	margin-left:5%;
	border-collapse: collapse;
	font-size: 12px;
}
.QnATable tr td{
	border: 1px solid #A4A4A4;
}
#QnATitle{
	background-color:transparent;
	border:0;
	width: 280px;
}
#QnAContent{
	background-color:transparent;
	border:0;
	width: 280px;
	height: 110px;
	resize: none;
	padding-top: 90px;
}
#QnAFile{
	position: absolute;
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}
.first{
	background: #E6E6E6;
	width: 100px;
}
.second{
	width: 320px;
}
.second.title{
	height: 40px;
}
.second.content{
	height: 200px;
}
.second.file{
	height: 40px;
}
.second label{
	display: inline-block; 
	padding: .3em .5em; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #D8D8D8; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em;
}
.upload-name{
	margin-right: 50px;
}
.myPageUl li:nth-child(3) {
	background-color: #8181F7;
}
</style>
<script>
function goDetail() {
    /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 

    popupOpen(); //레이어 팝업창 오픈 
}
function popupOpen() {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    $('#layerbox').show();
}
function popupClose() {
    $('#layerbox').hide();
}
$(document).ready(function(){ 
	var fileTarget = $('#QnAFile'); 
	fileTarget.on('change', function(){ 
		// 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name; 
		} else { 
			// old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		} 
		
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename); 
	}); 
});

</script>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">QnA</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
	<table id = "myBoardTable">
		<thead>
			<tr class="topBoard">
				<th class="number">No.</th>
				<th class="name">제목</th>
				<th class="date">작성일</th>
				<th class="type">처리상황</th>
			</tr>
		</thead>
		<tbody class="bottomBoard">
			<tr>
				<td>22</td>
				<td>A동 벤치 고장난것 같아요! </td>
				<td>2020-05-09</td>
				<td>처리 중</td>
			</tr>
			<tr>
				<td>22</td>
				<td>A동 벤치 고장난것 같아요! </td>
				<td>2020-05-09</td>
				<td>처리 중</td>
			</tr>
			<tr>
				<td>22</td>
				<td>A동 벤치 고장난것 같아요! </td>
				<td>2020-05-09</td>
				<td>처리 중</td>
			</tr>
			<tr>
				<td>22</td>
				<td>A동 벤치 고장난것 같아요! </td>
				<td>2020-05-09</td>
				<td>처리 중</td>
			</tr>
		</tbody>
	</table>
	<table id = "pagingTable">
		<tbody>
		<!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab">
				<td>
				&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
				<td><button id="write" onClick="javascript:goDetail();">문의작성</button></td>
			</tr>
		</tbody>
	</table>
	</div>
	<!--Popup Start -->
    <div id="layerbox" class="layerpop"
        style="width: 490px; height: 400px;">
        <article class="layerpop_area">
        <br>
        <div class="content">
        	<table class="QnATable">
        		<tr>
        			<td class="first"><b>제목</b></td>
        			<td class="second title"><input type="text" id="QnATitle" placeholder="제목을 입력해주세요"></td>
        		</tr>
        		<tr>
        			<td class="first"><b>내용</b></td>
        			<td class="second content"><textarea id="QnAContent" placeholder="내용을 입력해주세요"></textarea></td>
        		</tr>
        		<tr>
        			<td class="first"><b>파일</b></td>
        			<td class="second file"><label for="QnAFile">파일선택</label>&emsp;&emsp;<input class="upload-name" value="파일선택" disabled="disabled">
        			<input type="file" id="QnAFile"></td>
        		</tr>
        	</table>
        	<br>
    		<button onClick="javascript:popupClose();" class="close">취소</button>
    		<button onClick="javascript:popupClose();" class="writeCom">작성완료</button>
        </div>
        </article>
    </div>
    <!--Popup End -->
</body>
</html>
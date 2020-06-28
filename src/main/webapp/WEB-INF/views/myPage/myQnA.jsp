<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
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
	.bottomBoard>tr>td:nth-child(2){
		cursor: pointer;
	}
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
    z-index: 10000;
    border-radius:5px;
    background: #fff;
    cursor: move; 
    background-color: rgb(253, 249, 234);
    }

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
.close2{
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
	height: 220px;
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
.second.fileDownload{
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
.download-name{
	margin-right: 50px;
}
.myPageUl li:nth-child(3) {
	background-color: #8181F7;
}
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
}
#download{
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
</style>
<script>
function goDetail(data,check) {
    /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 
    popupOpen(data,check); //레이어 팝업창 오픈 
}
function popupOpen(data,check) {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    if(data != null){
	    var title = data.substring(data.lastIndexOf("QNATitle=")+9, data.lastIndexOf("QNAContent=")-2);
	    var content = data.substring(data.lastIndexOf("QNAContent=")+11, data.lastIndexOf("userId=")-2);
	    var fileName = data.substring(data.lastIndexOf("QNAFileName=")+12, data.lastIndexOf("deleteYN=")-2);
	    console.log(fileName);
	    $('#QnATitle').val(title);
	    $('#QnAContent').val(content);
	    if(fileName != 'null' && check == 0){
	    	$('.download-name').val(fileName);
	    	$('#download').attr('href','resources/uploadFiles/'+fileName);
	    }else{
	    	$('.download-name').val("파일이 존재하지 않습니다.");
	    }
	    $('.writeCom').hide();
	    $('.close').hide();
	    $('.close2').show();
	    $('.file').hide();
	    $('.fileDownload').show();
    }else{
    	$('#QnATitle').val("");
	    $('#QnAContent').val("");
	    $('.upload-name').val("");
	    $('.writeCom').show();
	    $('.close').show();
	    $('.file').show();
	    $('.fileDownload').hide();
	    $('.close2').hide();
    }
    $('#layerbox').show();
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();
    $("#mask").css({"width":maskWidth,"height":maskHeight});
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);
}
function popupClose() {
    $('#layerbox').hide();
    $("#mask, .window").hide();
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
	$("#mask").click(function(){  
		console.log("d");
	    $(this).hide();  
	    $("#layerbox").hide();  
	});
});
function QnAsubmit(){
	var title = $('#QnATitle').val();
    var content = $('#QnAContent').val();
    if(!title || !content){
    	alert("제목과 내용 전부 입력해주시기 바랍니다.");
    	return false;
    }else{
    	return true;
    }
}
</script>
</head>
<body>
	<div id="mask"></div>
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
			<c:if test="${qlist != null && !qlist.isEmpty()}">
				<c:forEach var="i" begin="0" end="${qlist.size()-1}">
					<tr>
						<td>${qlist[i].QNAId }</td>
						<td onClick="javascript:goDetail('${qlist[i]}',0);">${qlist[i].QNATitle }</td>
						<td>${qlist[i].QNADate}</td>
						<c:if test='${qlist[i].answerYN eq "N"}'>
							<td>처리 중</td>
						</c:if>
						<c:if test='${qlist[i].answerYN eq "Y"}'>
							<c:set var="check" value="0"/>
							<c:forEach var="j" begin="0" end="${rqlist.size()-1}">
								<c:if test="${check eq 0 }">
									<c:if test="${rqlist[j].QNAId == qlist[i].QNAId}">
										<c:set var="check" value="1"/>
										<td style="cursor:pointer;" onClick="javascript:goDetail('${rqlist[j]}',1);">처리완료</td>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${qlist == null || qlist.isEmpty()}">
				<tr>
					<td colspan="4">불러올 QnA가 없습니다.</td>
				</tr>
			</c:if>
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
						<c:url var="before" value="myQnA.my">
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
							<c:url var="pagination" value="myQnA.my">
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
						<c:url var="after" value="myQnA.my">
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
        	<form action="insertQnA.my" onsubmit="return QnAsubmit();" method="post" enctype="multipart/form-data">
	        	<table class="QnATable">
	        		<tr>
	        			<td class="first"><b>제목</b></td>
	        			<td class="second title"><input type="text" id="QnATitle" name="QnATitle" placeholder="제목을 입력해주세요"></td>
	        		</tr>
	        		<tr>
	        			<td class="first"><b>내용</b></td>
	        			<td class="second content"><textarea id="QnAContent" name="QnAContent" placeholder="내용을 입력해주세요"></textarea></td>
	        		</tr>
	        		<tr>
	        			<td class="first"><b>파일</b></td>
	        			<td class="second file"><label for="QnAFile">파일선택</label>&emsp;&emsp;<input class="upload-name" value="파일선택" disabled="disabled">
	        			<input type="file" id="QnAFile" name="QnAFile"></td>
	        			<td class="second fileDownload">
	        			<a id="download" download>다운로드</a>&emsp;&emsp;<input class="download-name" disabled="disabled">
	        			</td>
	        		</tr>
	        	</table>
	        	<br>
	        	<input type="hidden" name="page" value="${pi.currentPage}">
	    		<button type="button" onClick="javascript:popupClose();" class="close">취소</button>
	    		<input type="submit" class="writeCom" value="작성완료">
	    		<button type="button" onClick="javascript:popupClose();" class="close2">닫기</button>
    		</form>
        </div>
        </article>
    </div>
    <!--Popup End -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
   .wrapper{margin-top: 20px;}
	#title{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;}
	#line{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px;}
	.sellAll{width: 80%; margin: 40px 0px 0px 200px; postion:relative;}
	.sell{width: 350px;  display: inline-block; margin-left: 100px; margin-bottom:50px;}
	.sell:hover{cursor:pointer;}
	.sellDiv{width: 100%; height: 300px;}
	.sellPic{width: 100%; height: 210px;}
	.sellName{width: 100%; height: 10%; font-size: 20px; font-weight:bold;margin-top:10px;}
	.sellAddress{width: 100%; height: 10%;}
	.sellPrice{width: 100%; height: 10%;}
	.btn-standard {
	   border: 1px solid #ccccce;
	    border-radius: 6px;
	    background-color: #fff;
	    font-weight: 500;
	    color: #666;
	    cursor: pointer;
	    font-size: 12px;
	    padding: 7px;
	}

	.marketFilterForm{position:absolute; width: 300px; display:inline-block; left:44%;}
	
	#write-btn{color:white;
			   background-color:black; 
/* 			   position:absolute; */
/* 			   top:30px; */
/* 			   right: 344px; */
				float: right;
				margin-right: 344px;
			   }	
	.pagingArea{margin-top: 90px;}	
	
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
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<img class="img" src="resources/images/market6.jpg">
	<div class="header_wrap">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">중고 장터</b>
	</div>
	
	<div class="wrapper">
		<div id= title>
			중고 장터
		</div>
		<div id="line"></div>
		
		<!-- 게시글 리스트 -->
		<div class=sellAll>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div class=sellPic><img class=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/ap.jpg"/></div>
					<div class=sellName>아파트</div>
					<div class=sellAddress>닉네임</div>
					<div class=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
		</div>
		
		<div class="marketFilterForm">
		  <form class="marketFilter">
	            <select id="marketSelect" name="marketSelect">
	                <option value="total">전체</option>
	                <option value="writer">작성자</option>
	                <option value="text">내용</option>
	            </select>
				<input type="text" id="text">
				<button type="button" id="schButton"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
          </form>
		</div>
		
		<button id="write-btn" class="btn-standard" type="button" value="글쓰기" onclick="location.href='writingMarket.ma'">글쓰기</button>
		
		
		<div class="pagingArea" align="center">

			<!-- 맨 처음으로 -->
			<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/worryList.bo?currentPage=1'">&lt;&lt;</button>
						
			<!-- 이전 페이지로 -->
			<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/worryList.bo?currentPage='" id="beforeBtn">&lt;</button>	
			<!-- 10개 페이지 목록 -->
			<button id="choosen"  class="btn-standard" disabled>4</button>		
			<button id="numBtn"  class="btn-standard" onclick="location.href='<%=request.getContextPath() %>/worryList.bo?currentPage='">5</button>	
			<!-- 다음 페이지로 -->
			<button id="afterBtn"  class="btn-standard" onclick="location.href='<%= request.getContextPath()%>/worryList.bo?currentPage='">&gt;</button>
			<script>
				$('#afterBtn').attr('disabled', 'ture');
			</script>
			<!-- 맨 끝으로 --> 
			<button class="btn-standard" onclick="location.href='<%=request.getContextPath()%>/worryList.bo?currentPage='">&gt;&gt;</button>
        </div>
	</div>
	
	<script>
		$('.sell').on('click', function(){
			location.href="marketDetail.ma"
		})
	</script>

	
	
</body>
</html>
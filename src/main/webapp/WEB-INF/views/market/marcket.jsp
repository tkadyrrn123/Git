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
   #all{margin-top: 250px;}
	#title{width:50%; margin-left: 222px; font-size:30px; font-weight:bold;}
	#line{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px;}
	.sellAll{width: 80%; margin: 40px 0px 0px 200px;}
	.sell{width: 350px;  display: inline-block; margin-left: 100px; margin-bottom:50px;}
	.sell:hover{cursor:pointer;}
	.sellDiv{width: 100%; height: 300px;}
	#sellPic{width: 100%; height: 210px;}
	#sellName{width: 100%; height: 10%; font-size: 20px; font-weight:bold;}
	#sellAddress{width: 100%; height: 10%;}
	#sellPrice{width: 100%; height: 10%;}
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

	#marketSelect{margin:36px 8px; height: 30px;
				  position:absolute;
				      bottom: -481px;
    				right: 1050px;}
    				
	#text{height: 25px;
		  position:absolute;
		  bottom: -445px;
   	      right: 871px	}
   	      
	#schButton{margin-top :2px;
			   position:absolute;
			   bottom: -443px;
    			right: 814px }
	
	#write-btn{color:white;
			   background-color:black; 
			   position:absolute;
			   bottom: -444px;
			   right: 344px;}	
	.pagingArea{margin-top: 90px;}	
</style>




</head>
<body>
	
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<c:import url="bar.jsp"/>
	
	<div id= all>
		<div id= title>
			중고 장터
		</div>
		<div id="line"></div>
		
		<!-- 게시글 리스트 -->
		<div class=sellAll>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
			<div class=sell>
				<div class=sellDiv>
					<div id=sellPic><img id=sellPic src="${ pageContext.servletContext.contextPath }/resources/images/01.png"/></div>
					<div id=sellName>아파트</div>
					<div id=sellAddress>닉네임</div>
					<div id=sellPrice>4억 3000천만</div>
	
				</div>
			</div>
		</div>
		
		  <form class="marketFilter">
                   <div class="marketFilterForm">
	            <select id="marketSelect" name="marketSelect">
	                <option value="total">전체</option>
	                <option value="writer">작성자</option>
	                <option value="text">내용</option>
	            </select>
		                 <input type="text" id="text">
		                 <button type="button" id="schButton"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
	            </div>
          </form>
		
		<button id="write-btn" class="btn-standard" type="button" value="글쓰기" onclick="login()">글쓰기</button>
		
		
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
			location.href="marcketDetail.bo"
		})
	</script>

	
	
</body>
</html>
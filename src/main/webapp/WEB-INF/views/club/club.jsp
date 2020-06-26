<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
$accent-color: #355cc9;

* {
	box-sizing: border-box;
}

body {
	margin: 0;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	font-family: 'Montserrat', sans-serif;
}
.wrapper {
	width: 80%;
    display: flex;
    flex-flow: row wrap;
    justify-content: center;
    margin-top: 53px;
    margin-left: 200px;
}

.card {
	width: 30%;
	height: 340px;
	margin-left:50px ;
	margin-bottom: 50px;
	perspective: 1500px;
	
} 
/** 카드 돌아가는 부분 **/
.card .content {
		position: relative;
		width: 80%; 
		height: 100%;
		transform-style: preserve-3d;
		transition: transform 0.5s cubic-bezier(0.75, 0, 0.85, 1);
	}


.more {
	display: none;
	}
	.more:checked ~ .content {
		transform: rotateY(180deg);
	}


.front,
.back {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
	transform-style: preserve-3d;
	border-radius: 6px;


}
	.front .inner {
		height: 100%;
/* 		display: grid; */
		padding: 1.5em;
		transform: translateZ(80px) scale(0.94);
	}


 .back .inner {
		height: 100%;
/* 		display: grid; */
		padding: 1.5em; 
		transform: translateZ(80px) scale(0.94);
	}

.front {
	background-color: #fff;
	background-size: cover;
	background-position: center center;

}
.back:after{
			background: linear-gradient(
			40deg,
			rgba(67, 138, 243, 0.7),
			rgba(255, 242, 166, 0.7)
		);}
.front:after {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: block;
		border-radius: 6px;
		backface-visibility: hidden;
		background: linear-gradient(
			40deg,
			rgba(67, 138, 243, 0.7),
			rgba(255, 242, 166, 0.7)
		);
	}
	
	.front .inner {
/* 		grid-template-rows: 5fr 1fr 1fr 2fr 1fr; */
		justify-items: center;
	}
	
	.front h2 {
/* 		grid-row: 2; */
		margin-bottom: 0.3em;
		text-transform: uppercase;
		letter-spacing: 3px;
		color: #fff;
		font-weight: 500;
		text-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
		margin-top: -10px;
		text-align: center; 
	}
	
	.front .rating {
/* 		grid-row: 3; */
		color: rgba(255, 255, 255, 0.8);
		font-size: 14px;
		display: flex;
		flex-flow: row nowrap;
		
	}
	
/* 	.front .rating i { */
/* 			margin: 0 1px; */
/* 		} */


.back {
	transform: rotateY(180deg);
	background-color: #fff;
	border: 2px solid rgb(240, 240, 240);
	background: linear-gradient(
			40deg,
			rgba(67, 138, 243, 0.7),
			rgba(255, 242, 166, 0.7)
		);
	}
	.back .inner {
/* 		grid-template-rows: 1fr 2fr 1fr 2fr 14fr 1fr 1fr; */
/* 		grid-template-columns: repeat(4, auto); */
/* 		grid-column-gap: 0.8em; */
		justify-items: center;
		margin-top: -16px;
		
	}

.back .info {
		margin-top: -30px;
		/* 	position: relative;
		display: flex;
		align-items: center;
		color: $accent-color; 
		grid-row: 3; */
	}

/* 	.back .info:not(:first-of-type):before {
			content: '';
			position: absolute;
			left: -0.9em;
			height: 18px;
			width: 1px;
			background-color: #ccc;
		} 
		
	.back .info span {
			font-size: 2em;
			font-weight: 700;
		}	
	
	.back .info i {
			
			font-size: 1.2em;
		}
		
	.back .info i:before {
				background: linear-gradient(40deg, rgba(67, 138, 243, 0.7), rgb(67, 138, 243));

				-webkit-text-fill-color: transparent;
				-webkit-background-clip: text;
			}	
	
	.back .info .icon {
			margin-left: 0.3em;
			
		} */
		
 	.back .info .icon span {
				display: block;
				margin-top: -0.25em;
				font-size: 0.8em;
				font-weight: 600;
				white-space: nowrap;
			} 
/*
 	.description {
 		grid-row: 5; 
 		grid-column: 1/-1; 
		font-size: 0.86em;
		border-radius: 5px;
		font-weight: 600;
		line-height: 1.4em;
		overflow: auto;
		color: accent-color;
		padding-right: 10px;
	} 

	.location,
	.price {
		font-weight: 600;
		color: $accent-color;
 		grid-row: 1; 
		font-size: 0.86em;
	}

	.location {
 		grid-column: 1/3; 
		justify-self: left;
	}

	.price {
 		grid-column: 3/-1; 
		justify-self: right;
	}
*/
	.button {
/* 		grid-column: 1/-1; */
		justify-self: center;
	}


.button {
/* 	grid-row: -1; */
	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 600;
	cursor: pointer;
	display: block;
	padding: 0 1.5em;
	height: 3em;
	line-height: 2.9em;
	min-width: 3em;
	background-color: transparent;
	border: solid 2px #fff;
	color: #fff;
	border-radius: 4px;
	text-align: center;
	left: 50%;
	backface-visibility: hidden;
	transition: 0.3s ease-in-out;
	text-shadow: 0 0 6px rgba(0, 0, 0, 0.3);
	}
	.button:hover {
		background-color: #fff;
		box-shadow: 0 0 50px rgba(0, 0, 0, 0.5);
		text-shadow: none;
		color: accent-color;
	}

	.button .return {
		line-height: 3em;
		color: accent-color;
		border-color: accent-color;
		text-shadow: none;
		
	}
	
	.button .return:hover {
			background-color: accent-color;
			color: #fff;
			box-shadow: none;
		}
	
}

::-webkit-scrollbar {
	width: 5px;
}
::-webkit-scrollbar-track {
	background: #f1f1f1;
}
::-webkit-scrollbar-thumb {
	background: lighten(accent-color, 20%);
}
::-webkit-scrollbar-thumb:hover {
	background: accent-color;
}

	#sellPic{width: 100%; height: 210px;}	 
	
	#imgg{}
	 table{text-align:center;}  
	 th{width:80px; height: 30px;}
	 #all{margin-top: 250px;}
	 #title{width: 50%; margin-left: 246px; font-size: 30px; font-weight: bold; margin-top: 30px;}
	#line{width: 80%; background: lightgray; height:2px; margin: auto; margin-top: 20px; border: 1px solid lightgray;} 
	
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
	#writeBtn{ background:black; color:white; margin-left: 1300px; margin-bottom:30px; margin-top: 30px;}
	.pagingArea{    display: inline;
    width: 100%;}
</style>

</head>
<body>

	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	
	
	<img class="img" src="resources/images/05.PNG">
	<jsp:include page="../common/menubar.jsp"/> 
	<b id="headcomment">동호회 페이지</b>	
	<div id= title>
			동호회
	</div> 
		<div id="line"></div> 

<!-- 동호회 리스트  -->
<div class="wrapper">
		
		<c:forEach var="b" items="${ list }" varStatus="status">
        <div class="card">
            <input type="checkbox" id="card${ status.index }" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/clubFiles/${ b.fileName }')">
                    <div class="inner">
                        <h2>${ b.clubName }</h2>
			
                        <label for="card${ status.index }" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                        <c:url var="cdetail" value="clubDetail.cb">
	                        <c:param name="clubName" value="${ b.clubName }"></c:param>
	                        <c:param name="boardNo" value="${ b.boardNo }"></c:param>
	                        <c:param name="page" value="${ pi.currentPage }"></c:param>
	                        <c:param name="userId" value="${ loginUser.userId }"></c:param>
                        </c:url>
                        <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;" onclick="location.href='${ cdetail }'"> 
                      	      상세페이지 이동
                        </label>
                        
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>${ b.clubName }</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				${ b.clubIntro }
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				${ b.clubPlan }
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				${ b.clubPlace }
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( ${b.clubPeople } / ${ b.maxPeople } )
                           			</td>
                           		</tr>
                           </table>
                        </div>

                        <label for="card${ status.index }" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <c:if test="${ empty list }">
        	 활동중인 동호회가 없습니다.
        	 <br><br>
        </c:if>
        		<c:if test="${!empty list }">
        		<div class="pagingArea" align="center">

				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="btn-standard">이전</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="clubList.cb">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button class="btn-standard" onclick="location.href='${ before }'">이전</button>
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button class="btn-standard">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="clubList.cb">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button class="btn-standard" onclick="location.href='${ pagination }'">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="btn-standard">다음</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="clubList.cb">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<button class="btn-standard" onclick="location.href='${ after }'">다음</button>
				</c:if>

       			</div>
       			</c:if>
       			<button id="writeBtn" class="btn-standard" onclick="location.href='clubInsertForm.cb'">동호회 만들기</button> 
        
	</div>
	<jsp:include page="../common/Footer.jsp"/>


	

	</body>
</html> 
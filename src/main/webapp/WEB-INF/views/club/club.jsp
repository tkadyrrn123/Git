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

.card .content {
		position: relative;
		width: 80%; 
		height: 100%;
		transform-style: preserve-3d;
		transition: transform 0.8s cubic-bezier(0.75, 0, 0.85, 1);
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


<div class="wrapper">
        <div class="card">
            <input type="checkbox" id="card1" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/0505.jpg')">
                    <div class="inner">
                        <h2>피부에 양보해조</h2>
			
                        <label for="card1" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                        <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>

                        <label for="card1" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card2" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/cafe.png')">
                    <div class="inner">
                        <h2>커피에 양보해조</h2>

                        <label for="card2" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                        <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card2" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card3" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/develop.png')">
                    <div class="inner">
                        <h2>코딩에 양보해조</h2>

                        <label for="card3" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card3" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card4" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/draw.png')">
                    <div class="inner">
                        <h2>그림에 양보해조</h2>

                        <label for="card4" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card4" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card5" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/guitar.png')">
                    <div class="inner">
                        <h2>기타에 양보해조</h2>

                        <label for="card5" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card5" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card6" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/hola.png')">
                    <div class="inner">
                        <h2>스페인에 양보해조</h2>

                        <label for="card6" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card6" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card7" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/lettering.png')">
                    <div class="inner">
                        <h2>레터링에 양보해조</h2>

                        <label for="card7" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card7" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card8" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/pt.png')">
                    <div class="inner">
                        <h2>내몸에 양보해조</h2>

                        <label for="card8" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                   <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card8" class="button return" aria-hidden="true">
                            <i class="fas fa-arrow-left"></i>
                        </label>
                    </div>
                </div>
            </div>
        </div>
         <div class="card">
            <input type="checkbox" id="card9" class="more" aria-hidden="true">
            <div class="content">
                <div class="front" id="imgg" style="background-image: url('${ pageContext.servletContext.contextPath }/resources/images/soap.png')">
                    <div class="inner">
                        <h2>비누에 양보해조</h2>

                        <label for="card9" class="button" aria-hidden="true" style="margin-top: 160px;">
                            Details
                        </label>
                         <label class="button" id="detailBtn" aria-hidden="true" style="margin-top: 20px;"> 
                      	      상세페이지 이동
                        </label>
                    </div>
                </div>
                <div class="back">
                    <div class="inner">
                    	<h2>피부에 양보해조</h2>
                        
                        <div class="info">  
                           <table>
                           		<tr>
                           			<th>
                           				소개
                           			</th>
                           			<td>
                           				<p>
                           				사업 초기 처음 화장품을 만들 때부터 배웠던
										저의 노하우를 알려드리는 과정입니다.
										</p>
                           			</td>
                                </tr>
                           		<tr>
                           			<th>
                           				계획
                           			</th>
                           			<td>
                           				입문자분들을 위한
										내 브랜드 화장품 만들기
										클래스입니다.
                           			</td>
                           		</tr>
                           		<tr>
                           			<th>
                           				장소
                           			</th>
                           			<td>
                           				102동 1203호
                           			</td> 
                           		</tr>
                           		<tr>
                           			<th>
                           				인원수
                           			</th> 
                           			<td>
                           				( 20 / 40 )
                           			</td>
                           		</tr>
                           </table>
                        </div>
                        <label for="card9" class="button return" aria-hidden="true"> 
                            <i class="fas fa-arrow-left"></i>
                        </label> 
                    </div>
                </div>
            </div>
        </div>
        
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
       			<button class="btn-standard" onclick="location.href='clubInsertForm.cb'">글쓰기</button> 
        
	</div>
	<jsp:include page="../common/Footer.jsp"/>
	<script>
		$('#detailBtn').on('click', function(){
			location.href="clubDetail.cb"
		});
	</script>
	
	

</body>
</html> 
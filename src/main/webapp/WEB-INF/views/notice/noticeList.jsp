<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* { box-sizing: border-box; }
	.commnuity_header { position: absolute;
						left: 46%;
						top: 220px;
						color: white;
						font-size: 1.5em;}
    .board_wrab {text-align: center; 
    			  color:rgb(94, 92, 92);
    			  margin-top: 50px;
    			  width:100%;
    			  postion:relative;
    			  } 
    .board_wrab table{border-collapse: collapse;
    				  width: 1500px;
    				  margin: 0 auto;}
    .board_wrab thead{font-weight: bold;}
    .board_wrab td{border-bottom: 1px solid #aaa; 
    				padding:15px;}
	#notice_tr{border-top: 2px solid black;}
	.dong{color: #7d6451}
    .btitle{white-space: nowrap; 
    		overflow: hidden; 
    		text-overflow: ellipsis;}
    .board_btn{position:absolute;
    		   margin-top:10px;
    		   margin-left:87%;}
    .btn_standard{padding:7px; 
    			  border-radius: 5px; 
    			  font-size: 0.9em; 
    			  font-weight: bold; 
                  color:rgb(139, 134, 134);
                  border: 0;}
    .img {filter: brightness(70%);
		    width: 100%;
		    height: 400px;}	    
</style>
</head>
<body>
	<img class="img" src="resources/images/noticeImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2>공지사항</h2>
	</div>
	<div class="board_wrab">
        <table>
            <thead>
                <tr id="notice_tr">
                    <td style="width: 7%;">번호</td>
                    <td class="dong" style="width: 9%;">단지</td>
                    <td class="btitle">제목</td>
                    <td style="width: 10%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 7%;">조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td class="dong">102동</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>관리사무소</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="dong">전체</td>
                    <td class="btitle">아파트 정문 입구 도로 공사에 관한 공지사항입니다. 필독요청</td>
                    <td>관리사무소</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="dong">103동</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="dong">103동</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>관리사무소</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="dong">103동</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>관리사무소</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="board_btn">
			<button class="btn_standard" onclick="location.href='noticeInsertView.no';">글쓰기</button>
    </div>
</body>
</html>
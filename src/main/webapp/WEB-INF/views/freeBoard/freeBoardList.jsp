<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/freeBoard.css"> -->
<style>
.img { 
     filter: brightness(70%);
     width: 100%;
     height: 400px;
}
	* { box-sizing: border-box; }
/* 	body { background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); } */
 	.commnuity_header { 
	position: absolute;
	left: 45%;
	top: 220px;
	color: white;
	font-size: 1.5em; 	
 	} 
    .board_wrab {text-align: center; 
    			  color:rgb(94, 92, 92);
    			  margin-top:20px;
    			  width:100%;
    			  postion:relative;
    			  } 
    .board_wrab table{border-collapse: collapse;
    				  width: 1500px;
    				  margin: 0 auto;}
    .board_wrab thead{font-weight: bold;}
    .board_wrab td{border-bottom: 1px solid #aaa; 
    				padding:15px;}
	#board_head{border-top: 2px solid black;}
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
                  border:0;}
	.page_wrap{display:inline-block; position:absolute; margin-top: 10px; margin-left: 50%;}
	.form_wrap{margin:30px auto 0 auto; width: 340px;}

	#selectBox{
	  display: block;
	  margin-left: 85%;
	  }
	.select-box {
	  position: relative;
	  display: inline-block;
	  width: 85px;
	  margin: 40px auto 0 auto;
	  font-size: 0.9em;
	  color: #60666d;
      border: 1px solid #dad4d4;
	  }
	.select-box__current {
	  position: relative;
	  box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
	  cursor: pointer;
	  outline: none;
	  }
	.select-box__current:focus + .select-box__list {
	  opacity: 1;
	  animation-name: none;
	  }
	.select-box__current:focus + .select-box__list .select-box__option {
	  cursor: pointer;
	  }
	.select-box__current:focus .select-box__icon {
	  transform: translateY(-50%) rotate(180deg);
	  }
	.select-box__icon {
	  position: absolute;
	  top: 50%;
	  right: 15px;
	  transform: translateY(-50%);
	  width: 15px;
	  opacity: 0.3;
	  transition: 0.2s ease;
	  }
	.select-box__value {
	  display: flex;
	  }
	.select-box__input {
	  display: none;
	  }
	.select-box__input:checked +.select-box__input-text {
	  display: block;
	  }
	.select-box__input-text {
	  display: none;
	  width: 100%;
	  margin: 0;
	  padding: 8px;
	  background-color: #fff;
	  }
	.select-box__list {
	  position: absolute;
	  width: 100%;
	  padding: 0;
	  list-style: none;
	  opacity: 0;
	  animation-name: HideList;
	  animation-duration: 0.5s;
	  animation-delay: 0.5s;
	  animation-fill-mode: forwards;
	  animation-timing-function: step-start;
	  box-shadow: 0 15px 30px -10px rgba(0, 0, 0, 0.1);
	  }
	.select-box__option {
	  display: block;
	  padding: 8px;
	  background-color: #fff;
	  }
	.select-box__option:hover, .select-box__option:focus {
	  color: #546c84;
	  background-color: #fbfbfb;
	  }
	
	@keyframes HideList {
	  from {
	            transform: scaleY(1);
	  }
	  to {
	            transform: scaleY(0);
	  }
	}
	
	.search_input{height:37px; margin:0 5px; vertical-align:bottom; border:1px solid #dad4d4;}
</style>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2>자유 게시판</h2>
	</div>
	<div class="select-box" id="selectBox">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="latest" value="latest" name="Ben" checked="checked"/>
		      <p class="select-box__input-text">최신순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="hits" value="hist" name="Ben"/>
		      <p class="select-box__input-text">조회순</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="like" value="content" name="Ben"/>
		      <p class="select-box__input-text">추천순</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list" style="display:hidden">
		    <li>
		      <label class="select-box__option" for="latest" aria-hidden="aria-hidden">최신순</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="hits" aria-hidden="aria-hidden">조회순</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="like" aria-hidden="aria-hidden">추천순</label>
		    </li>
		  </ul>
	</div>
	<div class="board_wrab">
        <table>
            <thead>
                <tr id="board_head">
                    <td style="width: 5%;">번호</td>
                    <td class="btitle">제목</td>
                    <td style="width: 7%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 6%;">조회수</td>
                    <td style="width: 6%;">추천수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="btitle">아파트에 이상한 사람이 다니는거 같지 않나요?</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>유리창 청소하면 좋을텐데</td>
                    <td>홍길동</td>
                    <td>2020-05-12</td>
                    <td>2</td>
                    <td>0</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="page_wrap">
    <button type="button" class="btn_standard">1</button>
    </div>
    <div class="board_btn">
       <button class="btn_standard" onclick="location.href='writing.fr'">글쓰기</button>
    </div>
    <div class="form_wrap">
    <form class="board_search" name="search_form" action="get">
	    <div class="select-box">
		  <div class="select-box__current" tabindex="1">
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="total" value="total" name="Ben" checked="checked"/>
		      <p class="select-box__input-text">전체</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="writer" value="writer" name="Ben"/>
		      <p class="select-box__input-text">작성자</p>
		    </div>
		    <div class="select-box__value">
		      <input class="select-box__input" type="radio" id="content" value="content" name="Ben"/>
		      <p class="select-box__input-text">내용</p>
		    </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true"/>
		  </div>
		  <ul class="select-box__list">
		    <li>
		      <label class="select-box__option" for="total" aria-hidden="aria-hidden">전체</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="writer" aria-hidden="aria-hidden">작성자</label>
		    </li>
		    <li>
		      <label class="select-box__option" for="content" aria-hidden="aria-hidden">내용</label>
		    </li>
		  </ul>
		</div>
		<input class="search_input" name="text" type="text">
		<button class="btn_standard" type="submit">검색</button>
	</form>
	</div>
</body>
</html>
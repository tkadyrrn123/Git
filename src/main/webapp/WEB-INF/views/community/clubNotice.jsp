<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/noticeBoard.css">
<style>
	* { box-sizing: border-box; }
	.commnuity_header { margin-top:100px;
						margin-bottom:10px;
						text-align: center; 
						color:pink; 
						padding: 70px;}
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
	.board_wrab tr:first-child>td{border-top: 2px solid black;}
	.club{color: #7d6451}
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
                  color:rgb(139, 134, 134);}
                  
	.form_wrap{margin:30px auto 0 auto; width: 267px;}
	.select-box {
	  position: relative;
	  display: inline-block;
	  width: 85px;
	  margin: 40px auto 0 auto;
	  font-size: 0.9em;
	  color: #60666d;
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
	
	.search_input{height:33.75px; margin:0 5px;}
                  
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="commnuity_header">
	<h2>동호회 공지사항</h2>
	</div>
	<div class="board_wrab">
        <table>
            <thead>
                <tr>
                    <td style="width: 7%;">번호</td>
                    <td class="dong" style="width: 12%;">동호회</td>
                    <td class="btitle">제목</td>
                    <td style="width: 10%;">작성자</td>
                    <td style="width: 11%">등록일</td>
                    <td style="width: 7%;">조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td class="club">배드민턴 동호회</td>
                    <td>코로나로 당분간 동호회 활동 없습니다.</td>
                    <td>하니</td>
                    <td>2020-02-12</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="club">공예 동호회</td>
                    <td>교육장 방역관련 안내입니다.</td>
                    <td>아이유</td>
                    <td>2020-01-22</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="club">공예 동호회</td>
                    <td>교육장 방역관련 안내입니다.</td>
                    <td>아이유</td>
                    <td>2020-01-22</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="club">공예 동호회</td>
                    <td>교육장 방역관련 안내입니다.</td>
                    <td>아이유</td>
                    <td>2020-01-22</td>
                    <td>7</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="club">공예 동호회</td>
                    <td>교육장 방역관련 안내입니다.</td>
                    <td>아이유</td>
                    <td>2020-01-22</td>
                    <td>7</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="board_btn">
       <button class="btn_standard">글쓰기</button>
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
		      <input class="select-box__input" type="radio" id="club" value="club" name="Ben"/>
		      <p class="select-box__input-text">동호회</p>
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
		      <label class="select-box__option" for="club" aria-hidden="aria-hidden">동호회</label>
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
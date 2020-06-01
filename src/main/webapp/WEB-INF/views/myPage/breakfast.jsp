<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
/*-- POPUP common style S --*/
.layerpop {
    display: none;
    z-index: 1000;
    border-radius:5px;
    background: #fff;
    cursor: move; 
    background-color: #EAE9E9;}

.layerpop_area .content { 
    margin: 2%;
    text-align:center;
    }
.reslayerpop {
    display: none;
    z-index: 1000;
    border-radius:5px;
    background: #fff;
    cursor: move; 
    background-color: #EAE9E9;
    cursor: default;
    }

.reslayerpop_area .content {
    margin: 2%;
    }
    
.rescategory{
	background: #E0E6F8;
	color:#08088A;
	font-weight: bold;
	text-align: center;
}
/*-- POPUP common style E --*/
.close{
	background-color: pink;
	width: 97%;
	height: 40px;
	border-radius: 5px;
	border: 0;
	color: white;
	font-size: 16px;
	margin-top: 50px;
}
.resclose{
	background-color: pink;
	width: 100%;
	height: 40px;
	border-radius: 5px;
	border: 0;
	color: white;
	font-size: 16px;
	margin-top: 50px;
}
#breakfast{
	margin:0 auto;
}
#breakfast input,select{
	font-size: 16px;
	width: 280px;
}
.reservation{
	width: 100%;
	border-collapse: collapse;
}
.resHead>th{
	border-bottom: 2px solid #08088A;
	color: #08088A;
	height: 50px;
}
.resBody>td{
	padding: 10px;
	border-bottom: 1px solid #BDBDBD;
}
.myPageUl li:nth-child(1) {
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
function goDetailRes(){
	resPopupOpen();
}
function resPopupOpen() {
    $('.reslayerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.reslayerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop() - 100);
    $('.reslayerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft() - 200);
    $('#reslayerbox').show();
}
function resPopupClose() {
    $('#reslayerbox').hide();
    $('#mask').hide();
}
</script>
</head>
<body>
	<img class="img" src="resources/images/myPageImage.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">조석식 예약</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
		<table id="breakfast">
			<tr>
				<td><b>예약일&ensp;&ensp;</b></td>
				<td><input name="date" type="date" placeholder="예약일을 선택해주세요."></td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td><b>예약시간&ensp;</b></td>
				<td><input name="date" type="time" placeholder="예약시간을 선택해주세요."></td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td><b>메뉴&ensp;</b></td>
				<td>
					<select id="bf_food">
						<option value="">메뉴를 선택해주세요</option>
						<option value="샌드위치">샌드위치</option>
						<option value="한식도시락">한식도시락</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="button" value="예약 신청" id="submit" class="button" onclick="javascript:goDetail();">&ensp;&ensp;
		<button type="button" id="cancel" class="button" onclick="javascript:goDetailRes();">예약 결과 확인</button>
	</div>
	<script>
		$('input[type="date"], input[type="time"]').each(function() {
	    var el = this, type = $(el).attr('type');
	    if ($(el).val() == '') $(el).attr('type', 'text');
	    $(el).focus(function() {
	        $(el).attr('type', type);
	        el.click();
	    });
	    $(el).blur(function() {
	        if ($(el).val() == '') $(el).attr('type', 'text');
	    });
	});
	</script>
    <!--Popup Start -->
    <div id="layerbox" class="layerpop"
        style="width: 300px; height: 150px;">
        <article class="layerpop_area">
        <br>
        <div class="content">
			예약신청이 접수 되었습니다.
    		<button onClick="javascript:popupClose();" class="close"><b>확인</b></button>
        </div>
        </article>
    </div>
    <!--Popup End -->
    
    <!--ResPopup Start -->
    <div id="reslayerbox" class="reslayerpop"
        style="overflow:scroll; width: 450px; height: 380px;">
        <article class="reslayerpop_area">
        <br>
        <div class="content">
        	<table class="reservation">
        		<tr class="resHead">
        			<th>예약 진행상황</th>
        			<th>예약완료</th>
        		</tr>
        		<tr class="resBody">
        			<td class="rescategory">예약일</td>
        			<td class="resContent">2020-05-09</td>
        		</tr>
        		<tr class="resBody">
        			<td class="rescategory">예약시간</td>
        			<td class="resContent">조식(07:00 ~ 08:30)</td>
        		</tr>
        		<tr class="resBody">
        			<td class="rescategory">메뉴</td>
        			<td class="resContent">샌드위치</td>
        		</tr>
        	</table>
        	<br>
        	<hr size="2" color=#BDBDBD>
    		<button onClick="javascript:resPopupClose();" class="resclose"><b>확인</b></button>
        </div>
        </article>
    </div>
    <!--ResPopup End -->
</body>
</html>
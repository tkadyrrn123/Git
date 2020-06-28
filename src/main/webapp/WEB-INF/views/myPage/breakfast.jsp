<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
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
	background-color: #b2c9ec;
}
</style>
<script>
$(function(){
	/* 날짜 제한 조건 */
	date = new Date();
	mdate = new Date();
	mdate.setDate(60);
	document.getElementById('date').min = date.toISOString().substring(0, 10);
	document.getElementById('date').max = mdate.toISOString().substring(0, 10);
	
	/* 시간 제한 조건 */
	$('#time').on('change', function(){
		si = parseInt($('#time').val().substring(0,2));
		bun = parseInt($('#time').val().substring(3,5));
		if((!(7 <= si && si <= 8)) && (!(17 <= si && si <= 18))){
			alert("조식은 07:00~08:30, 후식은 17:00~18:30까지입니다.");
			this.value = "";
		}else if((si == 8 || si == 18) && bun > 30){
			alert("조식은 07:00~08:30, 후식은 17:00~18:30까지입니다.");
			this.value = "";
		}
		autoCheck();
	});
});

/* 오늘 날짜일 경우 시간 제한 조건 */
function autoCheck(){
	var autoCheck = setInterval(function(){
		if(si != 0 && bun != 0){
			if((($('#date').val() == date.toISOString().substring(0, 10)) && (si <= date.getHours())) || ((si == date.getHours() + 1) && (bun < date.getMinutes()))){
				alert("주문은 최소 1시간 전 부터 가능합니다.");
				$('#time').val('');
				si = 0;
				bun = 0;
				clearInterval(autoCheck);
			}
		}
	},1000);
}
function Check(){
	if((($('#date').val() == date.toISOString().substring(0, 10)) && (si <= date.getHours())) || ((si == date.getHours() + 1) && (bun < date.getMinutes()))){
		alert("주문은 최소 1시간 전 부터 가능합니다.");
		$('#time').val('');
	}else{
		return 'ok';
	}
}

function goDetail() {
    /*팝업 오픈전 별도의 작업이 있을경우 구현*/
    var date = $('.date').val();
    var time = $('.time').val();
    var option = $('#bf_food').val();
    if(!date || !time || !option){
    	alert("전부 선택해주세요.");
    }else{
    	if(Check() == 'ok'){
			$.ajax({
				url: "insertBreakfast.my",
				data: {date:$('.date').val(), time:$('.time').val(), option:$('#bf_food').val()},
				success:function(data){
					console.log(data);
					if((data == '"success"')){
						popupOpen(); //레이어 팝업창 오픈 
					}
					else{
						alert("조석식 예약에 실패하였습니다.");
					}
				}
			});
    	}
    }
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

/* 예약 결과 확인 */
function goDetailRes(){
	$.ajax({
		url: "breakfastList.my",
		success: function(data){
			$tableBody = $('.reservation>tbody');
			$tableBody.html("");
			for(var i in data){
					var month = data[i].rDate.substring(0,2);
					var day = data[i].rDate.substring(3,5).replace(',','');
					var year = data[i].rDate.substring(6,10);
					var Date = year + "년 " + month + " " + day + "일";
					var $tr1 = $('<tr class="resHead">');
					var $th1 = $('<th>').text("예약진행상황");
					var $th2 = $('<th>').text("예약완료");
					$tr1.append($th1);
					$tr1.append($th2);
					var $tr2 = $('<tr class="resBody">');
					var $td1 = $('<td class="rescategory">').text("예약일");
					var $td2 = $('<td class="resContent">').text(Date);
					$tr2.append($td1);
					$tr2.append($td2);
					var $tr3 = $('<tr class="resBody">');
					var $td3 = $('<td class="rescategory">').text("예약시간");
					var $td4 = $('<td class="resContent">').text(data[i].rTime);
					$tr3.append($td3);
					$tr3.append($td4);
					var $tr4 = $('<tr class="resBody">');
					var $td5 = $('<td class="rescategory">').text("메뉴");
					var $td6 = $('<td class="resContent">').text(data[i].rOption);
					$tr4.append($td5);
					$tr4.append($td6);
					var $tr5 = $('<tr>');
					var $td7 = $('<td colspan="2"><br><hr size="2" color=#BDBDBD>');
					$tr5.append($td7);
					$tableBody.append($tr1);
					$tableBody.append($tr2);
					$tableBody.append($tr3);
					$tableBody.append($tr4);
					$tableBody.append($tr5);
			}
		},error:function(){
			$tableBody = $('.reservation>tbody');
			$tableBody.html("");
			var $tr = $('<tr class="resHead">');
			var $td = $('<th>').text('목록을 불러오는데 실패하였습니다.');
			$tr.append($td);
			$tableBody.append($tr);
		}
	});
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
<!-- 	<img class="img" src="resources/images/myPageImage.jpg"> -->
	<img class="img" src="resources/images/마이페이지.jpg">
	
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">조석식 예약</b>
	<div class="myMenu">
	<jsp:include page="myPageHeader.jsp"/>
	</div>
	<div class="area">
		<table id="breakfast">
			<tr>
				<td><b>예약일&ensp;&ensp;</b></td>
				<td><input id="date" class="date" name="date" type="date" placeholder="예약일을 선택해주세요."></td>
			</tr>
			<tr><td><br></td></tr>
			<tr>
				<td><b>예약시간&ensp;</b></td>
				<td><input id="time" class="time" name="time" type="time" placeholder="예약시간을 선택해주세요."></td>
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
        			<th>목록을 불러오는중입니다. 잠시만 기다려 주십시오.</th>
        		</tr>
        	</table>
    		<button onClick="javascript:resPopupClose();" class="resclose"><b>확인</b></button>
        </div>
        </article>
    </div>
    <!--ResPopup End -->
</body>
</html>
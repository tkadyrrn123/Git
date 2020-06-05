
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="resources/css/select.css" />
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<style>
@font-face { font-family: 'DWImpactamin'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/DWImpactamin.woff') format('woff'); font-weight: normal; font-style: normal; }
html, body { height:100%; overflow:hidden }

body {
	margin: 0;
	padding: 0;
	background: url("resources/images/back5.jpg") no-repeat center center fixed; 
	background-size: cover;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	font-family: sans-serif;
}

.loginBox {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 25%;
    height: 60%;
	padding: 80px 40px;
	box-sizing: border-box;
}

.hr-line {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: white;
	font-size: 12px;
	margin: 8px 0px;
}

.hr-line::before,
.hr-line::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

h2 {
	margin: 0;
	padding: 0 0 20px;
	color: white;
	text-align: center;
}

.loginBox p{
	padding: 0;
	margin: 0;
	font-weight: bold;
	color: white;
}
.loginBox input:focus{outline: none;}

.loginBox input[type="text"]{
    display: inline-block;
	width: 82%;
    height: 38px;
    border: none;
    background: rgb(0,0,0,0.2);
    margin-left: 2px;
    vertical-align: -18px;
	border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 8px;
    color: white;
}
.loginBox input[type="password"]{
    display: inline-block;
	width: 82%;
    height: 38px;
    border: none;
    background: rgb(0,0,0,0.2);
    margin-left: 2px;
    vertical-align: -7px;
	border-bottom-right-radius: 5px;
    border-top-right-radius: 5px;
    padding-left: 8px;
    color: white;
}

.loginBox input[type="submit"]{
    display: inline-block;
	width: 99%;
    height: 38px;
    color: white;
    background: rgb(0,0,0,0.2);
    margin-left: 2px;
    vertical-align: -8px;
    border: 1px solid white;
	border-radius: 5px;
	margin-bottom: 30px;
}
.loginBox input[type="submit"]:active{border: 1px solid #808080; }
.loginBox input::-webkit-input-placeholder{color: #cecbcb;}
.icon1{
	display: inline-block;
	text-align: center;
	width: 15%;
	height: 40px;
	background: rgb(0,0,0,0.2);
	border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
    vertical-align: -10px;
    margin-bottom: 13px;
}

.icon1 img{
	vertical-align: -12px;
	width: 30%;
}

.icon2{
	display: inline-block;
	text-align: center;
	width: 15%;
	height: 40px;
	background: rgb(0,0,0,0.2);
	border-bottom-left-radius: 5px;
    border-top-left-radius: 5px;
	margin-bottom: 13px;
}

.icon2 img{
	vertical-align: -12px;
	width: 30%;
}
.cf{
	text-align: center;
	font-size: 11px;
	color: white;
}

.cf>#a1{margin-left: 10px;}
.cf>#a2{margin-left: 15px;}
.cf>#a3{margin-left: 15px;}
 a:link { color: white; text-decoration: none;}
 a:visited { color: white; text-decoration: none;}
 a:hover { color: white; text-decoration: underline;}
 a:active { color: #808080;}


/*레이어 팝업(회원가입)*/
.modal .modal-content::-webkit-scrollbar{display: none;}
.modal{position: relative; 
	   width: 100%; 
	   height: 100%; 
	   z-index: 1;
}
.modal .modal-content{width:50%;
					  height: 90%;
					  margin:auto;
					  max-height: 100vh;
					  background:white;
					  border:2px solid #666;
					  border-radius: 10px;
					  overflow-y: scroll;
}


.modal .modal-content tbody td{border-bottom: 1px solid #dadada;}
.modal .modal-content tbody tr:nth-child(n+2) td{font-size: 18px;padding-left: 10px; padding-bottom: 15px;}
.modal .modal-content table p{margin: 0; margin-top: 10px; margin-bottom: 5px; font-family: 'DWImpactamin';}
.modal .modal-content table textarea{resize: none; width: 98%; height: 200px; overflow-y: scroll;}
.modal .modal-content h1{text-align: center; font-family: 'DWImpactamin';}
.modal .modal-content input{ width: 98%;
		    			     height: 35px;
							 border-radius: 5px;
							 background: #f9f9f9;
							 border: 1px solid #d4d4d4;
							 box-shadow: inset 0 2px 3px rgba(0,0,0,.05);
							 padding-left: 5px;
							 outline: none;
							 transition: all 0.3s ease-out;
}
.modal .modal-content input:focus{background: white;}
.modal .modal-content input[name=aptName]{width: 45%;}
.modal .modal-content input[name=aptNum]{width: 30%;}
.modal .modal-content .close{float: left;}
.modal .modal-content .member_join{float: right; margin: 25px;}
.modal .modal-content em{color: red;}
.modal .modal-layer{position: fixed; 
                    top: 0; left: 0; 
                    width: 100%; height: 100%; 
                    background: rgba(0,0,0,0.5); z-index: -1;
}

.close{margin: 25px;}
.close .fa-times{font-size: 35px; color: white; float: right;}
.close .fa-times:active{color: #808080;}

.btn {
	border-radius: 3px;
    border: none;
    display: inline-block;
    cursor: pointer;
    color: #ffffff;
    background: black;
    font-family: Arial;
    font-size: 13px;
    font-weight: bold;
    padding:0 20px;
    height : 32px;
    line-height: 32px;
    text-decoration: none;
    transition:background 0.2s
}
.btn:active {background: #fff;}
#SearchApt{
	outline: none;
    background-color: #2f3640;
    border: none;
    font-size: 15px;
    padding: 3px 8px;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}
/*아이디 비번 찾기 */
.modal2 .modal-content::-webkit-scrollbar{display: none;}
.modal2 {position: relative; 
		 width: 100%; 
		 height: 100%; 
         z-index: 1;
}
.modal2 .modal-content{width:50%;
					  height: 84%;
					  margin: auto;
					  margin-top: 1%;
					  max-height: 100vh;
					  background:white;
					  border:2px solid #666;
					  border-radius: 10px;
					  overflow-y: scroll;
}
.modal2 .modal-content #tb1{text-align: center;
						    border: 3px solid #f0f0f0;
						    background-color: #fff;
						    border-radius: 15px;
						    color: #7a7a7a;
						    box-shadow: 2px 2px 4px rgba(0,0,0,.03);
						    margin: auto;
						    width: 90%;
						    margin-top: 10%;
}
.modal2 .modal-content #tb2{text-align: center;
						    border: 3px solid #f0f0f0;
						    background-color: #fff;
						    border-radius: 15px;
						    color: #7a7a7a;
						    box-shadow: 2px 2px 4px rgba(0,0,0,.03);
						    margin: auto;
						    width: 90%;
						    margin-top: 10%;
}
.modal2 .modal-content input[type="email"]{ width: 50%;
						    			    height: 35px;
										    border-radius: 5px;
										    background: #f9f9f9;
											border: 1px solid #d4d4d4;
											box-shadow: inset 0 2px 3px rgba(0,0,0,.05);
											padding-left: 5px;
											outline: none;
											transition: all 0.3s ease-out;}
.modal2 .modal-layer{position: fixed; 
                     top: 0; left: 0; 
                     width: 100%; height: 100%; 
                     background: rgba(0,0,0,0.5); z-index: -1;
}
.modal2 .modal-content .close{margin-left: 5%; margin-top: 2%;}
.modal2 hr{margin-top: 7%; border-color: #666;}
.modal2 .modal-content tbody tr:nth-child(-n+3) td{border-bottom: 1px solid #dadada;}
.modal2 .modal-content tbody {color: black; font-family: 'DWImpactamin';}
.modal2 .modal-content tbody tr:nth-child(n+3) td{padding: 10px;}
.modal2 .modal-content #title{font-family: 'DWImpactamin'; text-align: center; font-size: 40px;}
.close2 .fa-times{font-size: 35px; color: white; float: right;}
.close2 .fa-times:active{color: #808080;}
.close2 {margin: 25px;}


/* 아파트 신청  */
.modal3 .modal-content::-webkit-scrollbar{display: none;}
.modal3 {position: relative; 
		 width: 100%; 
		 height: 100%; 
         z-index: 1;
}
.modal3 .modal-content{width: 36%;
    			      height: 54%;
					  margin: auto;
					  margin-top: 7%;
					  max-height: 100vh;
					  background:white;
					  border:2px solid #666;
					  border-radius: 10px;
					  overflow-y: scroll;
}
.modal3 .modal-content tbody td{border-bottom: 1px solid #dadada;}
.modal3 .modal-content tbody tr:nth-child(n+2) td{font-size: 18px;padding-left: 10px; padding-bottom: 15px;}
.modal3 .modal-content table p{margin: 0; margin-top: 10px; margin-bottom: 5px; font-family: 'DWImpactamin';}
.modal3 .modal-content h1{text-align: center; font-family: 'DWImpactamin';}
.modal3 .modal-content input{ width: 98%;
		    			     height: 35px;
							 border-radius: 5px;
							 background: #f9f9f9;
							 border: 1px solid #d4d4d4;
							 box-shadow: inset 0 2px 3px rgba(0,0,0,.05);
							 padding-left: 5px;
							 outline: none;
							 transition: all 0.3s ease-out;
}
.modal3 .modal-layer{position: fixed; 
                    top: 0; left: 0; 
                    width: 100%; height: 100%; 
                    background: rgba(0,0,0,0.5); z-index: -1;
}

.close3{margin: 15px;}
.close3 .fa-times{font-size: 35px; color: white; float: right;}
.close3 .fa-times:active{color: #808080;}

.modal3 .modal-content .close{float: left;}
.modal3 .modal-content .apt_join{float: right; margin: 15px;}
.modal3 .modal-content em{color: red;}
.modal3 .modal-content input[name="aptAdd_dong"]{width: 90%;}
.modal3 .modal-content input[name="address1"]{width: 60%;}

#postcodify_search_button{
	outline: none;
    background-color: #2f3640;
    border: none;
    font-size: 15px;
    padding: 3px 8px;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}
.fa-minus-square, .fa-plus-square{    
			font-size: 35px;
		    vertical-align: -8px;
		    margin-left: 2%;
		    cursor: pointer;
}

/*프로필 사진 css */

.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
} 

.filebox input[type="file"] {
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 3px 7px;
	line-height: normal;
	font-size: 16px;
	vertical-align: middle;
	cursor: pointer;
	border-radius: 5px;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	vertical-align: middle;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media(min-width: 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 60px;
    height: 60px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	width: 100%;
    height: 100%;
    border-radius: 70%;
}

.filebox.bs3-primary label {
    color: #fff;
    background-color: #2f3640;
    border-color: #2f3640;
}

div.postcodify_popup_layer input.keyword:focus{outline: none;}
</style>
</head>
<body>
	<!-- ================================================== -->
						<!--로그인화면 -->
	<!-- ================================================== -->
	<button onclick="location.href='market.ma'">dsfkjakcfascf</button>
	<div class="loginBox">
		<h2>L O G I N</h2>
		<div class="hr-line">OR</div>
		<form method="post">
			<div class="icon1"><img src="resources/images/user.png"></div><input type="text" name="" placeholder="아이디">	
			<div class="icon2"><img src="resources/images/password.png"></div><input type="password" name="" placeholder="password">	
			<input type="submit" class="login" value="로그인">	
		</form>
		<div class="cf">
			<a id="a1">회원가입</a>
			<a id="a2">ID/PW 찾기</a>
			<a id="a3">아파트 신청</a>
		</div>
	</div>
	<!-- ================================================== -->
						<!--레이어 팝업(회원가입) -->
	<!-- ================================================== -->
	
	<div class="modal" style="display: none;">
		<div class="close">
			<i class="fas fa-times"></i>
		</div>
		<br clear="all">
		<div class="modal-content">
			<form method="post" action="memberInsert.do" id="memberjoinForm" name="memberjoinForm" enctype="Multipart/form-data">
				<table style="width: 100%;">
					<tr>
						<td><h1>회원가입</h1></td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 아이디</p>
							<input type="text" id="id" name="id" autocomplete=off>
							<label id="idchk" style="display: none; font-size: x-small;"></label>
							<input type="hidden" id="idchk1" value="0"/>
						</td> 
					</tr>
					<tr>
						<td>
							<p><em>*</em> 비밀번호</p>
							<input type="text" id="pwd" name="pwd" autocomplete=off>
							<label id="pwdmsg"></label>
							<input type="hidden" id="pwdchk" value="0"/>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 비밀번호 확인</p>
							<input type="text" id="pwd2" name="pwd2" autocomplete=off>
							<label id="pwdchkmsg"></label>
							<input type="hidden" id="pwdchk2" value="0"/>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 이름</p>
							<input type="text" id="name" name="name" autocomplete=off>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 닉네임</p>
							<input type="text" id="nickName" name="nickName" autocomplete=off>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 이메일</p>
							<input type="email" id="email" name="email" autocomplete=off>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 전화번호</p>
							<input type="text" id="phone" name="phone" autocomplete=off placeholder="'-'없이 입력해주세요 ex) 01022334455">
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 아파트명</p>
							<input type="text" id="aptName" name="aptName" autocomplete=off>
							<button type="button" id="SearchApt" onclick="searchApt();">검색</button>
						</td>
					</tr>
					
					<tr>
						<td>
							<p><em>*</em> 동/호수</p>
							 <div class="select-box">
						        <div class="options-container">
						          <div class="option">
						            <input type="radio" class="radio" id="automobiles" name="category" />
						            <label for="automobiles">아파트를 검색해주세요.</label>
						          </div>
						
						        </div>
						        
						        <div class="selected">동을 선택해주세요.</div>
						        <input type="hidden" id="aptDong" name="aptDong" value="">
						     </div>
							<input type="text" id="aptNum" name="aptNum" autocomplete=off placeholder="호수를 입력해주세요 ex)1305호">
							
						</td>
					</tr>
					<tr>
						<td>
							<p>프로필 사진</p>
							<div class="filebox bs3-primary preview-image">
								<input class="upload-name" value="파일선택" disabled="disabled" style="width: 30%;">
								<label for="input_file">업로드</label> 
							  	<input type="file" name="profile_img" id="input_file" class="upload-hidden"> 
							</div>
							<script>
							// 파일 미리보기 기능
							$(document).ready(function(){
								   var fileTarget = $('.filebox .upload-hidden');
							
								    fileTarget.on('change', function(){
								        if(window.FileReader){
								            // 파일명 추출
								            var filename = $(this)[0].files[0].name;
								        } 
							
								        else {
								            // Old IE 파일명 추출
								            var filename = $(this).val().split('/').pop().split('\\').pop();
								        };
							
								        $(this).siblings('.upload-name').val(filename);
								    });
							
								    //preview image 
								    var imgTarget = $('.preview-image .upload-hidden');
							
								    imgTarget.on('change', function(){
								        var parent = $(this).parent();
								        parent.children('.upload-display').remove();
							
								        if(window.FileReader){
								            //image 파일만
								            if (!$(this)[0].files[0].type.match(/image\//)) return;
								            
								            var reader = new FileReader();
								            reader.onload = function(e){
								                var src = e.target.result;
								                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
								            }
								            reader.readAsDataURL($(this)[0].files[0]);
								        }
							
								        else {
								            $(this)[0].select();
								            $(this)[0].blur();
								            var imgSrc = document.selection.createRange().text;
								            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
							
								            var img = $(this).siblings('.upload-display').find('img');
								            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
								        }
								    });
								});
							</script>
						</td>
					</tr>
				</table>
				<button type="button" class="close btn">뒤로가기</button>
				<button type="button" class="member_join btn" onclick="jnform();">회원가입</button>
			</form>
		</div>
		<div class="modal-layer"></div>
	</div>	
	
	<script>
	// 아파트 이름 별로 동리스트 출력
	  $('.selected').on('click',function(){
			var name = $('#aptName').val();
			
			$.ajax({
				url: 'donglist.bo',
				data: {name:name},
				success: function(data){
					
					var $options;
					var $option;
					
					$options = $('.options-container');
					
					$('.option').remove();
					
					for(var i in data){
						$input = $('<div class="option"><input type="radio" class="radio" id="op'+i+'"name="category" /></div>');
						$label = $('<label for="op'+i+'">').text(data[i]);
						
						$input.append($label);
						$options.append($input);
						
					}
					
					customselect();
				}
				
			})
		  	
	  })
	  //아이디 중복검사
	  $('#id').on('keyup',function(){
		  var id = $('#id').val();
		  var check = /^[A-Za-z0-9_\-]{5,20}$/;
		  
		  if(id.length==0){
			  $('#idchk').hide();
			  $('#idchk1').val(0);
		  }
		  if(id.length<4){
			  $('#idchk').show();
			  $('#idchk').text('아이디를 5자리 이상 입력해주세요.');
			  $('#idchk').css('color','red');
			  $('#idchk1').val(0);
		  }else{
			  if(check.test(id)){
	        	  $('#idchk').text('사용 가능합니다.');
				  $('#idchk').css('color','green');
				  $('#idchk1').val(1);
				  
				  $.ajax({
						url: 'dupid.do',
						data: {id:id},
						success: function(data){
							console.log(data);
							
							if(data == 'true'){
								$('#idchk1').val(1);
							}else{
								$('#idchk').text('이미 있는 아이디거나 탈퇴된 아이디입니다.');
								  $('#idchk').css('color','red');
								$('#idchk1').val(0);
							}
							
						}
		          });
				  
			  }else{
				  $('#idchk').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				  $('#idchk').css('color','red');
				  $('#idchk1').val(0);
			  }
		  }
		  
          
          
          
	  });
	  //패스워드 중복검사
      $('#pwd').on('keyup',function(){
    	  
         var pwd = $('#pwd').val();
         var check = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
       
         if(check.test(pwd)){
            $('#pwdmsg').text('사용 가능');
            $('#pwdmsg').css({'color' : 'green', 'font-size' : 'x-small'});
            $('#pwdchk').val(1);
         } else {
            $('#pwdmsg').text('대/소문자, 특수문자, 숫자 포함하여 8자리 이상 입력해주세요.');
            $('#pwdmsg').css({'color' : 'red', 'font-size' : 'x-small'});
            $('#pwdchk').val(0);
         }
         
      });
      //패스워드 확인란 검사
      $('#pwd2').on('keyup',function(){
	  	  var pwd = $('#pwd').val();
	  	  var pwd2 = $('#pwd2').val();
	  	  
	      if(pwd == pwd2){
	      	  	$('#pwdchkmsg').text('일치');
	            $('#pwdchkmsg').css({'color' : 'green', 'font-size' : 'x-small'});
	            $('#pwdchk2').val(1);
	      } else {
	            $('#pwdchkmsg').text('불일치');
	            $('#pwdchkmsg').css({'color' : 'red', 'font-size' : 'x-small'});
	            $('#pwdchk2').val(0);
	      }
	        
	    });
      
      //데이터 보내기 전에 검사
      function jnform(){
          var userId = $('#memberjoinForm #id');
          var userPwd = $('#memberjoinForm #pwd');
          var userPwdChk = $('#memberjoinForm #pwd2');
          var name = $('#memberjoinForm #name');
          var nickname = $('#memberjoinForm #nickname');
          var email = $('#memberjoinForm #email');
          var phone = $('#memberjoinForm #phone');
          var aptName = $('#memberjoinForm #aptName');
          var aptDong = $('#memberjoinForm .selected').text().trim();
          var aptNum = $('#memberjoinForm #aptNum');
          var bool = true;
        	  
          $('#aptDong').val(aptDong);
          
       	if(userId.val() == ''){
            alert("아이디를 입력해주세요.");
            userId.focus();
            return false;
         }
          
         if(userPwd.val() == ''){
            alert("비밀번호를 입력해주세요.");
            userPwd.focus();
            return false;
         }
         
         if(userPwdChk.val() == ''){
            alert('인증번호를 입력해주세요.');
            userCh.focus();
            return false;
         }
         
         if(name.val() == ''){
            alert('이름을 입력해주세요.');
            name.focus();
           return false;
         }
         
         if(nickname.val() == ''){
             alert('닉네임을 입력해주세요.');
             nickname.focus();
            return false;
          }
         
         if(email.val() == ''){
             alert('이메일을 입력해주세요.');
             email.focus();
            	return false;
          }
         
         if(phone.val() == ''){
            alert('핸드폰 번호를 입력해주세요.');
            phone.focus();
       		return false;
         }
        
         if(aptName.val() == ''){
             alert('아파트명을 입력해주세요.');
             aptName.focus();
            	return false;
         }
         
         if(aptDong == '동을 선택해주세요.'){
             alert('동을 선택해주세요.');
             aptDong.focus();
            	return false;
         }
         
         if(aptNum.val() == ''){
             alert('호수를 입력해주세요.');
             aptNum.focus();
            	return false;
         }
         
         if($('#pwdchk').val() == 0 ){
             alert('사용가능한 비밀번호를 입력해주세요.');
             $('#pwd').focus();
             return false;
         }
         
         if($('#pwdchk2').val() == 0 ){
             alert('입력했던 비밀번호와 같이 입력해주세요.');
             $('#pwd2').focus();
             return false;
         }
         
         if($('#idchk1').val() == 0 ){
             alert('사용가능한 아이디를 입력해주세요.');
             userId.focus();
             return false;
         }
       	 if(bool){
          		 $('#memberjoinForm').submit();
          		 $(".modal").fadeOut();
         }   
       	 
		}
    </script>
    
    
	<script>
	$(document).ready(function(){
		customselect();
	});
	
	function customselect(){ 
		
		const selected = document.querySelector(".selected");
		const optionsContainer = document.querySelector(".options-container");
	
		const optionsList = document.querySelectorAll(".option");
		console.log(optionsList);
		selected.addEventListener("click", () => {
		  optionsContainer.classList.toggle("active");
		});
	
		optionsList.forEach(o => {
		  o.addEventListener("click", () => {
		    selected.innerHTML = o.querySelector("label").innerHTML;
		    optionsContainer.classList.remove("active");
		  });
		});
	};
		
		//아파트 검색 팝업창
		function searchApt(){
			window.open('AptSearch.me', 'checkForm', 'width=520, height=590');
		}
		
		
	</script>
	<!-- ================================================== -->
						<!--아이디 비번 찾기  -->
	<!-- ================================================== -->
	<div class="modal2" style="display: none;">
		<div class="close2">
			<i class="fas fa-times"></i>
		</div>
		<br clear="all">
		<div class="modal-content">
			<p id="title">ID / PW 찾기</p>
			<hr style="margin-top: 0;">
			<form>
				<table id="tb1">
					<tr>
						<td><h1>아이디 찾기</h1></td>
					</tr>
					<tr>
						<td><p class="text">아이디는 가입시 등록한 메일 주소로 알려드립니다. 가입할 때 등록한 메일 주소를 입력하고 "아이디 찾기" 버튼을 클릭해주세요.</p></td>
					</tr>
					<tr>
						<td><input type="email" placeholder="이메일 주소"></td>
					</tr>
					<tr>
						<td>
							<button type="submit" class="id btn">아이디 찾기</button>
						</td>
					</tr>
				</table>
			</form>
			<hr>
			<form>
				<table id="tb2">
					<tr>
						<td><h1>비밀번호 찾기</h1></td>
					</tr>
					<tr>
						<td><p class="text">비밀번호는 가입시 등록한 메일 주소로 알려드립니다. 가입할 때 등록한 메일 주소를 입력하고 "임시 비밀번호 발급" 버튼을 클릭해주세요.</p></td>
					</tr>
					<tr>
						<td><input type="email" placeholder="이메일 주소"></td>
					</tr>
					<tr>
						<td>
	 						<button type="submit" class="pass btn">임시 비밀번호 발급</button> 
						</td>
					</tr>
				</table>
				<hr>
			</form>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- ================================================== -->
						<!-- 아파트 추가  -->
	<!-- ================================================== -->	
	<div class="modal3" style="display: none;">
		<div class="close3">
			<i class="fas fa-times"></i>
		</div>
		<br clear="all">
		<div class="modal-content">
			<form method="get" action="aptAdd.do" id="aptAddForm" name="aptAddForm">
				<table style="width: 100%;">
					<tr>
						<td><h1>아파트 신청</h1></td>
					</tr>

<tr>
                  <td>
                     <p><em>*</em> 아파트명</p>
                     <input type="text" id="aptAdd_Name" name="aptAdd_Name" autocomplete=off placeholder="아파트명을 입력해주세요. ex) '래미안아파트  -> 래미안' ">
                     <label class="aptchk ok" style="display: none; color: green; font-size: x-small;">이 아파트는 신청 가능합니다.</label>
                     <label class="aptchk error" style="display: none; color: red; font-size: x-small;">탈퇴된 아파트거나 이미 존재하는 아파트입니다.</label>
                      <input type="hidden" name="aptDuplicateCheck" id="aptDuplicateCheck" value="0"/>

                     <script type="text/javascript">
                        $('#aptAdd_Name').on('keyup',function(){
                            var aptName = $('#aptAdd_Name').val().trim();
                            
                            
                            if($('#aptAdd_Name').val().length == 0){
                               $('.aptchk').hide();
                            } else{
                               $.ajax({
                                 url: 'aptDupChk.do',
                                 data: {name:aptName},
                                 success: function(data){
                                    console.log(data);
                                    
                                    if(data == 'true'){
                                       $('.error').hide();
                                       $('.ok').show();
                                       $('#aptDuplicateCheck').val(1);
                                    }else{
                                       $('.error').show();
                                       $('.ok').hide();
                                       $('#aptDuplicateCheck').val(0);
                                    }
                                 }
                              });
                            }                
                         });
                     </script>
                  </td>
               </tr>

					<tr>
						<td>
							<p><em>*</em> 위치</p>
							<input type="text" id="address1" name="address1" class="postcodify_address" value="">
							<button type="button" id="postcodify_search_button">검색</button>
							
							<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
							<script>
								// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
								$(function(){
									$("#postcodify_search_button").postcodifyPopUp();
								});
							</script>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 동(수)  <small style="font-size: 7px; color: #757575;">ex) 101동, 102동, 103동 입력해주세요.</small></p>
							<input type="text" name="aptAdd_dong" autocomplete=off placeholder="동을 입력해주세요. 추가하시려면 +버튼을 이용해 추가해주세요"><i class="fas fa-plus-square"></i>
						</td>
					</tr>
					<tr>
						<td>
							<p><em>*</em> 전화번호</p>
							<input type="text" id="aptAdd_phone" name="aptAdd_phone" autocomplete=off placeholder="'-'없이 입력해주세요 ex) 01022334455">
						</td>
					</tr>
				</table>
				<button type="button" class="close3 btn">뒤로가기</button>
				<button type="button" class="apt_join btn" onclick="AptAddForm();">신청하기</button>
			</form>
		</div>
		<div class="modal-layer"></div>
		<script>
		function AptAddForm(){
	          var apt_Name = $('#aptAddForm #aptAdd_Name');
	          var apt_address = $('#aptAddForm #address1');
	          var apt_dong = $('#aptAddForm input[name=aptAdd_dong]');
	          var aptAdd_phone = $('#aptAddForm #aptAdd_phone');
	          var apt_dup = $('#aptDuplicateCheck');
	          var dongCnt = 0;
	          var bool = true;
	          
	       	if(apt_Name.val() == ''){
	            alert("아파트명을 입력해주세요.");
	            apt_Name.focus();
	            return false;
	        }
	          
	        if(apt_address.val() == ''){
	            alert("주소를 입력해주세요.");
	            apt_address.focus();
	            return false;
	        }
	        
	        if(apt_dong.val() == ''){
	            alert('아파트 동을 입력해주세요');
	            apt_dong.focus();
	            return false;
	        }
	        
	        if(aptAdd_phone.val() == ''){
	            alert('전화번호를 입력해주세요.');
	            aptAdd_phone.focus();
	           return false;
	        }
	        
	        if(apt_Name.val().indexOf('아파트')>=0){
	        	 alert("'아파트'를 빼고 입력해주세요.");
	        	 apt_Name.focus();
		         return false;
	        }
	        
	        if(apt_dup.val()<=0){
	        	 alert("중복된 아파트입니다.");
	        	 apt_Name.focus();
		         return false;
	        }
	        
	        apt_dong.each(function (i) {
	        	
                if(apt_dong.eq(i).val().indexOf('동')<0){
                	apt_dong.eq(i).focus();
    	            dongCnt = dongCnt+1;
    	        }

             });
	        
			if(dongCnt > 0){
				alert("'동'을 입력해주세요.");
	            return false;
			}
	        
	        if(aptAdd_phone.val().indexOf('-')>=0){
	        	 alert("'-'를 빼고 입력해주세요.");
	        	 aptAdd_phone.focus();
		         return false;
	        }
	        
	       	if(bool){
	          		 $('#aptAddForm').submit();
	          		 $(".modal3").fadeOut();
	        }   
	       	
		}
		</script>
	</div>
	
	<script>
	var dong = $('.fa-plus-square').parent();
	var input = "<input type='text' style='margin-top: 2%;' name='aptAdd_dong' autocomplete=off placeholder='동을 입력해주세요. 삭제하시려면 -버튼을 이용해 추가해주세요'><i class='fas fa-minus-square'></i>";

	$(document).ready (function () {                
        $('.fa-plus-square').click (function () {                                        
            dong.append(input);                            
            $('.fa-minus-square').on('click', function () { 
                $(this).prev().remove(); 
                $(this).remove (); 
            });
        });                                         
    });
	</script>
		
	<script>
		
		/*레이어팝업2 (회원가입 클릭시 팝업 ) */
		$("#a1").click(function(){
			$(".modal").fadeIn();
		});
		$(".close").click(function(){
			$(".modal").fadeOut();
		});
		
		/*아이디 비번 찾기 클릭시 팝업    */
		$("#a2").click(function(){
			$(".modal2").fadeIn();
		});
		$(".close2").click(function(){
			$(".modal2").fadeOut();
		});
		
		/* 아파트 추가 팝업 */
		$("#a3").click(function(){
			$(".modal3").fadeIn();
		});
		$(".close3").click(function(){
			$(".modal3").fadeOut();
		});
		$(".apt_join").click(function(){
			$(".modal").fadeOut();
		});
		
	</script>
</body>
</html>
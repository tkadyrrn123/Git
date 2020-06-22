<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.outer {width: 1000px; height: auto; margin-left: auto; margin-right: auto; margin-bottom: 50px; padding-bottom: 50px;}
	#detailContent {width: 900px; height: 95px;}
	.detailTable{margin: auto; text-align: center; border-collapse: collapse;}
  	.detailTable th{border-bottom: 1px solid lightgray; width:70px;}
 	.detailTable td{border-bottom: 1px solid lightgray; text-align: left;}
 	.detailTable_comment{margin: auto; border-bottom: 1px solid lightgray; height: 50px; background-color: lightgray; width: 800px;}
 	.detailTable_title{margin-left: 10px; font-size: 18px; padding-bottom: 10px; color:rgb(81, 143, 187);}
	.img {filter: brightness(70%); width: 100%; height: 400px;}	
	.nDongview{color:lightcoral; margin-left: 60px; margin-bottom: 20px;}
	
/* 글내용 */
	.board_content{width: 800px;    height: auto;    margin-left: 100px;    margin-top: 40px;    margin-bottom: 40px;}

 /*수정삭제  */
	.pop{padding:5px 0px; cursor: pointer;}
 	.pop:hover label{background-color: lightgray;}
 	#popup{width: 100px; height: 65px; position: absolute; top: 80px; right: 18px; background-color: white; text-align: center;
			    border: 1px solid #d5d5d5; border-radius: 3px; box-shadow: rgba(0,0,0,.1) 0 1px 1px 0; display: none;}
	.fa-ellipsis-v{font-size:25px; display:inline; float: right; margin-top: 15px; margin-right: 20px; background-color: white;
				border: none; cursor: pointer;}
 	
/* 목록으로 가기 버튼 */
	.go_list_box{text-align: right;padding-right: 50px;}
	.go_list{width:70px; height:25px; background-color:lightgray; border:0; outline:0; border-radius:0.34em; cursor: pointer;}		

/* 댓글작성 */
	.reply1_box{width: 800px; height: auto; margin-left: 100px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: dotted; border-color: rgb(201, 232, 255);}
	.comment_img{width: 38px; height: 38px; border-radius: 100%; margin-top: 5px; margin-left: 10px; margin-bottom: 5px; margin-right: 10px; vertical-align: middle;}
	.dong{line-height: 50px; display: inline; margin-left: 10px; margin-right: 10px;}
	.reply1_btn{margin-right: 5px; float:right; width:70px; height:25px; background-color:lightgray; color:white; border:0; outline:0; border-radius:0.34em; cursor: pointer; margin-top: 10px;}
	.reply_TEXT{margin-top: 10px; margin-right: 15px; border-radius:0.34em; border-color: lightgrey; resize:none;}
	.update_reply_TEXT{border-radius:0.34em; border-color: lightgrey; resize:none;}
	.fa-comment-dots{margin-left: 7px; color: #62b3b6;}
	.Reply_list_title{margin-left: 120px; color: #62b3b6; margin-top: 10px; margin-bottom: 10px;}
	#rCount{margin-left: 5px;}
/* 원댓글  */	
	.reply2_box{width: 800px; height: auto; margin-left: 100px; margin-top: 8px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px;border: solid; border-color: rgb(201, 232, 255);}
	
	.update_btn{margin-right: 15px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	
	.delete_btn{margin-right: 10px; margin-left: 15px; margin-top: 15px; border: 1px solid #ccccce; border-radius: 6px; background-color: #fff; font-weight: 500;
	    color: #666; cursor: pointer; font-size: 12px; padding: 7px; width: 65px; float: right; text-align: center;} 
	.counter{color:#aaa; float: right; margin-top: 5px; margin-right: 10px;}
	
	.fa-thumbs-up{cursor: pointer; float: right; margin-top: 10px; margin-right: 10px;}
	 
/* 대댓글  */	
	.reply3_box{width: 763px; height: auto; margin-left: 140px; background-color: rgb(201, 232, 255); padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; margin-top: 8px;}

/* 추가.? 삭제해야하나? */ 	
 	textarea{
              width:100%;
            }
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
 	
</style>
<script type="text/javascript">
            $(document).ready(function(){
                
                var status = false; //수정과 대댓글을 동시에 적용 못하도록
                
//--------1. 댓글 저장-----------------------------------------------------------
                $("#reply_save").click(function(){ //댓글등록 버튼을 누르면
                    
                	//댓글 내용 널값확인
                    if($("#rContent").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#rContent").focus();
                        return false;
                    }
                    
                    var rContent = $("#rContent").val().replace("\n", "<br>"); //댓글 내용 넣고 개행처리
                    
                    //보낼 데이터 값
                    var rContent = $("#rContent").val(); //댓글내용
                    var noticeNo = ${ notice.nNo }; //댓글이 참조하는 공지번호
                    
                    var reply_id; //원댓글 번호 변수명 선언
                    
                    //ajax 호출
                    $.ajax({
                        url            : "addNoticeComment.no",
//                         dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    {rContent:rContent, noticeNo:noticeNo},
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id; //원댓글 번호빈곳에 원댓글 번호 넣기??
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    var reply_area = $("#reply_area");
                    
                    var reply = 
                        '<tr reply_type="main">'+
                        '    <td width="820px">'+
                        rContent+
                        '    </td>'+
                        '    <td width="100px">'+
                        $("#reply_writer").val()+ /*  loginUser.userId */
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="re_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="re_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="re_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                        '    </td>'+
                        '</tr>';
                        
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#rContent").val("");
                });
            });
        </script>
</head>
<body>
<img class="img" src="resources/images/noticeImage.jpg">
<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<form>
	<!----------- 게시글 상단부 시작  ---------->	
			<br>
			<h2 style="margin-left: 15px;">공지사항 상세보기</h2>
			<hr>
			<br>
			<div class="nDongview"><i class="fas fa-crown"></i>  ${ notice.nDong } </div>
			<div id="detailContent" class="detailTable" style="text-align: left; position: relative;">
				<div class="detailTable_title">
					<b>${ notice.nTitle }</b>
				</div>
				<div id="notice_profile" style="float:left;display:inline;">
					<c:if test="${!empty notice.noticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ notice.noticeFile }">
					</c:if>
					<c:if test="${empty notice.noticeFile }">
						<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg">
					</c:if>
                 </div> 					
				<div class="dong">${ notice.userId }</div>
				<div style="display:inline;"><i class="far fa-clock" style="margin-right: 10px;"></i>${ notice.nCreateDate }</div>
				<div style="display:inline;"><i class="far fa-eye" style="margin-right: 10px;"></i>${ notice.nCount }</div>
	<!-------------수정 /삭제 선택 -------------->	
				<c:if test="${ loginUser.userId eq notice.userId }">
				<i class="fas fa-ellipsis-v"></i>
				<div id="popup">
						<c:url var="nModify" value="noticeUpdateView.no">
							<c:param name="page" value="${ page }"/>
							<c:param name="nNo" value="${ notice.nNo }"/>
						</c:url>
						<c:url var="nDelete" value="noticeDelete.no">
							<c:param name="nNo" value="${ notice.nNo}"/>
						</c:url>
					<div class="pop" onclick="location.href='${ nModify }'"><label>수정</label></div>
					<div class="pop" onclick="location.href='${ nDelete }'"><label>삭제</label></div>
				</div>
				</c:if>
				<hr>
			</div>
		<!---------- 게시글 상단부 끝  ----------->	
		<!---------- 게시글 내용  ----------->
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			<div class="board_content">${ fn:replace( notice.nContent, newLineChar, "<br>") }</div>
		<!---------- 게시글 내용 끝 ------------>	
		<!-------- 첨부파일 O 때 ------------>		
			<c:if test="${ !empty notice.renameFileName }">
				<div>
					<img src="${contextPath}/resources/uploadFiles/${ notice.renameFileName }" style="width: 850px; margin-left:50px;">
				</div>
			</c:if>
		<!---------- 첨부파일 O 끝  ---------->		
			<br>
			<hr style="width: 900px;">
			<div class="go_list_box">
				<input type="button" class="go_list" value="목록" onclick="location.href='noticeList.no'">
			</div>
			<br>
<!-------------테스트 댓글 시작------------>				
 			<div>
             	<table class="reply1_box" id="rtb"><!-- border="1" bordercolor="#46AA46" -->
      <!--댓글 작성시 작성자 인포   -->
                   <tr>
                       <td>
                    <!--프로필사진  -->
						<div id="notice_profile" style="float:left;display:inline;">
							<c:if test="${!empty notice.noticeFile }">
								<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ notice.noticeFile }">
							</c:if>
							<c:if test="${empty notice.noticeFile }">
								<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg">
							</c:if>
		                 </div>
		            <!-- 댓글 작성자 아이디 -->  
                        <div class="dong" id="reply_writer" name="reply_writer">${ loginUser.userId }</div>
                        <button id="reply_save" name="reply_save" class="reply1_btn">댓글 등록</button><!-- id="rSubmit" -->
                    </td>
                   </tr>
                   
       <!--댓글 작성시 글 작성 폼   -->           
                   <tr style="margin-left: 10px; margin-top: 12px;">
                       <td >
                           <textarea id="rContent" class="reply_TEXT" name="reply_TEXT" cols="103" rows="4" placeholder="댓글을 입력해주세요."></textarea>
                           <div class="counter" id="counter">0/200</div> <!-- 글자 카운트  -->
                       </td>
                   </tr>
               </table>
<!-- 테스트 댓글 작성창 끝  -->
				<div class="Reply_list_title">Reply list<i class="far fa-comment-dots"></i><span id="rCount"></span></div>
<!-- 테스트 댓글 리스트 목록 창 시작  ----------------------------------------------------------------------------->
<!-- 테스트 댓글 리스트 목록 창 시작  ----------------------------------------------------------------------------->
<!-- 테스트 댓글 리스트 목록 창 시작  ----------------------------------------------------------------------------->
<!-- 테스트 댓글 리스트 목록 창 시작  ----------------------------------------------------------------------------->
               <table border="1" id="reply_area"><!--id="noticeComment_list" -->
                   <tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                       <td colspan="4"></td>
                   </tr>
                   <!-- 댓글이 들어갈 공간 -->
                   <c:forEach var="clist" items="${clist}" varStatus="status">
                    <tr>
                        <td width="820px">
                           ${clist.rContent}
                        </td>
                        <td width="100px">
                            ${clist.userId}
                        </td>
                        <td align="center">
                            <button name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            <button name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button>
                            <button name="reply_del" reply_id = "${replyList.reply_id}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
               </table>
<!-- 테스트 댓글 리스트 목록 창 끝  ----------------------------------------------------------------------------->               
        </div>		
		</form>
	</div>
	
	<script>
	/* 게시글 수정 삭제 보이기 */
	$(".fa-ellipsis-v").click(function(){
           var submenu = $(this).next();
              // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
              console.log(submenu);
                  
               if(submenu.css("display") == "none"){
               	submenu.show();
      	        }else{
      	        	submenu.hide();
      	        }
     });
	// 댓글 등록 textarea 체크
	$('.reply_TEXT').keyup(function (e){
	    var content = $(this).val();
	    $('.counter').html(content.length+"/200");//글자수 실시간 카운팅

	    if(content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('.counter').html("200/200");
	    }
	});
	</script>
	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
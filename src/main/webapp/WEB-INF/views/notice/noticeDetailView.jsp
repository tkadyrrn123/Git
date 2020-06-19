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
                
                $("#list").click(function(){
                    location.href = "/board/list";
                });
                
                //댓글 저장
                $("#reply_save").click(function(){ //댓글등록 버튼을 누르면
                    
                    //널 검사
//                     if($("#reply_writer").val().trim() == ""){
//                         alert("이름을 입력하세요.");
//                         $("#reply_writer").focus();
//                         return false;
//                     }
                    
//                     if($("#reply_password").val().trim() == ""){
//                         alert("패스워드를 입력하세요.");
//                         $("#reply_password").focus();
//                         return false;
//                     }
                    
                    if($("#rContent").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#rContent").focus();
                        return false;
                    }
                    
                    var rContent = $("#rContent").val().replace("\n", "<br>"); //댓글 내용 넣고 개행처리
                    
                    //값 셋팅
                    var objParams = {
                            notice_nNo        : $("#notice_nNo").val(),
                            parent_id        : "0",    
                            depth            : "0",
                            reply_writer    : $("#reply_writer").val(),
                            reply_password    : $("#reply_password").val(),
                            rContent    : rContent
                    };
                    
                    var reply_id; //원댓글 번호 변수명 선언
                    
                    //ajax 호출
                    $.ajax({
                        url            : "addNoticeComment.no",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id;
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
                        $("#reply_writer").val()+
                        '    </td>'+
                        '    <td width="100px">'+
                        '        <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                        '    </td>'+
                        '</tr>';
                        
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#reply_writer").val("");
                    $("#reply_password").val("");
                    $("#rContent").val("");
                    
                });
                
                //댓글 삭제
                $(document).on("click","button[name='reply_del']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                    
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                    
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_password    : $("#"+reply_password).val(),
                            reply_id        : reply_id,
                            r_type            : r_type
                    };
                    
                    //ajax 호출
                    $.ajax({
                        url            :    "commentUpdate.no{rNo}",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                
                                check = true;
                                                                
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    if(check){
                        
                        if(r_type=="main"){//depth가 0이면 하위 댓글 다 지움
                            //삭제하면서 하위 댓글도 삭제
                            var prevTr = $(this).parent().parent().next(); //댓글의 다음
                            
                            while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                                prevTr.remove();
                                prevTr = $(this).parent().parent().next();
                            }
                                                        
                            $(this).parent().parent().remove();    
                        }else{ //아니면 자기만 지움
                            $(this).parent().parent().remove();    
                        }
                        
                    }
                    
                });
                
                //댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                check = false;//패스워드가 맞으면 체크값을 true로 변경
                                alert(retVal.message);
                            }else{
                                check = true;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    
                    
                    if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    
                    if(check){
                        status = true;
                        //자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                        var txt_rContent = $(this).parent().prev().prev().prev().html().trim(); //댓글내용 가져오기
                        if(r_type=="sub"){
                            txt_rContent = txt_rContent.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                        }
                        
                        var txt_reply_writer = $(this).parent().prev().prev().html().trim(); //댓글작성자 가져오기
                        
                        //입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="작성자" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="password" name="reply_modify_password_'+reply_id+'" id="reply_modify_password_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button name="reply_modify_save" r_type = "'+r_type+'" parent_id="'+parent_id+'" reply_id="'+reply_id+'">등록</button>'+
                           '       <button name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" parent_id="'+parent_id+'"  reply_id="'+reply_id+'">취소</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                           //자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                    //원래 데이터를 가져온다.
                    var r_type = $(this).attr("r_type");
                    var r_content = $(this).attr("r_content");
                    var r_writer = $(this).attr("r_writer");
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    
                    var reply;
                    //자기 위에 기존 댓글 적고 
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" parent_id="0" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                    }else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" parent_id="'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                       //자기 위에 붙이기
                    prevTr.after(reply);
                       
                      //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                
                  //댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                    
                    var reply_id = $(this).attr("reply_id");
                    
                    //널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_password_"+reply_id).val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_modify_password_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                    //DB에 업데이트 하고
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    var rContent = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                    var r_type = $(this).attr("r_type");
                    
                    var parent_id;
                    var depth;
                    if(r_type=="main"){
                        parent_id = "0";
                        depth = "0";
                    }else{
                        parent_id = $(this).attr("parent_id");
                        depth = "1";
                    }
                    
                    //값 셋팅
                    var objParams = {
                            notice_nNo        : $("#notice_nNo").val(),
                            reply_id        : reply_id,
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_password  : $("#reply_modify_password_"+reply_id).val(),
                            rContent   : rContent
                    };
 
                    $.ajax({
                        url         :   "commentUpdate.no",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id;
                                parent_id = retVal.parent_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    //수정된댓글 내용을 적고
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" r_type = "main" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                    }else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" r_type = "sub" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                    //자기 위에 붙이기
                    prevTr.after(reply);
                       
                    //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                  
                //대댓글 입력창
                $(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
                    
                    if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    status = true;
                    
                    $("#reply_add").remove();
                    
                    var reply_id = $(this).attr("reply_id");
                    var last_check = false;//마지막 tr 체크
                    
                    //입력받는 창 등록
                     var replyEditor = 
                        '<tr id="reply_add" class="reply_reply">'+
                        '    <td width="820px">'+
                        '        <textarea name="reply_rContent" rows="3" cols="50"></textarea>'+
                        '    </td>'+
                        '    <td width="100px">'+
                        '        <input type="text" name="reply_reply_writer" style="width:100%;" maxlength="10" placeholder="작성자"/>'+
                        '    </td>'+
                        '    <td width="100px">'+
                        '        <input type="password" name="reply_reply_password" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                        '    </td>'+
                        '    <td align="center">'+
                        '        <button name="reply_reply_save" parent_id="'+reply_id+'">등록</button>'+
                        '        <button name="reply_reply_cancel">취소</button>'+
                        '    </td>'+
                        '</tr>';
                        
                    var prevTr = $(this).parent().parent().next();
                    
                    //부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
                    //마지막 리플 처리
                    if(prevTr.attr("reply_type") == undefined){
                        prevTr = $(this).parent().parent();
                    }else{
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
                        
                        if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
                            last_check = true;
                        }else{
                            prevTr = prevTr.prev();
                        }
                        
                    }
                    
                    if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
                        $('#reply_area tr:last').after(replyEditor);    
                    }else{
                        prevTr.after(replyEditor);
                    }
                    
                });
                
                //대댓글 등록
                $(document).on("click","button[name='reply_reply_save']",function(){
                                        
                    var reply_reply_writer = $("input[name='reply_reply_writer']");
                    var reply_reply_password = $("input[name='reply_reply_password']");
                    var reply_rContent = $("textarea[name='reply_rContent']");
                    var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
                    
                    //널 검사
                    if(reply_reply_writer.val().trim() == ""){
                        alert("이름을 입력하세요.");
                        reply_reply_writer.focus();
                        return false;
                    }
                    
                    if(reply_reply_password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        reply_reply_password.focus();
                        return false;
                    }
                    
                    if(reply_reply_content.val().trim() == ""){
                        alert("내용을 입력하세요.");
                        reply_reply_content.focus();
                        return false;
                    }
                    
                    //값 셋팅
                    var objParams = {
                            notice_nNo        : $("#notice_nNo").val(),
                            parent_id        : $(this).attr("parent_id"),    
                            depth            : "1",
                            reply_writer    : reply_reply_writer.val(),
                            reply_password    : reply_reply_password.val(),
                            rContent    : reply_reply_content_val
                    };
                    
                    var reply_id;
                    var parent_id;
                    
                    //ajax 호출
                    $.ajax({
                        url            :    "/board/reply/save",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type         :    "post",
                        async        :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                                parent_id = retVal.parent_id;
                            }
                            
                        },
                        error        :    function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    var reply = 
                        '<tr reply_type="sub">'+
                        '    <td width="820px"> → '+
                        reply_reply_content_val+
                        '    </td>'+
                        '    <td width="100px">'+
                        reply_reply_writer.val()+
                        '    </td>'+
                        '    <td width="100px">'+
                        '        <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '    </td>'+
                        '    <td align="center">'+
                        '       <button name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'">수정</button>'+
                        '       <button name="reply_del" r_type = "sub" reply_id = "'+reply_id+'">삭제</button>'+
                        '    </td>'+
                        '</tr>';
                        
                    var prevTr = $(this).parent().parent().prev();
                    
                    prevTr.after(reply);
                                        
                    $("#reply_add").remove();
                    
                    status = false;
                    
                });
                
                //대댓글 입력창 취소
                $(document).on("click","button[name='reply_reply_cancel']",function(){
                    $("#reply_add").remove();
                    
                    status = false;
                });
                
//                 //글수정
//                 $("#modify").click(function(){
                    
//                     var password = $("input[name='password']");
                    
//                     if(password.val().trim() == ""){
//                         alert("패스워드를 입력하세요.");
//                         password.focus();
//                         return false;
//                     }
                                        
//                     //ajax로 패스워드 검수 후 수정 페이지로 포워딩
//                     //값 셋팅
//                     var objParams = {
//                             id         : $("#board_id").val(),    
//                             password : $("#password").val()
//                     };
                                        
//                     //ajax 호출
//                     $.ajax({
//                         url            :    "/board/check",
//                         dataType    :    "json",
//                         contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
//                         type         :    "post",
//                         async        :     false, //동기: false, 비동기: ture
//                         data        :    objParams,
//                         success     :    function(retVal){
 
//                             if(retVal.code != "OK") {
//                                 alert(retVal.message);
//                             }else{
//                                 location.href = "/board/edit?id="+$("#board_id").val();
//                             }
                            
//                         },
//                         error        :    function(request, status, error){
//                             console.log("AJAX_ERROR");
//                         }
//                     });
                    
//                 });
                
                //글 삭제
//                 $("#delete").click(function(){
                    
//                     var password = $("input[name='password']");
                    
//                     if(password.val().trim() == ""){
//                         alert("패스워드를 입력하세요.");
//                         password.focus();
//                         return false;
//                     }
                    
//                     //ajax로 패스워드 검수 후 수정 페이지로 포워딩
//                     //값 셋팅
//                     var objParams = {
//                             id         : $("#board_id").val(),    
//                             password : $("#password").val()
//                     };
                                        
//                     //ajax 호출
//                     $.ajax({
//                         url            :    "/board/del",
//                         dataType    :    "json",
//                         contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
//                         type         :    "post",
//                         async        :     false, //동기: false, 비동기: ture
//                         data        :    objParams,
//                         success     :    function(retVal){
 
//                             if(retVal.code != "OK") {
//                                 alert(retVal.message);
//                             }else{
//                                 alert("삭제 되었습니다.");
//                                 location.href = "/board/list";
//                             }
                            
//                         },
//                         error        :    function(request, status, error){
//                             console.log("AJAX_ERROR");
//                         }
//                     });
                    
//                 });
                
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
<!--                         이름: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" placeholder="작성자"/> -->
<!--                         패스워드: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder="패스워드"/> -->
						<div id="notice_profile" style="float:left;display:inline;">
							<c:if test="${!empty notice.noticeFile }">
								<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ notice.noticeFile }">
							</c:if>
							<c:if test="${empty notice.noticeFile }">
								<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg">
							</c:if>
		                 </div> 
                        <div class="dong" id="reply_writer" name="reply_writer">${ loginUser.userId }</div>
                        <button id="reply_save" name="reply_save" class="reply1_btn">댓글 등록</button><!-- id="rSubmit" -->
                    </td>
                   </tr>
                   
       <!--댓글 작성시 글 작성 폼   -->           
                   <tr style="margin-left: 10px; margin-top: 12px;">
                       <td >
<!--                            <textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea> -->
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
                   <c:forEach var="replyList" items="${replyList}" varStatus="status">
                    <tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
                        <td width="820px">
                            <c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.rContent}
                        </td>
                        <td width="100px">
                            ${replyList.reply_writer}
                        </td>
                        <td width="100px">
                            <input type="password" id="reply_password_${replyList.reply_id}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
                        </td>
                        <td align="center">
                            <c:if test="${replyList.depth != '1'}">
                                <button name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
                            </c:if>
                            <button name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button>
                            <button name="reply_del" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
               </table>
<!-- 테스트 댓글 리스트 목록 창 끝  ----------------------------------------------------------------------------->               
        </div>		
<!-------------테스트 댓글 끝------------>	
			
		<!-------------댓글 작성  ------------>
<!-- 			<div class="reply1_box" id="rtb"> -->
<!-- 				<div id="notice_profile" style="float:left;display:inline;"> -->
<%-- 					<c:if test="${!empty notice.noticeFile }"> --%>
<%-- 						<img class="comment_img" src="${contextPath}/resources/uploadFiles/${ notice.noticeFile }"> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${empty notice.noticeFile }"> --%>
<%-- 						<img class="comment_img" src="${contextPath}/resources/uploadFiles/normal.jpg"> --%>
<%-- 					</c:if> --%>
<!--                  </div>  -->
<%-- 				<div class="dong">${ loginUser.userId }</div> --%>
<!-- 					<input type="button" id="rSubmit" class="reply1_btn" value="댓글등록"> -->
<!-- 				<div style="margin-left: 10px; margin-top: 12px;"> -->
<!-- 					<textarea id="rContent" class="reply_TEXT" name="reply_TEXT" cols="103" rows="4" placeholder="댓글을 입력해주세요."></textarea> -->
<!-- 				<div class="counter" id="counter">0/200</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		<!-------------댓글 작성  끝------------>
<!-- 			<div class="Reply_list_title">Reply list<i class="far fa-comment-dots"></i><span id="rCount"></span></div> -->
		<!-------------댓글 가져오기 ------------>	
<!-- 			<div id="noticeComment_list"> -->
			
			<!-- 댓글 구현되는 부분  -->
			
<!-- 			</div> -->
		<!-------------댓글 가져오기 끝------------>		
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
	
//--<댓글>-------------------------------------------------------------------------------
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
	
	//댓글 등록
// 	$('#rSubmit').on('click', function(){ //댓글등록 버튼을 누르면
// 		var rContent = $("#rContent").val(); //댓글내용
// 		var noticeNo = ${ notice.nNo }; //댓글이 참조하는 공지번호
				
// 		$.ajax({
// 			url:'addNoticeComment.no',
// 			data:{rContent:rContent, noticeNo:noticeNo},
// 			success: function(data){
				
// 				if(data == 'success'){ //댓글 등록을 성공하면
// 					getCommentList(); //댓글 리스트 불러오기 메소드를 실행시키고
// 					$("#rContent").val(''); //댓글입력창 초기화
// 				}
// 			}
// 		});
// 		$('#counter').html("0/200"); // 댓글 글자수 카운팅 초기화
// 	});
	
	// 댓글 리스트 불러오기
	function getCommentList(){
		var nNo = ${ notice.nNo };
		var htmls="";
		
		$.ajax({
			url: 'cList.no',
			data: {nNo:nNo},
			dataType: 'json',
			success: function(data){
				console.log(data);
				
				//댓글 수 카운팅 후 표시
 				$('#rCount').text(data.length);

 				//$noticeComment_outer = $('#noticeComment_list');
				//$noticeComment_outer.html('');
				
// 				var $div;
// 				var $userFile;
// 				var $rUserId;
// 				var $rContent;
// 				var $rCreateDate;
				
// 				var $rModify;
// 				var $rDelete;
				
				
				if(data.length > 0){
					for(var i in data){
						htmls += '<div id="noticeComment'+data[i].rNo+'" class="reply2_box">';
						htmls += '<div style="float:left;display:inline;">';
						htmls += '<img class="comment_img" src="${contextPath}/resources/uploadFiles/'+data[i].userFile+'" />';
						
						
						//htmls += '<c:if test="${ loginUser.userId == '+data[i].rUserId+' }">';
						htmls += 'if("${loginUser.userId}"== data[i].rUserId){';
						htmls += '<div class="update_btn" onclick="commentUpdateForm('+data[i].rNo+',\''+data[i].rContent+'\');"> 수정 </div>';
						htmls += '<div class="delete_btn" onclick="commentDelete('+data[i].rNo+');"> 삭제 </div>';
						htmls += '}';
						//htmls += '</c:if>';
						
						htmls += '<div class="dong">'+data[i].rUserId+'</div>';
						htmls += '<div class="rContent'+data[i].rNo+'" style="margin-left: 10px; margin-top: 10px; margin-bottom: 10px;">'+data[i].rContent+'</div>';
						htmls += '<div style="margin-left: 10px; color: gray;">'+data[i].rCreateDate+'</div>';
						htmls += '</div></div>';
						
// 						htmls += '</div>';
// 						htmls += '</div>';
// 						htmls += '</div>';
// 						$div = $('<div id="noticeComment'+data[i].rNo+'" class="reply2_box">');
// 						$div_userFile = $('<div style="float:left;display:inline;">');
// 						$userFile = $('<img class="comment_img" src="${contextPath}/resources/uploadFiles/'+data[i].userFile+'">');
						
//  						if("${loginUser.userId}"== data[i].rUserId){
//  							$rModify = $('<div class="update_btn" onclick="commentUpdateForm('+data[i].rNo+',\''+data[i].rContent+'\');"> 수정 </div>');
// 							$rDelete = $('<div class="delete_btn" onclick="commentDelete('+data[i].rNo+');"> 삭제 </div>');
// 						}else{
// 							$rModify = "";
// 							$rDelete = "";
// 						}
// 						$rUserId = $('<div class="dong">').text(data[i].rUserId);
// 						$rContent = $('<div class="rContent'+data[i].rNo+'" style="margin-left: 10px; margin-top: 10px; margin-bottom: 10px;">').text(data[i].rContent);
// 						$rCreateDate = $('<div style="margin-left: 10px; color: gray;">').text(data[i].rCreateDate);

// 						$div.append($userFile);
// 						$div.append($rUserId);
						
// 						$div.append($rModify);
// 						$div.append($rDelete);
						
// 						$div.append($rContent);
// 						$div.append($rCreateDate);
// 						$noticeComment_outer.append($div); // 최종 반영되는 부분
					
					}
				}else{
					
					htmls += '<div id="noticeComment" class="reply2_box">';
					htmls += '<div style="text-align:center;">등록된 댓글이 없습니다.';
					//htmls.push("등록된 댓글이 없습니다.");
					//$('#noticeComment').text('등록된 댓글이 없습니다.');
					
// 					$div = $('<div id="noticeComment" class="reply2_box">');
// 					$rContent = $('<div style="text-align: center;">').text('등록된 댓글이 없습니다.');
					
// 					$div.append($rContent);
// 					$noticeComment_outer.append($div);
				}
				$("#noticeComment_list").html(htmls);

			}
		});
	}
	$(function(){
		getCommentList();
		
		setInterval(function(){
			getCommentList();
		}, 60000);
	});
	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdateForm(rNo, rContent){
	    var a ='';
	    
	   //$(".update_btn").click(function(){
	       // var rModifyMenu = $(".update_btn").next();
	        //var rDeleteMenu = $(".delete_btn").next();
	       // var cancelMenu = 
	        	
	            //if(rModifyMenu.css("display") != "none"){
	            //	rModifyMenu.hide();
	            //	rDeleteMenu.hide();
	   	       // }
	            
		 //});
	    
		//$rModify = $('<a class="update_btn" onclick="commentUpdateForm('+data[i].rNo+',\''+data[i].rContent+'\');"> 수정 </a>');
		//$rDelete = $('<a class="delete_btn" onclick="commentDelete('+data[i].rNo+');"> 삭제 </a> </div>');

	    a += '<div>';
	    a += '<textarea name="rContent_'+rNo+'" class="update_reply_TEXT" id="update_reply_TEXT_'+rNo+'" cols="95" rows="4" onkeyup="plus('+rNo+');">'+rContent.replace(/\+/g, ' ')+'</textarea>';
//  	a += '<textarea name="rContent_'+rNo+'" class="update_reply_TEXT" id="update_reply_TEXT_'+rNo+'" cols="95" rows="4" onkeyup="plus('+rNo+');">'+rContent+'<br></textarea>';
 	    a += '<div class="counter" id="update_counter">'+rContent.length+'/200</div>';
 	    a += '<i class="fas fa-check" onclick="commentUpdate('+rNo+');"></i>'; /* 수정 */
	    
	    $('.rContent'+rNo).html(a);
	}
	
	//댓글 수정시 글자 카운팅
	 function plus(rNo){
	    var content = $("#update_reply_TEXT_"+rNo+"").val();
	    console.log(content);
	    $('#update_counter').html(content.length+"/200");//글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#update_counter').html("200/200");
	    }
	} 
	
	//댓글 수정 저장
	function commentUpdate(rNo){
	    var updateContent = $('[name=rContent_'+rNo+']').val();
	    
	    $.ajax({
	        url : 'commentUpdate.no',
	        dataType: 'json',
	        data : {'rContent' : updateContent, 'rNo' : rNo},
	        success : function(data){
	           
	        	if(data == 1) getCommentList(rNo); //댓글 수정후 목록 출력 
	            
	            alert("댓글이 수정되었습니다.")
	        }
	    });
	}
	
	//댓글 삭제 
	function commentDelete(rNo){
		var deleteCf = confirm("정말로 삭제하시겠습니까?")
		console.log(deleteCf);
		if(deleteCf == true){
		
		    $.ajax({
		        url : 'commentUpdate.no'+rNo,
		        dataType: 'json',
		        success : function(data){
		        	console.log("댓글 삭제 데이터 1>"+data);
		        	
		            if(data == 1) getCommentList(rNo); //댓글 삭제후 목록 출력 
		            
		            
		        }
		    });
		}
	}
	
	</script>
	<jsp:include page="../common/Footer.jsp"/>
</body>
</html>
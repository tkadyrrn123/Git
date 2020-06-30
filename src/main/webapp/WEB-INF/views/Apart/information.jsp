<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOUSTORY</title><link rel=" shortcut icon" href="resources/images/favicon.png"><link rel="icon" href="resources/images/favicon.png">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>
   #allDiv{width: 60%; height: 1000px; margin: 0px auto;}
   #imgDiv{width: 85%; height: 560px;  margin: 0px auto; margin-top: 40px; }
   #map{width: 85%; height: 560px;  margin: 0px auto; margin-top: 40px; border:1px solid gray;}
   #aptImg{width: 100%; height: 560px;}
   #imformTable{width: 85%; margin: 0px auto;}
   th{font-weight: bold;}
   
      
   #informbox{margin-top: 50px;}
   
   #informbox table tbody th {
          text-align: left;
          padding: 9px 15px 8px;
          border: 1px solid #ddd; 
          background: #f7f7f7;
          font-weight: normal;
      }
   #informbox table tbody tr:first-child th, #informbox table tbody tr:first-child td {
       border-top: none;
       border-top: 2px solid #808b97;
      }
   #imformTable{border-collapse: collapse; border-spacing: 0;}
   td, th { padding: 10px; border: 1px solid #ddd}
   
   #warning{width:80%; margin: 0px auto; margin-top:10px;} 
   #menubar{float: left; display: inline-block; width:15%; height: 400px; border: 1px solid #ddd; color: #545861; padding-top:20px;margin-left:20px;}
   ul{list-style:none;}
   #menubar li{font-size: 30px; height: 70px; font-weight: normal; margin-left:30px; }
   #menu{width:100%; height: 400px; margin-bottom:100px; background: skyblue;}
   #all{margin-top: 30px; height:110%;}
   #hello:hover, #info:hover, #pic:hover{cursor:pointer;}
   .img{filter: brightness(70%);
     width: 100%;
     height: 400px;  }
     #headcomment{
	position: absolute;
	left: 43%;
	top: 220px;
	color: white;
	font-size: 1.5em;
}	   
   
</style>

</head>
<body>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application" />	

<!--     <img class="img" src="resources/images/06.png"> -->
    <img class="img" src="resources/images/긴사진.jpg">
	<jsp:include page="../common/menubar.jsp"/>
	<b id="headcomment">아파트 정보</b>

	
   <div id="all">
      <!-- 좌측 메뉴 바 -->
      <!-- <div id="menubar">
         <ul>
            <li id="hello" onclick="location.href='welcome.apt'">인사말</li>
            <li id="info" onclick="location.href='information.apt'">아파트 정보</li>   
         </ul>
      </div> -->
   
      <div id="allDiv">
	
<!--           <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> --> 	

		<!-- 지도 표시 공간 -->
         <div id="map"></div>   
 		 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b84e06d19b1a33aab7847008f9f1ccbe&libraries=services"></script>
 		 <script>
 			<!-- 지도 중심 좌표 -->
 			var mapContainer = document.getElementById('map'),
 			mapOption = {
 					center: new kakao.maps.LatLng(33.450701, 126.570667),
 					level: 3 <!-- 확대레벨 -->
 			}
 			 <!-- 지도 생성 -->
 			var map = new kakao.maps.Map(mapContainer, mapOption);
 			<!-- 주소-좌표 변환 -->
 			var geocoder = new kakao.maps.services.Geocoder();
 			<!-- 주소 입력 -->
 			geocoder.addressSearch("${apt.address}", function(result, status){
 				if(status === kakao.maps.services.Status.OK){
 					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
 					<!-- 화살표로 표시 -->
 					var marker = new kakao.maps.Marker({
 						map: map,
 						position: coords
 					});
 					<!-- 설명 박스 -->
 					var infowindow = new kakao.maps.InfoWindow({
 						content: '<div style="width:150px; text-align:center; padding:6px 0;">${apt.name}</div>'
 					});
 					infowindow.open(map, marker);
 					<!-- 중심을 입력한 곳으로 -->
 					map.setCenter(coords);
 				} else{
 				}
 			});

 		</script> 
	
		
		
		
		
		
		

        


         
      <!-- 아파트 설명 테이블 -->   
         <div id="informbox">
            <table id="imformTable">
               <tbody>
                  <tr>
                     <th>이름</th>
                     <td>${apt.name }</td>
                  </tr>
                  <tr>
                     <th>위치</th>
                     <td>${apt.address }</td>
                  </tr>
                  <tr>
                     <th >세대정보</th>
                     <td>${apt.dong }</td>
                  </tr> 
                  <tr>
                     <th>대표 번호</th>
                     <td>${ apt.tel }</td>
                  </tr>

                  <tr>
                     <th>등록일</th>
                     <td>${apt.createdate }</td>
                  </tr>
               </tbody>
            </table>
            <div id="warning">▶본 페이지의 사진, 일러스트(그림), 분양 정보는 고객의 이해를 돕기 위해 제작된 것으로 인·허가 과정과 실시공에 따라 실제와 차이가 있을 수 있습니다.</div>
         </div>
      </div>

   </div>
   <jsp:include page="../common/Footer.jsp"/>   
</body>
</html>
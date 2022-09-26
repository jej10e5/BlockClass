<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="setting.jsp" %>
<head> 
<!-- font awesome -->
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<!-- font awesome -->
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<!-- bootstrap ver4.6 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
<script src="${project}/script.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba7439462d656bdc59c5331193480eaa&libraries=services"></script>

</head>

<body> 
<%@ include file="header.jsp" %>  
<div id="map_div" style="padding:50px 150px;">
	 			<section class="tut_intro">		
	 			
	 				<div class="name_div">
	 					<h3 class="tut_name">강의 장소</h3>
	 				</div>	
	 				<label>지역 검색*</label>
	 				<div class="row" style="margin:20px 0px;">
                       <div class="col" >  
                         	<input class="form-control" type="text" id="address_kakao" name="adr" readonly 
                         	placeholder="현재 주소를 입력하세요!">
                         </div>
                        <div class="col" >
                         	<input class="btn" type="button" id="adr_btn" value="검색" onclick="adr()">
                         </div>
                   </div>
                     <div class="col-md-4">
                         	<!-- 주소 가져오는 api -->
                         	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								window.onload = function(){
								    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
								        //카카오 지도 발생
								        new daum.Postcode({
								            oncomplete: function(data) { //선택시 입력값 세팅
								                document.getElementById("address_kakao").value = data.address; // 주소 넣기
								                //document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
								            }
								        }).open();
								    });
								}
								
								
								</script>
                         	
							</div>
					<div id="map" style="width:800px;height:600px;"></div>
					<script type="text/javascript">
					
					
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 5// 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				var content = [];
				var cate=[];
			    var i=0;
				<c:forEach var='dto' items='${dtos}'>
					 content.push('<div class="customoverlay">' +
				    '  <a href="classForm.do?lec_num=${dto.lec_num}" style="display:block; color:black; text-decoration:none;"target="_blank">' +   
				    '    <span class="title">${dto.sub}</span>' +
				    '  </a>' +
				    '</div>');
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)*/
				// 주소로 좌표를 검색합니다
				//for(var i=0;i<positions.length;i++){
				geocoder.addressSearch('${dto.adr}', function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        var img1='/ClassProject/class365/icon/restaurant.png';
				        var img2='/ClassProject/class365/icon/bicycle.png';
				        var img3='/ClassProject/class365/icon/money.png';
				        var imageSrc = ''; // 마커이미지의 주소입니다    
				        
				        cate.push('${dto.cate}'); 
				        if(cate[i]=='요리'){imageSrc=img1;}
				        else if(cate[i]=='운동'){imageSrc=img2;}
				        else if(cate[i]=='금융'){imageSrc=img3;}
				        imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
				        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				          
				    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        position: coords, 
				        image: markerImage // 마커이미지 설정 
				    });

				    // 마커가 지도 위에 표시되도록 설정합니다
				    marker.setMap(map);  
				        
				        
				     // 커스텀 오버레이를 생성합니다
				        var customOverlay = new kakao.maps.CustomOverlay({
				            map: map,
				            position: coords,
				            content: content[i],
				            yAnchor: 1 
				        });
				     	i++;
				        /*
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">"${dto.lec_num}"</div>'
				        });*/
						
				      
				    } 
				});  
				//}
				</c:forEach>
				
				//초기중심값
				geocoder.addressSearch('서울 서대문구 신촌로 90', function(result, status) {
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					var imageSize = new kakao.maps.Size(24, 35); 
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				      
				    } 
				}); 
				
				function adr(){
				var i=document.getElementById("address_kakao").value;
				geocoder.addressSearch(i, function(result, status) {
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					var imageSize = new kakao.maps.Size(24, 35); 
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords,
				            image : markerImage
				        });


				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				      
				    } 
				}); 
				}
						
				
				
				

				
				
							
						</script>

				</section>
				</div> 
<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 </body>

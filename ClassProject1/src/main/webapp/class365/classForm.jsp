<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lecture.LectureDBBean"%>
<%@page import="tutor.TutorDataBean" %>
<%@page import="lecture.LectureDataBean" %>
<%@page import="lecde.LecdeDataBean" %>
<%@include file="setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">   
<link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
<!-- bootstrap ver4.6 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script src="${project}/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ba7439462d656bdc59c5331193480eaa&libraries=services"></script>
	
<style>

.progressTag {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        display: block;
        width: 100%px;
        height: 5px;
        border-radius: 7px;
        color: #35495e;
      }
      progress::-webkit-progress-bar {
        background-color: #eee;
        border-radius: 8px;
      }
      progress::-webkit-progress-value {
        background-color: #35495e;
        border-radius: 8px;
      }
      progress::-moz-progress-bar {
        background-color: #eee;
        border-radius: 8px;
      }



#slide_div{
padding-top:20px;

padding-bottom:10px;
}
.range-slider_range{
background-color:#d7dcdf;
border-radius: 5px;
width:100%;

}
.tue_rev{
	width: 100%;
    padding: 48px 0px;
}
.tutor_img{
	display: table-cell;
    width: 30px;
    height: 30px;

}
.tutor_pro_img {
    border-radius: 50%;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
}
.tutor_info {
   display: flex;
    flex-direction: column;
    margin-left: 50px;
}
}
.tut_rev_div {
    margin-left: 200px;
}
.tutor_cmt{
	list-style: none!important; 
    margin-left: 100px;
}
.rev_box{
    display: flex;
    flex-direction: column;
}
.tutor_rev_box{
	background-color: #ffe5ec;
	margin: 8px 0 8px 72px;
	padding: 17px 19px;
    border-radius: 0 10px 10px 10px;
}
#header_nav{
    position: fixed!important;
    width: 100%!important;
}
</style>

			
<script type="text/javascript">
//<!--
$(document).ready(function($) {

        $(".nav_list").click(function(event){            
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });
});

function limitclass(){
	alert("신청이 불가능한 강의입니다.");
}




//-->
</script>

<jsp:include page="header.jsp"/>
 <!--전체 블록 -->   
 <div id="tot_div">
	 <!-- 헤더블록 -->
	
	 </div>
 	<!-- 미들 블록 -->
 	<div id="middle_div">
 	<!-- 네비게이터 -->
 	<div id="nav_div" >
 			<!-- 네비게이션 항목들 -->
 			
 			<a href="#map_div"  class="nav_list">장소</a>
 			
 			<a href="#review_div" class="nav_list">후기</a>	
 	
 			<a href="#class_info_div" class="nav_list">강의설명</a>	
 		
 			<a href="#tut_div" class="nav_list">강사소개 </a>		
 	
 	</div>
 		<!-- 미들항목 메인 아티클 -->

 		    <!-- 강좌내용들과 결제하기박스 분할 -->
 			
 				<!-- 아티클 파트 나누는 블록 -->
	 			<div id="class_info">
	 				<div id="class_pic"> 		
						<c:if test="${dto.img ne null and dto.img ne ''}">			  				
	 					<img src="${imagepath}${dto.img}" >
	 					</c:if>
	 					<c:if test="${dto.img eq null or dto.img eq ''}">
	 				 	<img src="/ClassProject/classImage/img1.jpg">
	 					</c:if>			
	 				</div>
	 				
	 			 				
	 				<section id = "class_intro">
	 					<!-- 클래스 정보 -->
	 					<h2 id="section_name">클래스 정보</h2>
	 					<!--  강좌이름, 강좌설명, 강의사진 -->
	 					<dl class= class_dl>
	 						<dt class= "class_dt">강의 기간 </dt>
	 						
	 						<c:if test="${month gt 1}">
	 						<dd class="class_dd">${month}개월</dd>
	 						</c:if>
	 						<c:if test="${month le 1}">
	 						<dd class="class_dd">1개월 미만</dd>
	 						</c:if>
	 						 
	 						<dt class="class_dt">최대 인원 </dt>
	 						<dd class="class_dd">${dcd.cap}명</dd>
	 						<dt class= "class_dt">강의 난이도 </dt>
	 						<dd class="class_dd">${dcd.lv} </dd>	 					
	 					</dl>
	 				</section>
	 			<!-- 강의 소개, 강사 소개 , 후기 -->
	 			<div id="main_arti">
	 				<div id="tut_div" style="padding-top:150px;">
	 				<section class="tut_intro">
	 				  <div class="name_div">
	 					<h3 class="tut_name">"${dto.id}" 강사님을
	 									  <br>
	 									 소개합니다
	 					</h3>
	 				</div>			 
	 				 <div class="sub_div">
	 				  		<div id="tuto_info_pro">
	 				  		 	<div class="pro_img">
	 				  		 	 	<c:if test="${dtt.pro eq null or dtt.pro eq ''}">
	 				  		 		<img class ="profile_img" src="${imagepath}img1.jpg">	 				  		 		
	 				  		 		</c:if>
	 				  		 		<c:if test="${dtt.pro ne null and dtt.pro ne '' }">
	 				  		 		<img class= "profile_img" src="${imagepath}${dtt.pro}">
	 				  		 		</c:if>
	 				  		 	</div>
	 				  		 	<div id="pro_text">
	 				  		 		<p class="pro_name">${dtl.email}</p>	
	 				  		 		<p >${dtl.tel }</p>			  		 		
	 				  		 	</div>
	 				  		</div>
	 				  		<div class="tut_text">
	 				  		<c:if test="${dtt.info eq null or dtt.info eq ''}"> 
	 				  			<pre class="tut_text_area">
	 				  			아
	 				  			<br>
	 				  			아
	 				  			<br>
	 				  			아
	 				  			<br>
	 				  			안녕하세요. 9년 경력의 보컬 강사 박달해 입니다.
								<br>
								"장기간의 보컬레슨이 부담스러우신 분"
								<br>
								장기 레슨 전, 보컬레슨을 경험 해 보고 싶으신 분
								<br>
								회식자리나 결혼식 축가와 같은 행사에서 부를 한 곡을 마스터 하고 싶으신 분
								<br>
								완벽한 음향장비로 나만의 노래를 레코딩 해보고 싶으신 분
								<br>
								모두 환영합니다 !
								<br>
								수강생 개개인의 상황에 따라 맟춤 커리큘럼을 바로 컨설팅하여 진행합니다.
								<br>
								또한 어려운 보컬 이론과 테크닉만 이해하다 끝나는 수업이 아닌,
								<br>
								짧은 시간 안에 이루어 낼 수 있는것이 무엇인가를 같이 고민해보고
								<br>
								최단시간동안 최대의 성취감과 즐거움, 재미를 이끌어내는 수업을 지향하고 있습니다.
								<br>
								작업실에 완비되어있는 음향장비로 수업 이후에 레코딩을 해봄으로서,
								<br>
								나의 단점과 장점을 직접적으로 듣고 느낄 수 있는 경험도 해보실 수 있습니다.
								<br>
								좋은 음악으로 좋은 인연 이어가고 싶습니다. 감사합니다.
	 				  			</pre>
	 				  			</c:if>
	 				  			<c:if test="${dtt.info ne null and dtt.info ne ''}">
	 				  				${dtt.info}
	 				  			</c:if>
	 				  		</div>
	 				  </div>	
	 				
	 				</section>
	 				
	 				</div>
	 				<div id="class_info_div" style="padding-top:150px;">
	 					<section class="tut_intro">
	 						<div class="name_div">
	 							<h3 class="tut_name">클래스 소개 </h3>
	 						</div>
	 						  <div class="sub_div">
		 						<div class="tut_text">
		 							<c:if test="${dto.con eq null or dto.con eq ''}">
		 							<pre class="tut_text_area">
		 								#진행방식
										1) 원데이 클래스 (오프라인)
											<br>
										- 다솜쌤의 1:1 정규클래스 맛보기 수업이에요
												<br>
										- [레벨테스트] + [커리큘럼 컨설팅] + [맛보기 클래스] 로 50분간 진행합니다
											<br>
										- 사전에 간단한 상담을 통해 수준과 관심사에 맞는 자료를 미리 준비해 드려요!
											<br>
										- 수업은 압구정로데오역 인근 지정 학습공간에서 진행합니다 (별도 비용X)
											<br>
										
										2) 다회차 클래스 (탈잉LIVE)
											<br>
										- 탈잉 LIVE를 통해 주 1회, 1:1로 50분간 총 4회 진행되는 다회차 수업이에요
											<br>
										- 1회차: [레벨테스트] + [커리큘럼 컨설팅] + [Getting to Know You]
											<br>
										- 2~4회차: 수강생의 수준과 학습목적에 맞는 맞춤 커리큘럼으로 진행해요
											<br>
										- 매주 부여되는 숙제와 실시간 채팅으로 일상에서도 영어공부를 계속 할 수 있어요
											<br>
										#커리큘럼 예시
											<br>
										◾ 왕기초 영어회화
											<br>
										"주말에는 보통 골프를 쳐요" -> "Weekend... usually... golf"
											<br>
										방금 이렇게 생각하신 분 손 🙌
											<br>
										한국어로 생각하고 영어로 말하면 안 된다는 건 들었는데,
											<br>
										솔직히 영어로 생각하는 것도 어렵잖아요?
											<br>
										일단 문장을 시작할 수 있게, 기본적인 문법들을 입에 딱 붙여드려요❕
											<br>
										- 시제 / 조동사 / 전치사 / 접속사 등 기본 문법을 활용한 문장 만들기
											<br>
										- 기초 영어회화 (인사하기/칭찬하기/스몰톡/취미/일상 등)
											<br>
										- 상황별 영어회화 (공항/레스토랑/카페/쇼핑몰/병원 등)
											<br>
										- 스크립트 영어회화 (자기소개/가족소개/직업소개 등)
											<br>
										◾ 일상 영어회화
											<br>
		 							</pre>
		 							</c:if>
		 							<c:if test="${dto.con ne null and dto.con ne ''}">
		 								${dto.con }
		 							</c:if>						
		 						</div>	
		 					 </div>		 				
	 					</section>	 				
	 				</div>
	 				<div id="review_div" style="padding-top:150px;">
	 					<section class="tut_rev">
	 						<div class="name_div">
	 							<h3 class="tut_name">수강생 리뷰 </h3>
	 						</div>
	 						<div class="rev_box">
	 						<!-- 여기 -->
	 						<c:forEach var="dgo" items="${dgos}">
	 						<c:if test="${dgo.re_level eq 0}">
	 						<div class="tut_rev_div">
	 							<div class="review_text">
	 								<ul>
	 									<c:if test="${dgo.count eq 1}">
	 									<li class="review_list">
	 									  <div class="rev_tute_info">
	 										<span class="tute_img">
	 											<img class = "tute_rev_img" src="${imagepath}tutee_img.jpg"/>
	 										</span>	
	 									  <div class="tute">	
	 										<div class ="rev_tut_name">
	 											<span class="tut_names">${dgo.id}</span>
	 											
	 										</div>	
	 										<div class = "rev_write_date">
	 											<p class = "write_date">${dgo.reg_date}</p> 
	 										</div>
	 										
	 									  </div>	
	 									 	<div class="tutee_rev_images">
	 											<img class="tute_rev_picture" src="${imagepath}${dgo.img}">
	 										</div>
	 									 </div>	
	 									  <div class="rev_object">
	 									  		<pre class="rev_cmt">${dgo.re}</pre>
	 									  </div>	
	 									</li>
	 									</c:if>
	 									<c:if test="${dgo.count ne 1}">
	 									<li class="review_list_no">
	 									  <div class="rev_tute_info">
	 										<span class="tute_img">
	 											<img class = "tute_rev_img" src="${imagepath}tutee_img.jpg"/>
	 										</span>	
	 									  <div class="tute">	
	 										<div class ="rev_tut_name">
	 											<span class="tut_names">${dgo.id}</span>
	 										</div>	
	 										<div class = "rev_write_date">
	 											<p class = "write_date">${dgo.reg_date}</p> 
	 										</div>
	 										
	 									  </div>	
	 									 	<div class="tutee_rev_images">
	 											<img class="tute_rev_picture" src="${imagepath}${dgo.img}">
	 										</div>
	 									 </div>	
	 									  <div class="rev_object">
	 									  		<pre class="rev_cmt">${dgo.re}</pre>
	 									  </div>	
	 									</li>
	 									</c:if>	
	 								
	 								</ul>
	 							</div>
	 						</div>
	 						</c:if>
	 						<c:if test="${dgo.re_level eq 1}">
	 						 <ul class="tutor_cmt">
	 									 		<li class="tutor_re">
	 									 			<div class="tutor_info">
	 									 			
	 									 				<span class="tutor_img">
	 									 					<img src="${imagepath}${dtt.pro}"class="tutor_pro_img">
	 									 				</span>
	 									 			
	 									 				<div class="rev_tutor_id"> 			
	 									 				     <span class="tutor_name">${dtt.id}</span>
	 									 				
	 									 					<p class="write_date">${dgo.reg_date}</p>
	 									 				
	 									 				</div>	
	 									 				<div class="tutor_rev_box">
	 									 				<pre class="tutor_txt" id="review_txt"style="font-size: 14px; line-height: 23px; word-break: break-all;">${dgo.re}</pre>	 									 				
	 									 			</div>		
	 									 			</div> 			 									 			
	 									 		</li>
	 									 	</ul>			
	 						</c:if>
	 						</c:forEach>
	 						</div>
	 					</section>
	 				</div>
	 			<div id="map_div" style="padding-top:150px;">
	 			<section class="tut_intro">		
	 				<div class="name_div">
	 					<h3 class="tut_name">강의 장소</h3>
	 				</div>	
	 			
					<div id="map" style="width:500px;height:400px;"></div>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(33.450701, 126.570667),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
						
						var geocoder = new kakao.maps.services.Geocoder();
						
						geocoder.addressSearch('${dcd.adr}', function(result, status) {
							
							if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
								
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dcd.adr}</div>'
						        });
						        infowindow.open(map, marker);
						        
						        map.setCenter(coords);
							}
						});
						</script>
			
				</section>
				</div>
	 			</div>	
 				</div>	
 		
 			
 				<div id="pay_box">
 					<div id="pay_box_in">
 						<div id="box_object">
 							<div id="box_cate" font-weight="500">카테고리 · ${dto.cate}</div>
 							<h2 id="box_title">[${dto.sub}]</h2>
 							<div id="class_state">
 								<div id="state_box">
 									<div id="state_open">
 									<c:if test="${dto.sta eq 1}">모집중</c:if>
 									<c:if test="${dto.sta eq 2}">마감</c:if>
 									<c:if test="${dto.sta eq 3}">제한됨</c:if>
 									</div>
 								</div>		
 							</div>
 							<div id="box_mid">
 								<div id="box_mprice">
 									<div id="mon_price">
 										<c:if test="${month gt 1}">
 										<h4 font-weight="700" id="m_price">월 ${dcd.pri}원</h4>
 										</c:if>
 										<c:if test="${month le 1}">
 										<h4 style="font-size: 11px;font-weight: 500; color: rgb(162, 162, 162); line-height: 20px; letter-spacing: -0.5; margin: 0px;">1개월 미만은 분할결제를 지원하지 않습니다.</h4>
 										</c:if>
 										
 										
 									</div>
 								</div>								
 							</div>
 							<div id="div_inv"></div>
 							<div id="div_hr">
 								<hr id="box_hr">
 							</div>
 							<div id="joa_div">
	 							<div id="like_div">
	 								<button type="button" id="like_btn">
	 									<div id="heart_div">
	 										<i class="fa-solid fa-heart heart_color"></i>
	 									</div>
	 									<span id="like_amount">${like}</span>
	 								</button>
	 								
	 							</div>			
	 							<div id="hidden1_div">
	 								
	 							</div>
	 							<div id="hidden2_div">
	 								
	 							</div>	
	 						</div>
	 						
	 						<div id="slide_div">
	 						
	 						<progress class="progressTag" value=0 max=100></progress>
							
	 						<!-- 
	 						<c:if test="${month gt 1 }">
	 						  <input class="range-slider_range" type="range" value="${month}" min="1" max="${month}">
	 						  <span class="result" style="font-wight:500; color:#fd3049;">${month}개월</span>
		 					</c:if>
	 						<c:if test="${month le 1}">

	 						<span class="result" style="font-wight:500; color:#fd3049;">${days}일</span>
	 						</c:if>
	 						 -->
	 						  <!-- 여기 -->
	 						  
	 						  
	 						</div>				
	 						<span id=tut_now_div" style="color:gray; font-weight:700; left:0px;" >현재${now}명</span>			
 							<div id="total_div">
 							
 						
 								<div id="total_month">
 									<div  id="month_text"></div>
 								</div>
 								
	 							<div id="box_total">
	 							
	 							 <span color="#fd3049" font-weight="700" id="total_price">${dcd.pri}원</span>
	 							
	 							
	 							</div>
	 						</div>	
	 					
	 						<section id="buy_sec">
	 						<c:if test="${memid eq  null  or memid eq ''}">
	 							<button type="button" id="buy_btn" onclick="location='loginForm.do'">
	 								결제하기	 						
	 							</button>
	 						</c:if>
	 						<c:if test="${memid ne  null  and memid ne ''}">
	 							<c:if test="${now lt dcd.cap}">
		 							<!--  <form action="payForm.do" method="post"> -->
		 							<form action="txPro.do" method="post">
		 								<input type="hidden" name="to" value="${dto.id}">
		 								<input type="hidden" name="cost" value="${dcd.pri}">
		 								<input type="hidden" name="lec_num" value="${dto.lec_num}">
		 								<input type="hidden" name="sub" value="${dto.sub}">
		 								<input type="hidden" name="coin" value="${waldto.coin}">
		 								<input type="hidden" name="cash" value="${waldto.cash}">
		 								<input type="hidden" name="adminCoin" value="${adminwaldto.coin}">
			 							<c:if test="${dto.sta ne 1}">
			 								<input type="button"id="buy_btn" value="결제하기" onclick="limitclass()">
			 							</c:if>	
		 								<c:if test="${dto.sta eq 1}">
		 									<input type="submit" id="buy_btn" value="결제하기">	 
		 								</c:if>
		 							</form>	
	 							</c:if> 
	 							<c:if test="${now eq dcd.cap}">
		 							<input type="hidden" name="month" value="" id="pay_month">
		 							<input type="hidden" name="cost" value="${m_cost}" id="cost">
		 							<input type="hidden" name="lec_num" value="${lec_num}">
		 							<input type="button" class="btn" value="수강 인원이 마감되었습니다.">			 						
	 							</c:if>							
	 						</c:if>
	 					 		 <script type="text/javascript">
								//<!--
								 var result = $(".result");
							      var slider = $(".range-slider_range");
							      var price = $("#m_price");
							      var tprice = $("#total_price");
							      var cost = $("#cost");
							      var month = $("#pay_month");
							      
							      slider.on('input', function() {
							          result.html( $(this).val()+"개월" );
							          tprice.html($(this).val()*${dcd.pri}+"원");
									  cost.attr('value',$(this).val()*${dcd.pri});						
							      	  month.attr('value',$(this).val());
							      });
							      
							      function tag () {
							    	  let progress = document.querySelector('.progressTag')
							    	  let interval = 1
							    	  let updatesPerSecond = 1000 / 60
							    	  let end = progress.max*( ${now} / ${dcd.cap} )

							    	  function animator () {
							    	    progress.value = progress.value+interval
							    	    if ( progress.value+interval< end){
							    	      setTimeout(animator, updatesPerSecond);
							    	    } else { 
							    	      progress.value = end;
							    	  
							    	    }
							    	  }

							    	  setTimeout(() => {
							    	    animator()
							    	  }, updatesPerSecond)
							    	}

							    	tag()
							      
							      
							      
								//-->
								</script>
	 						</section>
 						</div>
 					</div>
 				</div>	
 				<!-- 결제 박스 끝 -->
 	<div >

 	</div>
 	
 	</div>
 <!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 	
 <!-- 풋 블록 -->
	 <footer id="footer_div">
 
	 
	 </footer>
 </div>
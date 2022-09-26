
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="style.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script src="${project}/jquery-3.6.0.js"></script> 
<style>
.btn_modify{
	border: none;
	border-radius:2px;
	background-color:#fec9a5;
}
.btn_modify:hover{
	border: none;
	border-radius:2px;
	background-color:#fda166;
	
}
.btn_delete{
	border: none;
	border-radius:2px;
	background-color:#ff968a;
}
.btn_delete:hover{
	border: none;
	border-radius:2px;
	background-color:#ff6f61;
	
}
.btn_sta1{
	border: none;
	border-radius:2px;
	background-color:#ff8ec7;
}
.btn_sta1:hover{
	border: none;
	border-radius:2px;
	background-color:#ff0080;
	
}
.btn_sta2{
	border: none;
	border-radius:2px;
	background-color:#c67d9f;
}
.btn_sta2:hover{
	border: none;
	border-radius:2px;
	background-color:#9c446e;
	
}
.profile-card{
	background-color: rgb(255 111 97 / 83%);
    background-size: cover;
    width: 100%;
    min-height: 90px;
    border-radius: 4px;
    padding: 10px 20px;
    color: #fff;

}
.profile-photo{
	border: 7px solid #fff;
    float: left;
    margin-right: 20px;
    position: relative;
    margin-top: -5;
    height: 70px;
    width: 70px;
    border-radius: 50%;
}
.text-white{
font-size: 18px;
color: #fff!important;

}
.my_lec{
    
    font-size: 18px;
    margin-right: 15px;
    float: left;
    font-family: "Font Awesome 6 Free";
    
}
.icon1{
	color: #8dc63f;
}
.icon2{
	color:#662d91;
}
.icon3{

}
.icon4{
	color: #ee2a7b;
}
.cate_name_css{
	margin-left: 15px;
    margin-top: 3px;
}
.pro_img{
	border-radius:20px;
}
.profile{
	overflow:hidden; 
	display:flex; 
	width:100%; 
	height:100%; 
	object-fit:cover;
	transition: all 0.2s linear;
	max-width:100%;
}
.lvbox{
	position:absolute; 
	top:10px; 
	left:10px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.cbox{
	position:absolute; 
	top:10px; 
	left:80px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.sbox{
	position:absolute; 
	bottom:210px; 
	left:10px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.hebox{
	position:absolute; 
	top:15px; 
	right:15px;
	z-index:100;

}
.lv1{
	background-color:#fda166;
}
.lv2{
	background-color:#ff6f61;
}
.lv3{
	background-color:#9c446e;
}
.ca1{
	background-color:#fda166;
}
.ca2{
	background-color:#ff6f61;
}
.ca3{
	background-color:#9c446e;
}
.s1{
	background-color:#ff6f61;
}
.s2{
	background-color:#9c446e;
}
.card{
	border:none;
}
.card img{
	border-radius:20px;
}
.card:hover{
	cursor:pointer;
}
.card:hover img{
	transform:scale(1.2);
}
</style>
<div id="total_div">
<jsp:include page="header.jsp"/>
<div id="mid_div">
	<!--  사이드바 -->
	<div id="side_bar_div">
		<div id="side_bar_size">
			<div id="side_bar_pos">
				<div id="side_menu">
					<div id="side_cate">
						<div id="side_top_div">
						 <div class="profile-card">
            			<h3 class="text-white">${memid} 님</h3>
            			<h5 class="text-white">안녕하세요</h5> 
            	
            			</div><!--profile card ends-->

						</div>
						<!-- 강의 정보 -->
						<div id="side_top_div" onclick="location='myPage.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-list-alt icon1 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">내 강의</span>
									</div>
								</div>
							
							</div>
						</div>
						<!-- 강의 정보 -->
						<div id="side_top_div" onclick="location='refundRequest.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-list-alt icon1 my_lec" style="color:red;"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">취소현황</span>
										
									</div>
								</div>
							
							</div>
						</div>
						<!-- 내정보 관리 -->
							<div id="side_top_div" onclick="location='modifyForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-users icon2 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">내 정보 수정</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!-- 리뷰 관리 -->
							<div id="side_top_div" onclick="location='reviewForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-pen-to-square icon3 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">리뷰 관리</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!--찜목록 -->	
						<div id="side_top_div" onclick="location='likeListForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-heart cc_pink icon4 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">찜목록</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						
						<!--전자지갑 메뉴 -->	
						<div id="side_top_div" onclick="location='walletPage.do'">

						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-wallet icon5 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">내 전자지갑</span>
									</div>
								</div>
							
							</div>						

						</div>
						
						
					</div>
				</div>
				<div id="side_line">				
				</div>
			</div>
		</div>	
	</div>
 <!-- 사이드바 -->	
 <script type="text/javascript">
 	if(${check}===0){
 		alert('이미 접수되었습니다.');
 	}else if(${check}===1){
 		alert('신청이 완료되었습니다.');
 	}
 </script>
	<div id="tutor_div" >
		<div id="tutor_main_article" >
			<div id="tutor_main_margin">
				<div id="tutor_top_topic">
					<h3 class="topic">취소 강의 현황</h3>
				</div>
				<div id="table_div" style="    box-sizing: border-box;">
					<table class="tutor_table">
						<tr style="border-bottom:solid 1px lightgrey" >
							<th style="width:15%">접수번호</th>
							<th>강의정보</th>
							<th>취소 신청일</th>
							<th>처리 완료일</th>
							<th>상태</th>
						</tr>
						<c:forEach var="dto" items="${dtos}">
							<tr>
							<th style="width:15%">${dto.ref_num}</th>
							<th><input type="button" value="더보기" onclick="location='classForm.do?lec_num=${dto.lec_num}'"></th>
							<th>${dto.reg_date}</th>
								<c:if test="${dto.sta eq 0}">
								<th></th>
								<th><span>신청접수</span></th>
								</c:if>
								<c:if test="${dto.sta eq 1}">
								<th>${dto.fin_date}</th>
								<th><span>신청완료</span></th>
								
								</c:if>
							</tr>
						</c:forEach>					
					</table>	
				</div>
			</div>
			
		</div>

	
</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 
								
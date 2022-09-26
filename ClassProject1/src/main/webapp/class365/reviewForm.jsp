
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">   
<link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script src="${project}/jquery-3.6.0.js"></script> 

<script>
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  });
	}

</script>

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
.review_div{
	width:100%;
	padding-left: 10px;
    padding-right: 10px;

}
#totla_select{
width: 100%;
 
    margin-left: 20px;
    margin-top: 20px;
}
#rev_arti{
 height:auto;
 display: flex;
 margin-left: 20px;
 margin-top: 20px;
}
.rev_box{
	padding-top:30px;
	padding-bottom:30px;
	border-top: solid 1px lightgrey;
	border-bottom: solid 1px lightgrey;
	display : flex;
	width: 100%;
}
.lec_pic{
	 width: 250px;
	 height: 200px;
	 align-items: center;
}
.picture{
	overflow: hidden;
    width: 100%;
    height: 100%;
   
}
.div_subs{
	padding-left:70px;
	
}
.lec_sub{
	
}
.rev_select{
margin-top:3px;
}
.tetee_rev{
background-color: snow;
}
.tutee_rev_div{
padding-top:20px;
}
.lec_nam_wrap{
	display: flex;
	justify-content: space-between;
	width:100%;
}
.btn_div{
float:right;
margin-right:20px;
margin-top:20px;
}
.rev_btn{
	background-color: #ff6f61!important;
    border: none !important;
    color: white;
}
.rev_obj{
	margin-top: 8px;
}
#review_btn,#review_ok{

float:right;
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
	<div id="tutor_div">

		<div id="tutor_main_article">
			<div id="tutor_main_margin">
			
				<div id="tutor_top_topic">
					<h3 class="topic">리뷰 관리</h3>
					</div>
					<!-- 
					<div id="totla_select">
					
							<button type="checkbox" id="total_check_box" value="selectall" onclick="selectAll(this)" >
							<span style="margin-left:10px;"> 게시물 전체선택</span>
							</button>
						</div>
					 -->						
					<c:forEach var="dto" items="${dtos}">
		
					<div class="review_div">
						<form method="post" action="reviewPro.do">
	
						<div id="rev_arti">
							<div class="rev_box">
								<div class="lec_pic">
									<img src="${imagepath}${dto.thu}" class="picture">
								</div>
								<div class="div_subs">
								  <div class="lec_nam_wrap">	
									<div class="lec_sub">
										<a href="classForm.do?lec_num=${dto.lec_num}" style="font-size:25px; text-decoration:none!important; color:black;">${dto.sub}</a>		
									 <div  class="mx-auto"  style="width: 300px; margin-top: 20px!important; margin-left:0 ;">
						                   <c:if test="${dto.re_num ne 0 }">
						                   <div  id="thumb_container" style="height: 150px;">
						                  
						                   <c:if test="${dto.img eq null or dto.img eq ''}">
						                    <div id="image_container"class="d-flex justify-content-center align-items-center rounded" style="height: 150px;background-color: rgb(233, 236, 239);">
				                      			<span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">300x150</span>
						                   	</div>   
						                   	</c:if> 
						                   	<c:if test="${dto.img ne null and dto.img ne ''}">
						                   	<img src="${imagepath}${dto.img}" class="picture">
						                   	</c:if>
						                    </div>
						                    </c:if>
						                  </div> 			
										</div>								
									</div>									
									<c:if test="${dto.re_num ne 0}">
									<div class=tutee_rev_div>
									<div class=tetee_rev>
										 <div class="rev_tute_info">		
	 									  <div class="tute">	
	 										<div class ="rev_tut_name">
	 											<span class="tut_names">${dto.id} :</span>
	 										</div>	
	 										<div class = "rev_write_date">
	 										  <p class = "write_date">${dto.reg_date}</p> 
	 										</div>
	 									  </div>	
	 									 
	 									 </div>	
	 									 <div class="rev_object">					  										  
											<textarea name="modify" rows="6" id="review_text" style="width:700px;height:auto; background:none;" disabled="disabled">${dto.re}</textarea>		  			 									  		
	 									  </div>	
	 									  <div class="btn_div">
	 									  	 <input class="rev_btn " id="modify_btn" type="button" value="수정하기" onclick="location='reviewModifyForm.do?re_num=${dto.re_num}'">
	 									  	 <input class="rev_btn " id="modify_btn" type="button" value="삭제하기" onclick="location='reviewDeleteForm.do?re_num=${dto.re_num}'">								  	 								 
	 									  </div>
									</div>
								</div>	

								
								
									</c:if>
									<c:if test="${dto.re_num eq 0}">
										 <div class="rev_obj">					  										  
												  			 									  		
	 									  </div>	
										<input class="rev_btn" id="review_btn" type="button" value="리뷰작성" onclick="location='reviewWrite.do?lec_num=${dto.lec_num}'">									
									</c:if>
									
								  </div>	
								
								</div>
								
								
								
								
								
							</div>
						
						 </form>
						</div>
						
						</c:forEach>	
					</div>
			
				</div>
	
		</div>			
	  <div id="tutor_div_space"></div>
	</div>
</div>


<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">   
<link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script src="${project}/jquery-3.6.0.js"></script> 

<script type="text/javascript">
//사진미리보기

function setThumbPreview(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      $("#thumb_container *").remove();
      document.querySelector("div#thumb_container").appendChild(img);
      $("img").addClass("profile_r");
    };
	
    reader.readAsDataURL(event.target.files[0]);
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
.rev_cont{
	margin-top: 8px;
}
#review_btn,#review_ok{
	float:right;
	display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    margin-top: 15px;
    width: 100px;
}
.profile_r{
	overflow:hidden; 
	display:flex; 
	width:100%; 
	height:100%; 
	object-fit:cover;
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
            			<h5 class="text-white">${memid} 님</h5>
            			<h5 class="text-white">안녕하세요</h5>
            	
            			</div><!--profile card ends-->

						</div>
						<!-- 강사 정보 -->
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
						<!-- 클래스 관리 -->
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
						<!-- 회원 탈퇴 -->	
							<div id="side_top_div" onclick="location='deleteForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-user icon4 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">회원 탈퇴</span>
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
					<h3 class="topic">리뷰 수정</h3>
					</div>
					<div class="review_div">
						<form method="post" action="reviewModifyPro.do" enctype="multipart/form-data">						
						<input type="hidden" name="re_num" value="${re_num}">
						<input type="hidden" name="dto" value="${dto}">					
						<div id="rev_arti">
							<div class="rev_box">
								<div class="div_subs">
									 <div class="thumb_img">
						              <h5>리뷰 사진</h5>
						              <div class="row">
						                <div class="col-12 col-sm-auto mb-3">
						                  <div  class="mx-auto"  style="width: 300px;">
						                   
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
						                    
						                  </div> 
						                </div>
						                </div>
						                <div class="row">
						                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
						                  <div class="text-center text-sm-left mb-2 mb-sm-0">
						                    <div class="mt-2">
						                     <label class="btn btn-primary" for="file2">             
						                        <i class="fa fa-fw fa-camera"></i>               
						                        <span>리뷰사진 업로드</span>
						                     </label>
						                      <input style="visibility:hidden;"accept="image/*" type="file" id="file2"name="img"
						                       onchange="setThumbPreview(event);">
						                    </div>
						                  </div>
						                </div>
						              </div>
				                      </div>
									<div class=tutee_rev_div>
									<div class=tetee_rev>	
	 									 <div class="rev_cont">	
	 									 <c:if test="${dto.re ne null or dto.re ne '' }">				  										  
											<textarea name="Re" rows="6" id="review_text" style="width:800px;height:auto; background-color: #d3d3d336;"required="required">${dto.re}</textarea>		  			 									  		
	 									  </c:if>
	 									  </div>							
									</div>
								</div>			
										 <div class="rev_obj">					  										  				  			 									  		
	 									  </div>	
										<input class="rev_btn" id="review_btn" type="submit" value="리뷰수정">									
									
									
								  </div>	
								
								</div>
								
								
								
								
								
							</div>
						
						 </form>
						</div>
		
					</div>
			
				</div>
			
		
			
		</div>
		
			
	  <div id="tutor_div_space"></div>
	</div>
</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 


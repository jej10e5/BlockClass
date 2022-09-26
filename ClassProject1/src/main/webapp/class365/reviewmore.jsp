
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">   
<link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
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
<div class="review_div">
	<div id="rev_arti">
		<div class="rev_box">
			<div class="div_subs">
			  <div class="lec_nam_wrap">	
				<div class="lec_sub">
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
	 									  	 <input class="rev_btn " id="modify_btn" type="button" value="삭제하기" onclick="location='reviewDeleteForm.do?re_num=${dto.re_num}'">								  	 								 
	 									  </div>
									</div>
								</div>	
	                    
	                    </c:if>
	                  </div> 			
					</div>								
				</div>									
			</div>
		</div>
	</div>
</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 


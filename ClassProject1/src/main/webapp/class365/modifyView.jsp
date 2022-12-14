<%@page import="lecmem.LecmemDataBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@page import="lecture.LectureDataBean"%>
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
</style>
<div id="total_div">
<jsp:include page="header.jsp"/>
<div id="mid_div">
	<!--  ???????????? -->
	<div id="side_bar_div">
		<div id="side_bar_size">
			<div id="side_bar_pos">
				<div id="side_menu">
					<div id="side_cate">
						<div id="side_top_div">
						 <div class="profile-card">
            			<h5 class="text-white">${memid} ???</h5>
            			<h5 class="text-white">???????????????</h5>
            	
            			</div><!--profile card ends-->

						</div>
						<!-- ??? ?????? -->
						<div id="side_top_div" onclick="location='myPage.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-list-alt icon1 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">??? ??????</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!-- ????????? ?????? -->
							<div id="side_top_div" onclick="location='modifyForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-users icon2 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">??? ?????? ??????</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!-- ?????? ?????? -->
							<div id="side_top_div" onclick="location=''">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-pen-to-square icon3 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">?????? ??????</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!-- ?????? ?????? -->	
							<div id="side_top_div" onclick="location='deleteForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa fa-user icon4 my_lec"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">?????? ??????</span>
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
 <!-- ???????????? -->	
	<div id="tutor_div">
	
		<div id="tutor_main_article">
			<div id="tutor_main_margin">
			
				<div id="tutor_top_topic">
					<h3 class="topic" ">??? ?????? ??????</h3>
					
				</div>
				<div id="table_div">
					<div class="signup-form" style="width:400px;">
			    <form action="modifyPro.do" method="post">
					<h2>??? ??? ??? ???</h2>
					<p class="hint-text" style="visibility:hidden;">??????????????????</p>
			        <div class="form-group">
			        	<input type="text" class="form-control" name="id" value="${memid}"  readonly="readonly">
			        </div>
					<div class="form-group">
			            <input type="password" class="form-control" name="passwd" value="${dto.passwd}" placeholder="????????????" required="required">
			        </div>
					<div class="form-group">
			            <input type="password" class="form-control" name="confirm_password" value="${dto.passwd}" placeholder="???????????? ??????" required="required">
			        </div>  
			        <div class="form-group">
			        	<input type="email" class="form-control" name="email" value="${dto.email}" placeholder="?????????" required="required">
			        </div>   
			        <div class="form-group">
			        	<input type="tel" class="form-control" name="tel" value="${dto.tel}" placeholder="????????????" required="required">
			        </div>    
			        <div class="form-group">
						<label class="form-check-label"><input type="checkbox" required="required">  ???????????? ?????? </label>
					</div>
					<div class="form-group">
			            <button type="submit" class="btn btn-success btn-lg btn-block">????????????</button>
			        </div>
			    </form>
				<div class="text-center">
	
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
 


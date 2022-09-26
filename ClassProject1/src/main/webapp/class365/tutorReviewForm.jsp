<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="style.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
 <link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
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
.tutee_review_img{
	width: 100%;
    height: 100%;
    object-fit: cover;
}
.review_img_list{
	margin-bottom: 15px;
    width: 100%;
    margin-left: 30px;
}
.review_img_list li{
 	display: inline-block !important;
    overflow: hidden;
    
    margin-left: 7px;
    height: 100px;
    padding: 0 !important;
    border-radius: 6px;
    cursor: pointer;
}
.tutor_cmt {
margin-left: 70px;
list-style:none;
}

.tutor_re{
list-style:none;

}
.tutor_info{
display: flex;

}

.tutor_img{
display: table-cell;
    width: 30px;
    height: 30px;

}

.tutor_pro_img{
 border-radius: 50%;
    width: 100%;
    height: 100%;
   object-fit: cover;
    object-position: center;
}
.rev_tutor_id{
 position: relative;
    width: 100%;
    padding-left: 20px;
}
.tutor_name{
display: inline-block;
    margin-top: 4px;
    font-weight: 500;
background-size: 14px 14px;
padding-right: 22px;
}
.rev_date{
 margin-top: 6px;
    line-height: 19px;
    color: #999;
}
.tutor_rev_box{
 
 margin: 8px 0 0 72px;
 padding: 17px 19px;
    border-radius: 0 10px 10px 10px;
}

.tutor_txt{
 font-size: 14px;
    line-height: 23px;
    word-break: break-all;
}
.review_list_tutee{
	display: block;
    list-style: none;
}
.rev_cmt{
	background-color: lightgrey;
    width: 100%;
    height: 150;

}
.tutor_btn_box{
float:right;
}
.review_object{
	margin: 8px 0 0 72px;
    margin-top: 8px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 72px;
    display: flex;
    flex-direction: row;
    align-items: center;
}
.rev_tutor_info{
	list-style: none;
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
						
						<!-- 강사 정보 -->
						<div id="side_top_div" onclick="location='tutorInfoForm.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-chalkboard-user icon_pos"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">강사 정보</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						<!-- 클래스 관리 -->
							<div id="side_top_div"onclick="location='tutorMain.do'" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-school icon_pos"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">강의 관리</span>
									</div>
								</div>
							
							</div>
					
						</div>
						<!-- 리뷰 관리 -->
							<div id="side_top_div"onclick="location='tutorReviewMain.do'">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-pen-to-square icon_pos"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">리뷰 관리</span>
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
						<div id="review_div" style="padding-top:20px; width:100%;">
	 					<section class="tut_intro">
	 						<div class="tut_rev_div"style="width:100%">
	 							<div class="review_text">
	 								<ul>
	 									<c:forEach var="dgo" items="${dgos}" varStatus="status">
	 									<li class="review_list_tutee">
	 									<!-- 튜티의 리뷰 무조건 출력  -->
	 									<c:if test="${dgo.re_level eq 0}">
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
	 									 
	 									 </div>
	 									
	 									  <div class="review_object">
	 									  		<pre class="rev_cmt">${dgo.re}
	 									  		</pre>
	 									  		<ul class="review_img_list">
	 									  			<li>
	 									  			<img src="${imagepath}${dgo.img}"class="tutee_review_img" >
	 									  			</li>
	 									  		</ul>
	 									  </div>
	 										</c:if>
	 									  
	 									  							   
	 									 	
	 									 
	 									 	
	 									 	<!-- 강사의 리뷰 답글이 없을 경우 -->		 	
	 									 	<c:if test="${dgo.re_level eq 0 and dgo.count eq 1}">
	 									 	<ul class="tutor_cmt">	 									 	
	 									 		<li class="tutor_re"style="border-bottom:none!important;">
	 									 		<form method="get" action="tutorReviewPro.do" name="form"${status.index}>	
	 									 		<input type="hidden" name="gr" value="${dgo.gr}">
	 									 		<input type="hidden" name="lec_num" value="${dgo.lec_num}">	 									 		 									 		
	 									 		<div id="re_box${status.index}">
	 									 			<div class="tutor_rev_box">
	 									 				<textarea name="re" class="tutor_txt" id="review_text${status.index}" style="display:none; background-color: #ffe5ec; width:100%; height:300;"placeholder="답글을 입력하세요."></textarea>
	 									 			</div>	
	 									 			
	 									 			<div class="tutor_btn_box">					 			
	 									 			<input type="button" id="review_btn${status.index}"name="review_btn${status.index}" value="답글작성">
	 									 			<input type="button" onclick="submit()" id="review_ok${status.index}" style="display:none;"value="답글저장"/>
	 									 			</div>				 									 				 					 				 									 		
	 									 		</div>
	 									 		</form>
	 									 	  </li>
	 									 	</ul>
	 									 	</c:if>
	 									 	<!-- 강사의 답글이 달려있을 경우 -->
	 									 	<c:if test="${dgo.re_level eq 1 and dgo.count eq 2}">
	 									 	<ul class="tutor_cmt">
	 									 		<li class="rev_tutor_info">
	 									 			<div class="tutor_info">
	 									 			
	 									 				<span class="tutor_img">
	 									 					<img src="${imagepath}${tutorpro}"class="tutor_pro_img">
	 									 				</span>
	 									 			
	 									 				<div class="rev_tutor_id"> 			
	 									 				     <span class="tutor_name">${tutorid}</span>
	 									 				<c:if test="${ dgo.re_level eq 1}">
	 									 					<p class="write_date">${dgo.reg_date}</p>
	 									 				</c:if>
	 									 				</div>		
	 									 			</div> 			 									 			
	 									 		</li>
	 									 	</ul>
	 									 	<ul class="tutor_cmt">	 								 	
	 									 		<li class="tutor_re">
	 									 		<form method="post" action="tutorReviewModifyPro.do" name="form"${status.index}>	
	 									 		<input type="hidden" name="re_num" value="${dgo.re_num}"> 
	 									 		<input type="hidden" name="lec_num" value="${dgo.lec_num}">								 									 		 									 		
	 									 		<div id="re_box${status.index}">
	 									 			<div class="tutor_rev_box">
	 									 				<pre class="tutor_txt" id="review_txt${status.index}"style="background-color: #ffe5ec; height:150px;">${dgo.re}</pre>
	 									 				<textarea name="re" class="tutor_txt" id="review_text${status.index}" style="display:none; background-color: #ffe5ec; width:100%; height:150;">${dgo.re}</textarea>
	 									 			</div>			
	 									 			<div class="tutor_btn_box">					 			
	 									 			<input type="button" id="review_btn${status.index}"name="review_btn${status.index}" value="답글수정">
	 									 			<input type="button" onclick="submit()" id="review_ok${status.index}" style="display:none;"value="답글저장"/>
	 									 			</div>								 									 		
	 									 		</div>
	 									 		</form>
	 									 	  </li>
	 									 	</ul>
	 										</c:if>
>	 									</li>
	 									</c:forEach>
	 								</ul>
	 								<script type="text/javascript">
	 							
	 								$("input[name^='review_btn']").on("click", function(e) {	
	 									var num = $(this).attr('id'); 
	 									var fullStr = num;
	 									var lastChar = fullStr.charAt(fullStr.length-1);
	 										
	 										$("#review_txt"+lastChar).hide();
	 										$("#review_text"+lastChar).show();
											 $("#review_ok"+lastChar).show();
											 $(this).hide();
								
											 
										 });
	 								 
	 								  function submit() {
	 									 	var num = $(this).attr('id'); 
		 									var fullStr = num;
		 									var lastChar = fullStr.charAt(fullStr.length-1);
	 									  	document.forms["form"+lastChar].submit();
	 									  
	 								  }								
									</script>
	 							</div>
	 						</div>
	 					</section>
	 				</div>	
					</div>
			
				</div>
	
		</div>			
	  <div id="tutor_div_space"></div>
</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 


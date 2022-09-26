
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="style.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script src="${project}/jquery-3.6.0.js"></script> 
<script type="text/javascript">
function checktutee(lec_num){
	url="checktutee.do?lec_num="+lec_num;
	open( url, "checktutee", "scrollbar=no, menubar=no, status=no, width=600, height=600" ); //새창띄우기
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
							<div id="side_top_div"onclick="location='tutorMain.do'">
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
	<div id="tutor_div" >
		<div id="tutor_main_article" >
			<div id="tutor_main_margin">
			
				<div id="tutor_top_topic">
					<h3 class="topic">리뷰 관리</h3>
					
					
					
				</div>
				<div id="table_div" >
					<table class="tutor_table">
						<tr style="border-bottom:solid 1px lightgrey" >
							<th style="width:15%">강좌명</th>
							<th>강의번호</th>
							<th >좋아요 개수</th>
							<th>리뷰 개수</th>
							<th></th>
						</tr>
						<c:forEach var="dlo" items="${dlos}">
						<tr>
							<th style="width:15%">${dlo.sub}</th>
							<th>${dlo.lec_num}</th> 
							<th>${dlo.totlike}</th>
							<th>${dlo.totreview}</th>
							<c:if test="${dlototreview ne 0}">
							<th><input class="btn_modify" type="button" value="리뷰관리하기" 
							onclick="location='tutorReviewForm.do?lec_num=${dlo.lec_num}'"></th>
							</c:if>
							<c:if test="${dlototreview eq 0}">
							<th><input class="btn_modify" type="button" value="리뷰가없습니다" 
							onclick="location=''"></th>
							</c:if>
							<th>						
						</tr>						
						</c:forEach>					
					</table>	
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
 


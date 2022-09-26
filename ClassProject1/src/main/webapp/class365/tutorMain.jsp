
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
							<div id="side_top_div" >
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
	<c:if test="${tutorInfo ne 0}">
		<div id="tutor_main_article" >
			<div id="tutor_main_margin">
			
				<div id="tutor_top_topic">
					<h3 class="topic">강의</h3>
					
					<a href="createClassForm1.do" style="color:inherit;">
						<button id="make_class_btn">
							<span id="inher_span">
								<span id="btn_icon_span">
									<i class="fa-solid fa-plus"></i>
								</span>
								<div style="width:6px; height:0px;"></div>
								<span id="btn_subject"> 강의 만들기</span>
							</span>
						</button>					
					</a>
					
				</div>
				<div id="table_div" >
					<table class="tutor_table table table-hover">
						<tr style="border-bottom:solid 1px lightgrey" >
							<th style="width:15%">강좌명</th>
							<th>상태</th>
							<th >카테고리</th>
							<th>난이도</th>
							<th>시작일</th>
							<th>마지막일</th>
							<th>가격</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach var="dto" items="${dtos}">
						<tr>
							<th style="width:15%">${dto.sub}</th>
							<th>
								<c:if test="${dto.sta eq 0}">
								작성중
								</c:if>
								<c:if test="${dto.sta eq 1}">
								모집중
								</c:if>
								<c:if test="${dto.sta eq 2}">
								마감
								</c:if>
								<c:if test="${dto.sta eq 3}">
								제한됨
								</c:if>
								<c:if test="${dto.sta eq 4}">
								검토중
								</c:if>
								<c:if test="${dto.sta eq 5}">
								보류됨
								</c:if>
							</th>
							<th>${dto.cate}</th> 
							<th>${dto.lv}</th>
							<th>${dto.be}</th>
							<th>${dto.fin}</th>
							<th>${dto.pri}</th>
							
							<c:if test="${dto.sta eq 0}">
								<th><input class="btn_modify" type="button" value="수정하기" 
								onclick="location='modifyClass.do?lec_num=${dto.lec_num}'"></th>
								<th><input class="btn_delete"type="button"
								onclick="location='deleteClass.do?lec_num=${dto.lec_num}'" 
								value="삭제하기"></th>
							</c:if>
							
							<c:if test="${dto.sta eq 4 or dto.sta eq 5}">
								<th>
								<input class="btn_modify" type="button" value="수정하기" 
								onclick="location='modifyClass.do?lec_num=${dto.lec_num}'">
								</th>
								<th>
								<input class="btn_delete"type="button"
								onclick="location='deleteClass.do?lec_num=${dto.lec_num}'" 
								value="삭제하기">
								</th>
							</c:if>
							
							
							<c:if test="${dto.sta eq 1}">
								<th><input class="btn_sta1" type="button"
								onclick="location='inactiveClass.do?lec_num=${dto.lec_num}'"
								value="마감하기"></th>
								<th><input class="btn_sta1" type="button"
								onclick="checktutee(${dto.lec_num})"
								value="수강생"></th>
							</c:if>
							<c:if test="${dto.sta eq 2}">
								<th><input class="btn_sta2" type="button"
								onclick="location='activeClass.do?lec_num=${dto.lec_num}'"
								value="모집하기"></th>
								<th><input class="btn_sta1" type="button"
								onclick="checktutee(${dto.lec_num})"
								value="수강생"></th>
							</c:if>
							<c:if test="${dto.sta eq 3}">
								<th></th>
								<th>제제됨</th>
							</c:if>

						</tr>
							
						</c:forEach>					
					</table>	
				</div>
			</div>
			
		</div>
		</c:if>
		<c:if test="${tutorInfo eq 0}">
		<div style="padding:5%;">
			<h5>Class만들기가 처음이신가요?</h5>
			<h5>튜터 정보를 먼저 등록해주세요!</h5>
			<input class="btn" type="button" value="튜터 정보 등록하기" onclick="location='tutorInfoForm.do'">

		</div>
		</c:if>
			
	  <div id="tutor_div_space"></div>
	</div>
</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 


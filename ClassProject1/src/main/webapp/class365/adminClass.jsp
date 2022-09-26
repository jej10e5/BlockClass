<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<script type="text/javascript">
function checktutee(lec_num,id){
	url="checktutee.do?lec_num="+lec_num;
	open( url, "checktutee", "scrollbar=no, menubar=no, status=no, width=600, height=600" ); //새창띄우기
}
</script> 
<style>
.btn_info{
	border: none;
	border-radius:2px;
	background-color:lightgray;
}
.btn_info:hover{
	border: none;
	border-radius:2px;
	background-color:gray;
	
}
.btn_confirm{
	border: none;
	border-radius:2px;
	background-color:#ff968a;
}
.btn_confirm:hover{
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
.cate_div{
	font-size: 1rem;
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
					
						<!-- 환불 정보 -->
						<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminMainForm.do'">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-chalkboard-user icon_pos"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">환불현황</span>
									</div>
								</div>
							
							</div>
					<!-- 회원 정보 -->
						<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminMember.do'">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">
										<i class="fa-solid fa-bell icon_pos"></i>
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">회원현황</span>
									</div>
								</div>
							
							</div>
					
						
						</div>
						
						</div>
						<!-- 생성요청 관리 -->
							<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminConfirm.do'">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">
										<i class="fa-solid fa-check-to-slot icon_pos"></i>								
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">검토 요청</span>
									</div>
								</div>
							
							</div>
						
						</div>
						<!-- 클래스 관리 -->
							<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminClass.do'">
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
							<div id="side_top_div">
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminReview.do'">
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
						
						<!-- 코인 충전 관리 -->
						<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='adminCoin.do'">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">

										<i class="fa-solid fa-wallet icon_pos"></i>
									
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">코인 충전 관리</span>
									</div>
								</div>
							
							</div> 
						</div>
						
						<!-- 관리자 페이지 나가기 -->
							<div id="side_top_div" >
						<div style="height: 4px; display : flex;">	</div>
							<div class="cate_div" onclick="location='logout.do'">
								<div class="cate_subject">
									<div class="cate_space">
										<span class="cate_icon">
										<i class="fa-solid fa-door-open icon_pos"></i>
										</span>
										<div class="cate_icon_space"></div>
										<span class="cate_name_css">나가기</span>
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
					<h3 class="topic">강의 현황</h3>
					
				</div>
				<div id="table_div" >
					<table class="tutor_table">
						<tr style="border-bottom:solid 1px lightgrey" >
							<th style="width:7%">강의번호</th>
							<th style="width:15%">강좌명</th>
							<th>튜터</th>
							<th>상태</th>
							<th >카테고리</th>
							<th>난이도</th>
							<th>시작일</th>
							<th>마지막일</th>
							<th>가격</th>
							<th>강의정보</th>
							<th>수강생</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<c:forEach var="dto" items="${dtos}">
						<tr>
							<th style="width:7%">${dto.lec_num}</th>
							<th style="width:15%">${dto.sub}</th>
							<th>${dto.id}</th>
							<th id="staresult${dto.lec_num}">
							<div id="sta${dto_lec_num}"></div>
								<c:if test="${dto.sta eq 1}">
								모집중
								</c:if>
								<c:if test="${dto.sta eq 2}">
								마감
								</c:if>
								<c:if test="${dto.sta eq 3}">
								제한됨
								</c:if>
							</th>
							<th >${dto.cate}</th> 
							<th>${dto.lv}</th>
							<th>${dto.be}</th>
							<th>${dto.fin}</th>
							<th>${dto.pri}</th>
							<th><input type="button" class="btn_info"value="더보기" 
							onclick="location='classForm.do?lec_num=${dto.lec_num}'"></th>
							<th><input class="btn_info" type="button"
								onclick="checktutee(${dto.lec_num})"
								value="수강생"></th>
							<th style="padding-top:12px;">
							<c:if test="${dto.sta ne 3}">
							<div id="result${dto.lec_num}"></div>
							<form id="btnform${dto.lec_num}">
								<input type="hidden" name="lec_num" value="${dto.lec_num}">
								<input name="ACbtn/hide/${dto.lec_num}" class="btn_sta2"
								type="button"value="숨기기">
							</form>
							</c:if>
							<c:if test="${dto.sta eq 3}">
							<div id="result${dto.lec_num}"></div>
							<form id="btnform${dto.lec_num}">
								<input type="hidden" name="lec_num" value="${dto.lec_num}">
								<input name="ACbtn/show/${dto.lec_num}" class="btn_sta1" 
								type="button" value="보이기">
							</form>
							</c:if>
							</th>
						</tr>
							
						</c:forEach>	
				
					</table>	
					
					<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			$("input[name^='ACbtn']").on(
				"click",
				function( event ) {
					var idstr =$(this).attr('name');
					var sta=idstr.split('/')[1];
					var num=idstr.split('/')[2];
					$.ajax(
						{
							type : "POST",
							url : (sta=='hide') ? "hideClass.do" : "showClass.do",
							/*data : params,*/
							/*data : {
								name : name,
								age : age
							},*/
							data : $("#btnform"+num).serialize(),
							dataType : "text",
							success : function( data ) {
								console.log(data);
								$("#btnform"+num).remove();
								$("#result"+num).html(data);
								$("#sta"+num).remove();
								$("#staresult"+num).html( (sta=='hide') ? '제한됨':'마감');
	
							},
							error : function(  ) {
								alert("강의 숨기기 실패");
							}
						}		
					)
					
				}
						
			);
			
		}	
	);	



</script>	
				</div>
			</div>
			
		</div>
		</c:if>
		
	</div>
</div>
</div>








<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

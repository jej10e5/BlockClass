
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/tutorMain_style.css" rel="stylesheet" type="text/css"> 
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>

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
							<div id="side_top_div" >
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
		<div id="tutor_main_article" >
			<div id="tutor_main_margin">
			
				<div id="tutor_top_topic">
					<h3 class="topic">강의 검토 현황</h3>
					
				</div>
				<div id="table_div" >
					<table class="tutor_table">
						<tr style="border-bottom:solid 1px lightgrey" >
							<th style="width:15%">강의번호</th>
							<th>신청자</th>
							<th>강의정보</th>
							<th>상태</th>
							<th>요청</th>
						</tr>
						<c:forEach var="dto" items="${dtos}">
							<tr>
							<th style="width:15%">${dto.lec_num}</th>
							<th>${dto.id}</th>
							<th><input type="button" class="btn_info"value="더보기" onclick="location='classForm.do?lec_num=${dto.lec_num}'"></th>
							<th>
							<div id="sta${dto.lec_num}">
							<c:if test="${dto.sta eq 4}">생성요청</c:if>
							<c:if test="${dto.sta eq 5}">보류</c:if>
							</div>
							<div id="staresult${dto.lec_num}"></div>
							</th>
							<c:if test="${dto.sta eq 4}">
								<form id="confirmform${dto.lec_num}">
									<input type="hidden" name="lec_num" value="${dto.lec_num}">
								</form>
								<th><input name="btncon_ok_${dto.lec_num}" type="button" value="신청확인"></th>
								<th><input name="btncon_re_${dto.lec_num}" type="button" value="신청보류"></th>
							
							</c:if>
							<c:if test="${dto.sta eq 5}">
							<th>
							</th>
							</c:if>
							</tr>
						</c:forEach>					
					</table>	
				</div>
			</div>
			
		</div>
</div>
</div>
</div>
<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			$("input[name^='btncon']").on(
				"click",
				function( event ) {
					var idstr =$(this).attr('name');
					var sta=idstr.split('_')[1];
					var num=idstr.split('_')[2];
					$.ajax(
						{
							type : "POST",
							url : (sta=='ok')?"accept.do":"deny.do",
							data : $("#confirmform"+num).serialize(),
							success : function() {
								console.log('성공');
								$("#confirmform"+num).remove();
								$("#sta"+num).remove();
								$("#staresult"+num).html( (sta=='ok') ? '승인':'보류');
								window.document.location.reload();
							},
							error : function(  ) {
								alert("요청 및 보류 승인 실패");
							}
						}		
					)
					
				}
						
			);
			
		}	
	);	
</script>	

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 
							
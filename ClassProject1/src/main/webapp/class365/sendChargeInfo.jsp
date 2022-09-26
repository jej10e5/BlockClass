<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>

<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${project}/walletPage.css" rel="stylesheet" type="text/css">
<script src="${project}/jquery-3.6.0.js"></script>
<script defer src="${project}/walletScript.js"></script>

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
		
		<!-- 충전 정보 전송 부분 -->
		<div class="container" style="margin-left:280px;">
			<div class="my_wallet_title">
				<h3>해당 충전이 완료되었습니다.</h3>
				<button class="send_tx_info"><i class="fa-solid fa-circle-check"></i></button>
			</div>
			
			<div id="buyer">${txdto.buyer}</div>
			<div id="seller">${txdto.seller}</div>
			<div id="item">${txdto.item}</div>
			<div id="price">${txdto.price}</div>
		</div>
		<div id="test"></div>
	
	</div>
</div>


<script type="text/javascript">
// 여기에서 fetch로 정보 전송하기
</script>
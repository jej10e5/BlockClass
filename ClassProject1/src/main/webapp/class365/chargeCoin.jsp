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
							<!-- 취소 현황 -->
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
		<div class="section">
			<div class="section_container-1">
				<div class="about_wallet">
					<div class="currency__set">
		               <div class="currency__left">
		                   <h3>Moon Stone</h3>
		                   <p>The <b>Moon Stone</b> token is traded on<br/>
		                       the CLASS 365 platform, which Online-Edu Service.<br/>
		                       Secure, fast and with extremely low class fees,<br/>
		                       you'll be earning rewards in our platform!
		                   </p>
		               </div>
		               <div class="currency__right">
		                   <img src="/ClassProject/walletImg/moonstone.png" width="300" height="200"/>
		               </div>
		           	</div>
				</div>
			</div>
			<div class="section_container-2">
				<p>현재 보유 캐쉬는 ${waldto.cash} 원 입니다.</p>
				<div style="height:50px"></div>
				<h1>MoonStone으로 교환하시겠습니까?</h1>
				<form class="coin-charge" method="post" action="chargeCoinPro.do">
					<input type="hidden" name="id" value="${sessionScope.id}">
					<input type="hidden" name="cash" value="${waldto.cash}">
					<input type="hidden" name="coin" value="${waldto.coin}">
					
	                <div class="wrap-input-btn">
	                	<input type="text" name="chargeCoin" style="width:150px;"/>
	                	<input type="submit" class="modal-btn" value="OK" />
	                	<input type="button" class="modal-btn" value="CANCLE" onclick="history.back()" />
	                </div>
               	</form>
			</div>
		</div>
		
		
	</div>
</div>
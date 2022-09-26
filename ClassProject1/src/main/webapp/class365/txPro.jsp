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
		
		<!-- 결제 정보 전송 부분 -->
		<div class="container" style="margin-left:280px;">
			
			<div class="my_wallet_title">
				<h3>결제 정보</h3>
			</div>
			<div class="buy_confirm">
				<div>
					<div id="to">판매자: ${toW.waladdr}</div>
					<div id="from">구매자: ${fromW.waladdr}</div>
			
					<div style="width: 300px; margin-top:10px;">
				        <div class="pro_img" id="thumb_container" style="height:300px; overflow:hidden;">
				        	<img class="profile" src="${imagepath}${dto.thu}" style="position:relative;">
						</div>
					</div>
					<div id="sub" style="margin-top:10px;">강의명: ${dto.sub}</div>
					<div id="item">강좌번호: ${dto.lec_num}</div>
					<div id="price">가격: ${cost}</div>
					
				</div>
			
				<div id="test">
					<div id="btntest">
						<button class="send_tx">send</button>
					</div>
				</div>
			</div>
		
		</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(
	 function() {
		 	// 거래정보 보내는 ajax
			$(".send_tx").on(
				"click",
				function( event ) {
					var from = "${fromW.waladdr}";
					var to = "${toW.waladdr}";
					var item = "${dto.lec_num}";
					var price = ${cost};
					fetch("http://localhost:7000/newtx",{
	                    method : 'POST',
	                    headers: {
	                    	'Content-Type': 'application/json'
	                    },
	                    body: JSON.stringify({
	                    	"From" : from,
	                    	"To" : to,
	                    	"Item" : item,
	                    	"Price" : price
	                    }),
	                   mode : 'cors',
	                   cache : 'no-cache',
	                   credentials : 'same-origin',
	                   async: true, 
		    		   crossDomain: true,
				       withCredentials:false,
		    		   timeout: 5000, 
	                   redirect : 'follow',
	                   referrerPolicy : 'no-referrer',
					}).then((response) => response.json())
					.then((res)=>
					$.ajax({
						type:"GET",
						url:'txResult.do',
						data:res,
						dataType : "text",
						success : function( data ) {
							console.log(res);
							console.log(data);
							$("#btntest").remove();
							$("#test").html(data);
						},
						error : function(error) {
							console.log(error);
						}
					})
				) .catch(() => {
				  	console.log('에러')
				  })
				}
			);
		 	
		}	
	);

</script>	
			
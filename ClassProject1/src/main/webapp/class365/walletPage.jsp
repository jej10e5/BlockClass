<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="/ClassProject1/class365/walletPage.css" rel="stylesheet" type="text/css">
<script src="${project}/jquery-3.6.0.js"></script>
<script defer src="/ClassProject1/class365/walletScript.js"></script>
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
		
		<!-- 내 전자 지갑 부분 -->
		
		<div class="container" style="margin-left:280px;">
		<div style="margin-top:100px;"></div>
		        <div id="create_box">
		        <c:if test="${dto.wallet eq 0}">
					<div id="walletresult">
						<p style="font-size:30px; margin:5px; display:inline;">${memid}님! 전자지갑을 생성해주세요.</p>
						<button class="create_wallet"><i class="fa-solid fa-folder-plus"></i></button>
					</div>
				</c:if>
				</div>
				
				<div id="wallet_box">
					<c:if test="${dto.wallet eq 1}">
					  
					<h3>${memid} 님의 충전소</h3>
					<div class="show_addr">
						Your Wallet Address : ${waldto.waladdr}
					</div>
					<div id="test"></div>
				<div class="about_wallet">
	               <figure class="snip1336">
	                   <img src="/ClassProject1/class365/walletImg/cashCharge.jpg" style="width:315px;"/>
	                   <figcaption>
	                       <img src="/ClassProject1/class365/walletImg/cash_temp.png" class="profile" style="width:65px; height:65px;"/>
	                       <p>Cash</p>
	                       <div class="charge">
	                       		<h2><span>₩</span>${waldto.cash}</h2>
	                       		<button class="btn_charge" onclick="location.href='#open-modal'">Charge</button>
	                       </div>
	                   </figcaption>
	               </figure>
	               <figure class="snip1336">
	                   <img src="/ClassProject1/class365/walletImg/coinCharge.png" style="width:315px;"/>
	                   <figcaption>
	                       <img src="/ClassProject1/class365/walletImg/moonstone.png" class="profile"/>
	                       <p>MoonStone</p>
	                       <div class="charge">
	                       		<h2><span>Count</span>${waldto.coin}</h2>
	                       		<button class="btn_charge" onclick="location.href='chargeCoin.do'">Charge</button>
	                       </div>
	                   </figcaption>
	               </figure>
	           	</div>
	           	
	           	<!--cash 충전하는 modal-->
	           	
			    <div id="open-modal" class="modal-window">
			        <div>
			            <a href="#" title="Close" class="modal-close">Close</a>
			            <h1>얼마나 충전하시겠습니까?</h1>
			            
			            <div class="cash_container">
			                <form class="cash-charge" method="post" action="chargeCashPro.do">
			                    <input type="hidden" name="id" value="${sessionScope.id}">
								<input type="hidden" name="cash" value="${waldto.cash}">
			                    <div class="wrap-input-btn">
			                    	<input type="text" name="chargeCash" style="width:120px;"/>
			                    	<input type="submit" class="modal-btn" value="OK" />
			                    </div>
			                </form>
			            </div>
			            
			        </div>
			    </div>
			   
			  </c:if>
		</div>
		</div>
	
	</div>
</div>


<script type="text/javascript">
var sessionId = '<%=(String)session.getAttribute("memid")%>';

$(document).ready(
	 function() {
			$(".create_wallet").on(
				"click",
				function( event ) {
					fetch("http://localhost:7000/createWallet",{
	                    method : 'POST',
	                    headers: {
	                    	'Content-Type': 'application/json'
	                    },
	                    body: JSON.stringify({
	                    	"sessionId" : sessionId
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
							url:'walletResult.do',
							data:res,
							dataType : "text",
							success : function( data ) {
								$("#create_box").html(data);
							},
							error : function(error) {
								console.log(error);
							}
						})
					)
				}		
			);
		}	
	);
</script>	



 

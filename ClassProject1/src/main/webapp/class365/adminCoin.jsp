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
	 <!-- 사이드바 -->	
		<div id="tutor_div" >
			<div id="tutor_main_article" >
				<div id="tutor_main_margin">
				
					<div id="tutor_top_topic">
						<h3 class="topic">충전 신청 현황</h3>
						
					</div>
					<div id="table_div" >
						<table class="tutor_table">
							<tr style="border-bottom:solid 1px lightgrey" >
								<th style="width:15%">신청번호</th>
								<th>신청자</th>
								<th>보유 캐쉬</th>
								<th>보유 코인</th>
								<th>충전할 코인</th>
								<th>요청 상태</th>
								<th></th>
							</tr>
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<th style="width:15%">${dto.req_no}</th>
									<th>${dto.id}</th>
									<th>${dto.cash}</th>
									<th>${dto.coin}</th>
									<th>${dto.req_coin}</th>
									<th>요청 중</th>
									<th>
										<input name="coinbtn/${dto.req_no}/${dto.waladdr}/${dto.coin}/${dto.cash}/${dto.req_coin}" class="btn_sta1"type="button"value="승인">
									</th>
									<th>
										<button class="btn_delete" onclick="deleteRow(this);"><i class="fa-solid fa-trash-can icon_pos"></i></button>
									</th>
								</tr>
							</c:forEach>					
						</table>	
					</div>
					
					<div style="margin-top:100px;"></div>
					
					<div id="tutor_top_topic">
						<h3 class="topic">관리자 전용 전자 지갑</h3>
					</div>
					Wallet Address : ${admin}
					<div style="margin-top:300px;"></div>
					<div id="test"></div>
					
					<!-- restfulapi의 wallets2.json 파일에 일단 관리자 지갑이 저장되어있어야 제대로 진행됨 -->
					<!-- 그냥 sql로 DB에 관리자 지갑 주소 insert 하면 fatch 에러남 -->
					
					<!-- 내 전자 지갑 부분 -->
					<!-- 
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
				           	</div> -->
				           	
				           	<!--cash 충전하는 modal-->
				           	<!--  
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
					</div>-->
					<!-- 지갑영역 끝 -->
					
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

$(document).ready(
		 function() {
				$("input[name^='coinbtn']").on(
					"click",
					function( event ) {
						var btnid =$(this).attr('name');
						var reqid=btnid.split('/')[1];
						var tow=btnid.split('/')[2];
						var coin=btnid.split('/')[3];
						var cash=btnid.split('/')[4];
						var req=btnid.split('/')[5];
						var from ="${admin}";
						var item="charge";
						fetch("http://localhost:7000/newtx",{
		                    method : 'POST',
		                    headers: {
		                    	'Content-Type': 'application/json'
		                    },
		                    body: JSON.stringify({
		                    	"From" : from,
		                    	"To" : tow,
		                    	"Item" : item,
		                    	"Price" : parseInt(req)
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
								url:'adminCoinPro.do?reqid='+reqid+'&cash='+cash,
								data:res,
								dataType : "text",
								success : function( data ) {
									//$("#test").html("data");
									alert("충전 승인을 완료하였습니다.");
									location.reload();
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
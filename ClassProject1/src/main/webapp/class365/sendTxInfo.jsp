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
				<h3>해당 결제 정보</h3>
			</div>
			<div>
				<button class="send_tx_info">send</button>
			</div>
			
			<div id="buyer">${txdto.buyer}</div>
			<div id="seller">${txdto.seller}</div>
			<div id="item">${txdto.item}</div>
			<div id="price">${txdto.price}</div>
			
			<div style="margin-top:100px;">
				<button class="get_tx_id">get</button>
			</div>
			
			<div id="test">전달받은 내용 여기에 표시</div>
		</div>

	</div>
</div>

<script type="text/javascript">
var from = $("#buyer").text();
var to = $("#seller").text();
var item = $("#item").text();
var price = $("#price").text();
var intprice = parseInt(price);

var test = document.querySelector('#test');

$(document).ready(
	 function() {
		 	// 거래정보 보내는 ajax
			$(".send_tx_info").on(
				"click",
				function( event ) {
					
					console.log(from);
					console.log(to);
					console.log(item);
					console.log(intprice);
					//console.log(typeof(price));
					//console.log(typeof(intprice));
					
					fetch("http://localhost:7000/newtx",{
	                    method : 'POST',
	                    headers: {
	                    	'Content-Type': 'application/json'
	                    },
	                    body: JSON.stringify({
	                    	"From" : from,
	                    	"To" : to,
	                    	"Item" : item,
	                    	"Price" : intprice
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
						url:'mainForm.do',
						data:res,
						dataType : "text",
						success : function( data ) {
							console.log(data);
							$("#test").html(data);
						},
						error : function(error) {
							console.log(error);
						}
					})
				)
				}
			);
		 	
		 	
			// txid, blcid 받는 ajax			
			/*
			$(".get_tx_id").on(
				"click",
				function(event){
					
					fetch("http://localhost:7000/getBlc",{
	                    method : 'POST',
	                    headers: {
	                    	'Content-Type': 'application/json'
	                    },
	                   mode : 'cors',
	                   cache : 'no-cache',
	                   credentials : 'same-origin',
	                   async: true, 
		    		   crossDomain: true,
				       withCredentials:false,
		    		   timeout: 5000, 
	                   redirect : 'follow',
	                   referrerPolicy : 'no-referrer',
					}).then((response)=>response.text())
					*/
						/*
						$.ajax({
							type:"GET",
							url:'txResult.do',
							dataType : "text",
							success : function( response ) {
								console.log(typeof(response));
								console.log(response);
								//$("#test").html(response);
							},
							error : function(error) {
								console.log(error);
							}
						})*/
					/*
					.then((text)=>{
						test.innerHTML = "왜 안나와... "+text;
					})
					
				}
			);
			*/
		 	
		}	
	);
</script>	
			
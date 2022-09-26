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
		<div id="tutor_div_2" >
			<div id="tutor_main_article" >
				<div id="tutor_main_margin">
					<div id="tutor_top_topic">
						<h3 class="topic">DashBoard</h3>
					</div>
					
					<div id="table_div" >
						<table class="tutor_table table table-hover">
							<tr style="border-bottom:solid 1px lightgrey" >
								<th class="text-over-cut center">블록 아이디</th>
								<th class="text-over-cut center">트랜잭션 아이디</th>
								<th><th>
								<th class="text-over-cut center">구매자</th>
								<th></th>
								<th class="text-over-cut center">판매자</th>
								<th class="center">가격</th>
								<th class="text-over-cut center">거래시각</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach var="dto" items="${dtos}">
								<tr>
									<th class="text-over-cut">${dto.blc_id}</th>
									<th class="text-over-cut">${dto.tx_id}</th>
									<th><th>
									<th class="text-over-cut">${dto.buyer}</th> 
									<th><i class="fa-solid fa-arrow-right-long" style="margin-top:5px"></i></th>
									<th class="text-over-cut">${dto.seller}</th>
									<th>${dto.price}</th>
									<th class="text-over-cut">${dto.txtime}</th>
									<th><input name="txbtn/${dto.tx_id}" class="btn_sta1"
										type="button"value="tx조회"></th>
									<th><input name="blcbtn/${dto.blc_id}" class="btn_sta2"
									type="button"value="blc조회"></th>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<div id="test"></div>
					
				</div>
			</div>
		</div>
	
		
		
	</div>
</div>

<script type="text/javascript">

var sessionId = '<%=(String)session.getAttribute("memid")%>';

	$(document).ready(
			 function() {
					$("input[name^='txbtn']").on(
						"click",
						function( event ) {
							var btnid =$(this).attr('name');
							var txid=btnid.split('/')[1];
							console.log(txid);
							fetch("http://localhost:7000/reftx",{
			                    method : 'POST',
			                    headers: {
			                    	'Content-Type': 'application/json'
			                    },
			                    body: JSON.stringify({
			                    	"txid" : txid
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
									url:'txRef.do',
									data: res,
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
				}	
			);




	$(document).ready(
			 function() {
					$("input[name^='blcbtn']").on(
						"click",
						function( event ) {
							var btnid =$(this).attr('name');
							var blcid=btnid.split('/')[1];
							fetch("http://localhost:7000/refBlc",{
			                    method : 'POST',
			                    headers: {
			                    	'Content-Type': 'application/json'
			                    },
			                    body: JSON.stringify({
			                    	"blcid" : blcid
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
									url:'blcRef.do',
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
				}	
			);


</script>
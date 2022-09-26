<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>

<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<link href="${project}/walletPage.css" rel="stylesheet" type="text/css">

<!--  
<h2>결제 완료</h2>
	blcid:${blc_id}<br>
    txid: ${tx_id}<br>
    timestamp: ${txtime}<br>
    sig: ${txsig}<br>
    ${a}<br>
    ${bacc}-->
    
<div id="showScroll" class="blc_container">
	<div class="receipt">
		<h1 class="blc_logo">Receipt - TRANSACTION</h1>
		
		<div class="address">
			the best platform, which Online-Edu Service!
		</div>
		
		<div class="transactionDetails">
			<div class="detail">NOGOSANDONG 57-1,</div>
			<div class="detail">MAPOGU,</div>
			<div class="detail">SEOUL</div>
		</div>
		
		<div class="transactionDetails">
			Helped by: Class365
		</div>
		
		<div class="survey bold">
			<p>TX ID #</p>
			<p class="surveyID" style="margin-left:30px;">${tx_id}</p>
		</div>
		  
		<div class="creditDetails">
			<p>Transaction Details &nbsp;&nbsp;&nbsp;&nbsp; ****************</p>
			<!--<p>from: ${from}</p>
			<p>to: ${to}</p>
			<p>price: ${price} WON</p>
			<p>item: ${item}</p>-->
			<p>sig:</p>
			<p style="width:200px; word-wrap: break-word;">${txsig}</p>
			<p>timestamp: ${txtime}</p>
		</div>

		<div class="receiptBarcode">
			<div class="barcode">
				<i class="fa-solid fa-barcode"></i>
				<i class="fa-solid fa-barcode"></i>
				<i class="fa-solid fa-barcode"></i>
				<i class="fa-solid fa-barcode"></i>
			</div>
			
		</div>
		
		<div class="returnPolicy bold">
			Returns with receipt, <br>subject to CVS Return Policy
		</div>
		
		<div class="feedback">
			<div class="break">
				*****************************
			</div>
			<p class="center">
				We would love to hear your feedback on your recent experience with us. This survey will only take 1 minute to complete.
			</p>
			<h3 class="clickBait">Share Your Feedback</h3>
			<h4 class="web">www.class365.com</h4>
			<p class="center">
				enjoy your class!
			</p>
			<div class="break">
				******************************
			</div>
		</div>
		
	</div>
</div>
    
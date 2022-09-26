<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>

<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${project}/walletPage.css" rel="stylesheet" type="text/css">
<script src="${project}/jquery-3.6.0.js"></script>
<script defer src="${project}/walletScript.js"></script>

<div id="showScroll" class="blc_container">
	<div class="receipt">
		<h1 class="blc_logo">Receipt - Block</h1>
		
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
			<p>BLOCK ID #</p>
			<p class="surveyID" style="margin-left:30px;">${blcid}</p>
		</div>
		
		<div class="creditDetails">
			<p>Block Details &nbsp;&nbsp;&nbsp;&nbsp; ****************</p>
			<p>height: ${height}</p>
			<p>pre:</p> 
			<p style="width:200px; word-wrap: break-word;">${pre}</p>
			<p>pow:</p> 
			<p style="width:200px; word-wrap: break-word;">${pow}</p>
			<p>tx id:</p>
			<p style="width:200px; word-wrap: break-word;">${tx}</p>
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
				********************************
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
				********************************
			</div>
		</div>
		
	</div>
</div>

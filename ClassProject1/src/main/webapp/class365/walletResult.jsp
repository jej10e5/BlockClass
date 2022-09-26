<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>

<!-- 추가할부분 -->
<div class="my_wallet_title">
	<h3>${memid} 님의 충전소</h3>
	<br>		
	<c:if test="${waldto.waladdr ne 'null'}">
		<div class="show_addr">
			Your Wallet Address : ${waldto.waladdr}<br>
		</div>
	</c:if>
	<div id="test"></div>
</div>
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
        	
        	<!-- cash 충전하는 modal -->
        	
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


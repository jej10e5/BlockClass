<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lecture.LectureDataBean" %>
<%@page import="lecture.LectureDBBean"%>
<%@page import="lecmem.LecmemDataBean" %>
<%@include file="setting.jsp" %>    
<link href="${project}/style.css" rel="stylesheet" type="text/css">   
<link href="${project}/class_style.css" rel="stylesheet" type="text/css"> 
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


<script>

    $(function(){
    
    	//@@@@@@ 1번 @@@@@@@
        var IMP = window.IMP; // 생략가능
        IMP.init('imp22661492'); //가맹점 식별코드 삽입
        var msg;
        
        //@@@@@@@@ 2번 @@@@@@@@
        //url에서 parameter 가져오기 --> price값 알기 위해서
      
        
		//@@@@@@ 3번 @@@@@@@
            IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '${dlo.sub}',
            amount : '${cost}',
            buyer_email : '${dto.email}',
            buyer_name : '${dto.id}',
            buyer_tel : '${dto.tel}',
            buyer_addr : '서울특별시 강남구 신사동',
            buyer_postcode : '01181',       
        }, function(rsp) {
            if ( rsp.success ) {
            	
           location.href='<%=request.getContextPath()%>/payFormPro.do?id=${dto.id}&lec_num=${lec_num}'
        } else {//error
        	location.href='<%=request.getContextPath()%>/payFormPro.do?id=${dto.id}&lec_num=${lec_num}'
        }

    });
   });
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/class365/setting.jsp" %>
<script src="${project}/jquery-3.6.0.js"></script> 
    
				<form method="get">
	 									 		<div id="re_box">
	 									 			<div class="tutor_rev_box">
	 									 				<textarea class="tutor_txt" id="review_text" style="display:none;"></textarea>
	 									 			</div>						
	 									 		
	 									 		<div class="tutor_btn_box">
	 									 			<button type="button" id="review_btn"value="답글작성"></button>
	 									 			<button type="submit" id="review_ok" style="display:none;"value="답글저장"></button>
	 									 		</div>
	 									 		</div>
	 									 		</form>
	 								
	 								<script type="text/javascript">
									 $(function(){
							
										 $('#'+'re_box').find("button").on('click',function(){
											 $('#'+'re_box').find("#review_text").show();
											 
											 $("#review_ok").show();
											 $(this).hide();
											 
										 });
										 
									 });
									
									</script>
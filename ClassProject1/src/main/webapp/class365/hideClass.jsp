<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="btnform${lec_num}">
	<input type="hidden" name="lec_num" value="${lec_num}">
	<input type="hidden" name="id" value="${id}">
	<input name="ACbtn/show/${lec_num}" class="btn_sta1"
	type="button"value="보이기">
</form>
<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			$("input[name^='ACbtn']").on(
				"click",
				function( event ) {
					var idstr =$(this).attr('name');
					var sta=idstr.split('/')[1];
					var num=idstr.split('/')[2];
					$.ajax(
						{
							type : "POST",
							url : (sta=='show') ? "showClass.do" : "hideClass.do" ,
							/*data : params,*/
							/*data : {
								name : name,
								age : age
							},*/
							data : $("#btnform"+num).serialize(),
							dataType : "text",
							success : function( data ) {
								console.log(data);
								$("#btnform"+num).remove();
								$("#result"+num).html(data);
								$("#sta"+num).remove();
								$("#staresult"+num).html( (sta=='hide') ? '제한됨':'마감');
	
							},
							error : function(  ) {
								alert("강의 보이기 실패");
							}
						}		
					)
					
				}
						
			);
			
		}	
	);	



</script>
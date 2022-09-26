<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="confrimform${lec_num}">
	<input type="hidden" name="lec_num" value="${lec_num}">
</form>
<th><input class="btn_ok_${lec_num}" type="button" value="신청확인"></th>
<th><input class="btn_re_${lec_num}" type="button" value="신청보류"></th>


<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(
		function() {
			$("input[name^='btnconfirm']").on(
				"click",
				function( event ) {
					var idstr =$(this).attr('name');
					var sta=idstr.split('_')[1];
					var num=idstr.split('_')[2];
					$.ajax(
						{
							type : "POST",
							url : (sta=='ok')?"accept.do":"deny.do",
							/*data : params,*/
							/*data : {
								name : name,
								age : age
							},*/
							data : $("#confirmform"+num).serialize(),
							dataType : "text",
							success : function( data ) {
								console.log(data);
								$("#confirmform"+num).remove();
								$("#result_sta"+num).html(data);
								$("#sta"+num).remove();
								$("#staresult"+num).html( (sta=='ok') ? '승인':'보류');
	
							},
							error : function(  ) {
								alert("요청 및 보류 승인 실패");
							}
						}		
					)
					
				}
						
			);
			
		}	
	);	
</script>
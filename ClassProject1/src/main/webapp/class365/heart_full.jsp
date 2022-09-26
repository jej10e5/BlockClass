<form id="likeform_${lec_num}">
	<input type="hidden" name="lec_num" value="${lec_num}">
		<i id="likeicon_full_${lec_num}"class="hebox fa-solid fa-heart cc_pink" 
		style="padding-top:5px; font-size:25px; "></i>
</form>
<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
						     	<script type="text/javascript">
								// <!--
								$(document).ready(
									function() {
										$("i[id^='likeicon_full']").on(
											"click",
											function( event ) {
												var idstr =$(this).attr('id');
												var num=idstr.split('_')[2];
												// var params = "name=" + $("input[name=name]").val()
												// 		+ "&age=" + $("input[name=age]").val();
												
												// var name = $("input[name=name]").val();
												// var age = $("input[name=age]").val();
												$.ajax(
													{
														type : "POST",
														url : "feheart.do",
														/*data : params,*/
														/*data : {
															name : name,
															age : age
														},*/
														data : $("#likeform_"+num).serialize(),
														dataType : "text",
														success : function( data ) {
															console.log(data);
															$("#likeform_"+num).remove();
															$("#likeresult_"+num).html(data);
															
															
														},
														error : function(  ) {
															alert("빈하트로 갱신 실패");
														}
													}		
												)
												}
													
										);
										
									}	
								);	
								
								//-->
							</script>
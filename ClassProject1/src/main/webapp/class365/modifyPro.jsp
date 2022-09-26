<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>    
<script src="${project}/script.js"></script>    

<c:if test="${result eq 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=myPage.do">
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="modifyForm.do"/>		
</c:if>
	
	







	
	
	
	
	
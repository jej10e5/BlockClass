<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>     
<script src="${project}/script.js"></script>


<c:if test="${result eq -1}">
		<script type="text/javascript">
		 erroralert(iderror);
		</script>
</c:if> 
		
<c:if test="${result eq 0}">
		<script type="text/javascript">
		 erroralert(passwderror);
		</script>
</c:if>		
		
		
<c:if test="${result eq 1}">
	${sessionScope.memid = id}
	<c:redirect url="mainForm.do"/>	
</c:if>
 
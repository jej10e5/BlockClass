<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>     
<script src="${project}/script.js"></script>
<c:if test="${delete eq 1}">
<script type="text/javascript">




opener.document.location.reload();
self.close();

</script>
</c:if>
    
 <c:if test="${rs eq 1}">
	<c:redirect url="reviewForm.do"/>	
</c:if>
<%@page import="lecture.LectureDBBean"%>
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>


<c:if test="${result eq 0}">
<script type="text/javascript">
<!--
alert(modifyerror);
-->
</script>
<meta http-equiv="reftresh" content="0; url=tutorMain.do">
</c:if>
<c:if test="${result ne 0}">
	<c:redirect url="tutorMain.do"/>	
</c:if>
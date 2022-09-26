<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/script.js"></script>

<c:if test="${result eq 0}">
	<script type="text/javascript">
			//<!--
			erroralert( createerror );
			//-->
		</script>
</c:if>
<c:if test="${result ne 0}">

	<c:redirect url="mainForm.do"/>
</c:if>
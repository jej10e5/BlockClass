<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/jquery-3.6.0.js"></script>
<script src="${project}/walletScript.js"></script>

<c:if test="${result eq 0}">
	<script type="text/javascript">
			//<!--
			alert( "캐쉬 충전에 실패했습니다.</br>잠시 후에 다시 시도해 주세요." );
			//-->
	</script>
</c:if>
<c:if test="${result ne 0}">
	<meta http-equiv="refresh" content="0; url=walletPage.do">
</c:if>
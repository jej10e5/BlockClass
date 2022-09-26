<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/jquery-3.6.0.js"></script>
<script src="${project}/walletScript.js"></script>

<c:if test="${result1 eq 0 || result2 eq 0}">
	<script type="text/javascript">
			//<!--
			alert( "전자지갑 생성에 실패했습니다.</br>잠시 후에 다시 시도해 주세요." );
			//-->
		</script>
</c:if>
<c:if test="${result1 ne 0 && result2 ne 0}">
	<c:redirect url="walletPage.do"/>
</c:if>


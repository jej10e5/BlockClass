<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="${project}/jquery-3.6.0.js"></script>
<script src="${project}/walletScript.js"></script>

<c:if test="${result eq 0 }">
	<script type="text/javascript">
			//<!--
			alert( "충전 요청에 실패했습니다. 잠시 후에 다시 시도해 주세요." );
			//-->
	</script>
</c:if>

<c:if test="${result ne 0 }">
	<script type="text/javascript">
		//<!--
		alert( "코인 충전을 요청하였습니다. 관리자의 승인 후 이용 가능합니다." );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=walletPage.do">
</c:if>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%


%>
	<c:redirect url="modifyClassde.do?lec_num=${lec_num}"/>
</c:if>
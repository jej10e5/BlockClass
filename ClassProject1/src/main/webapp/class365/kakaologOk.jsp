<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>     
<script src="${project}/script.js"></script>

	
<c:if test="${result eq 1}">
	${sessionScope.memid = id}
	${sessionScope.kid= "1" }
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>


<c:if test="${result ne 0}">

	<c:redirect url="tutorReviewForm.do?lec_num=${lec_num}"/>
</c:if>
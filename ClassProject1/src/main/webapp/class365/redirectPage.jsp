<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="setting.jsp"%>
<!-- 
String re=request.getHeader("Referer");
		request.setAttribute("re", re);
		return new ModelAndView("/class365/redirectPage");
 -->
<script src="${project}/script.js"></script>
<c:redirect url="${re}"/>
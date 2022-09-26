<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@include file="setting.jsp"%> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="${project}/style.css" rel="stylesheet" type="text/css">
 <link href="${project}/login_style.css" rel="stylesheet" type="text/css">  
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>

<h2> 회원정보수정 </h2>

<form name="passwdform" method="post" action="modifyView.do">
	<table>
		<tr>
			<th colspan="2"> 비밀번호를 다시 확인해주세요 </th>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td> 
				<input class="input" type="password" name="passwd" maxlength="30" autofocus> 
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="수정">
				<input class="inputbutton" type="button" value="취소"
					onclick="location='mainForm.do'">
			</th>
		</tr>
	</table>
</form> 

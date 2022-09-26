<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
  <link href="${project}/login_style.css" rel="stylesheet" type="text/css"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<style>
.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 20%;
	background: #ff6f61; /* 회원 가입 옆 선 색깔 */
	position: absolute;
	top: 50%;
	z-index: 2;
}	



</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="signup-form">
    <form method="post" action="findId.do">
		<h2>아 이 디 찾 기 </h2>
		
        <div class="form-group">		      	
        </div>
        <div class="form-group">
        	<input type="tel" class="form-control" name="tel" placeholder="전화번호를 입력하세요" required="required">
        </div>
		
		<div class="form-group">
		<!--TODO 로그인 action -->
            <button type="submit" class="btn btn-success btn-lg btn-block">아이디 찾기</button>
            <button type="button" onclick="location='loginForm.do'" class="btn btn-success btn-lg btn-block">취소</button>
					
        </div>
    </form>
	
</div>
<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 
</body>
</html>

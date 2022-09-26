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
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='loginForm.do';
		})
	})
</script>
<title>패스워드 찾기</title>
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
       <form method="post">
   
			
				
				<h2> 패 스 워 드 찾 기 </h2>
		
        <div class="form-group">		      	
        </div>
        
		<div class="form-group">
		</div>		
				<h5> 패스워드는 ${result} 입니다
				</h5>
				
				
				
				<div class="form-group">
					<button type="button" onclick="loginfForm.do" id=loginBtn class="btn btn-success btn-lg btn-block">로그인</button>
					<button type="button" onclick="history.go(-1);" class="btn btn-success btn-lg btn-block">취소</button>
				
			</div>
		</form>
		</div>
		
	
	
	<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>
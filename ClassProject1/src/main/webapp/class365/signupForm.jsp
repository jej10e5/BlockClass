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
<script>

function confirmid() {
	if( ! signupform.id.value ) {
		alert( idstr );
		signupform.id.focus();		
	} else {
		url = "confirmid.do?id=" + signupform.id.value;
		open( url, "confirm", "scrollbar=no, menubar=no, status=no, width=600, height=500" );
	}		
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( idstr );
		confirmform.id.focus();
		return false;
	}
}
function setid( id ) {
	opener.document.signupform.id.value = id;
	window.close();
	opener.document.signupform.confirm.value = "1"
}

</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="signup-form">
    <form name = "signupform" action="signupPro.do" method="post"
    onsubmit="return inputcheck()">
    <input type="hidden" name="confirm" value="0">
   
		<h2>회 원 가 입</h2>
		<p class="hint-text">여러분 근처의 고수님들을 만나보세요!</p>
        <div class="form-group">
        	<input type="text" class="form-control" style="display:inline-block;" name="id" placeholder="아이디" required="required">
        	<input type="button" class="btn" value="중복확인" onclick="confirmid()">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="passwd" placeholder="패스워드" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="confirm_password" placeholder="패스워드 확인" required="required">
        </div>  
        <div class="form-group">
        	<input type="email" class="form-control" name="email" placeholder="이메일" required="required">
        </div>   
        <div class="form-group">
        	<input type="tel" class="form-control" name="tel" placeholder="전화번호" required="required">
        </div>    
        <div class="form-group">
			<label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div>
		<div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">회원가입</button>
        </div>
    </form>
    
    
 
	<div class="text-center">
	<span style="color:orange;">이미 가입되어있으신가요?</span> <a href="loginForm.do">로그인</a></div>
</div>
</body>
</html>



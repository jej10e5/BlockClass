<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
  <link href="${project}/login_style.css" rel="stylesheet" type="text/css"> 

<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>


</head>
<body>
<jsp:include page="header.jsp"/>
<div class="signup-form">
    <form method="post" action="loginPro.do">
		<h2>로 그 인</h2>
		<p class="hint-text">환영합니다.</p>
        <div class="form-group">		      	
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="id" placeholder="아이디" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="passwd" placeholder="패스워드" required="required">
        </div>
		<div class="form-group">
		<!--TODO 로그인 action -->
            <button type="submit" class="btn btn-success btn-lg btn-block">로그인</button>
        </div>
    </form>
	<div class="text-center">
	<span style="color:orange;">아이디/비밀번호를 잊어버리셨나요?</span> 
	<a href="findIdForm.do">아이디</a>
	/
	<a href="findPasswdForm.do">비밀번호</a>
	</div>
	      <a onclick="kakaoLogin();"style="cursor:pointer;"> <img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="padding-top: 30px;height:100px;padding-left:65px;"></a>
</div>

 <div id="naverIdLogin"></div>
 <div id="htmltest"></div>
  <!-- //네이버 로그인 버튼 노출 영역 -->
   


<script type="text/javascript">
Kakao.init('ba7439462d656bdc59c5331193480eaa'); //발급받은 키 중 javascript키를 사용해준다.
//카카오로그인
function kakaoLogin() {
	Kakao.Auth.login({
    	scope:'account_email profile_nickname',
    
      success: function (authObj) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {     	
        	  const kakao_account = response.kakao_account.profile.nickname;
        	 const kakao_email = response.kakao_account.email; 	 
        	 console.log(kakao_account);
        	 console.log(response.kakao_account.email);
        	  $.ajax({	 
      	 		url : "KloginPro.do",
      	 		type: "POST",   	 		
      	 		data : {account : kakao_account,
      	 				email : kakao_email
      	 		},
      	 		dataType : "text",
      	 		success : function(data){
      	 			window.location.href='/ClassProject1/mainForm.do'	 			
      	 		},
      	 		error : function () {
      	 			alert("로그인 실패");
      	 		}        			 
           	 }
      	 );       	 
          }
        })
      },
    })
  }
function kakaoLogout() {
	Kakao.API.request({
    	url: '/v1/user/unlink',
    	success: function(response) {
    		console.log(response);
    		window.location.href='/ClassProject1/mainForm.do'
    	},
    	fail: function(error) {
    		console.log('탈퇴 미완료')
    		console.log(error);
    	},
	});
};
</script>
<!-- bootstrap ver4.6 JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 
</body>
</html>

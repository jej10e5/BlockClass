<%@page import="lecture.LectureDBBean"%>
<%@page import="lecmem.LecmemDataBean"%>
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


function setid( id ) {
	opener.document.signupform.id.value = id;
	window.close();
	opener.document.signupform.confirm.value = "1"
}



</script>
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
<div class="signup-form">
  <div class="form-group">		      	
        </div>
<c:if test="${result eq 0}">
	<%-- <form method="post" action="signupPro.do">
	<table>
		<tr>
			<th> <span>${id}</span>는 사용할 수 있습니다 </th>
		</tr>
		<tr>
			<td align="center"> 
				<input class="btn btn-success btn-lg btn-block" name="id" type="button" value="확인" 
					onclick="setid( '${id}' )"> 
					
					
			</td>
		</tr>
	</table>
	</form> --%>


<!-- 변경용 -->
 <form method="post" action="findId.do">
		<h2>아이디 중복확인 </h2>
		<p class="hint-text"><span>${id}</span>는 사용할 수 있습니다</p>
        <div class="form-group">		      	
        </div>
       
		<div class="form-group">
		<!--TODO 로그인 action -->
            <button type="submit" class="btn btn-success btn-lg btn-block" onclick="setid( '${id}' )" >확인</button>
           
					
        </div>
    </form>
<!-- 여기까지 -->
</c:if>








<c:if test="${result ne 0}">	
	<form name="confirmform" method="post" action="confirmid.do"
		onsubmit="return confirmcheck()">
		<%-- <table>
			<tr>
				<th colspan="2">
					<span>${id}</span>는 사용할 수 없습니다<br>
					다른 아이디를 입력해주세요
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> <input class="input" type="text" name="id" maxlength="20" autofocus> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input  class="btn btn-success btn-lg btn-block" type="submit" value="사용">
					<input  class="btn btn-success btn-lg btn-block" type="button" value="취소"
						onclick="window.close()">
				</th> 
			</tr>				
		</table>		 --%>
		<h2>아이디 중복확인 </h2>
		<p class="hint-text"><span>${id}</span>는 사용할 수 없습니다<br>
		다른 아이디를 입력해주세요
		
		
		</p>
		 <div class="form-group">
		<input class="form-control" style="display:inline-block;"  type="text" name="id" placeholder="다른 아이디를 입력해주세요" autofocus>
		</div>
		<input  class="btn btn-success btn-lg btn-block" type="submit" value="사용">
					<input  class="btn btn-success btn-lg btn-block" type="button" value="취소"
						onclick="window.close()">
		
		
		
	</form>		
</c:if>				


</div>
<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 
</body>
</html>











  
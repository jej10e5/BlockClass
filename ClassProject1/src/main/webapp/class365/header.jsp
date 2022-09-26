<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp" %>  
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
<header id="header_nav">      
<div id="header_top">   
	<div id="h_top">  
		<span class="c_font_content" id="htext">매일 매일 듣는 class 365!!</span> 
	</div> 
<c:if test="${sessionScope.memid eq 'class365'}">
	<nav class="navbar navbar-expand-xl navbar-light bg-white">
	<a class="navbar-brand c_font_main" href="adminConfirm.do" style="margin-right:30px;"> 
  	<span class="cc_main">${page_main1}</span>
  	<span class="cc_orange">${page_main2}</span> 
  	<span class="cc_purple">&nbsp;&nbsp;&nbsp;관리자&nbsp;&nbsp;&nbsp;</span>   
  	</a> 
  	<ul class="navbar-nav"> 
      <li class="nav-item my-2 my-lg-0">
        <a class="nav-link cc_purple c_font_category" href="mainForm.do">메인</a>
      </li>
     </ul>
  	</nav>
</c:if>
<c:if test="${sessionScope.memid ne 'class365'}"> 
<nav class="navbar navbar-expand-xl navbar-light bg-white">
  <a class="navbar-brand c_font_main" href="mainForm.do" style="margin-right:30px;"> 
  	<span class="cc_main">${page_main1}</span>
  	<span class="cc_orange">${page_main2}</span>  
  	</a>     
  	    
  <!-- 반응형웹 - 화면 크기 줄어들었을때 햄버거모양 리스트 -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" 
  	aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  <div class="collapse navbar-collapse bg-white " id="navbarCollapse">
 <div class="dropdown-divider"></div>
    <ul class="navbar-nav "style=" margin-right:auto;">   
            
      <li class="nav-item dropdown" style="margin-right:20px;"> 
        <a class="nav-link dropdown-toggle c_font_category cc_black" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
         ${menu_category}
        </a> 
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="mainResultForm.do?c=요리">요리</a>
          <a class="dropdown-item" href="mainResultForm.do?c=운동">운동</a>
          <a class="dropdown-item" href="mainResultForm.do?c=금융">금융</a>
          <a class="dropdown-item" href="mainResultForm.do?c=d" style="color:gray;">마감된 강의</a> 
        </div>
      </li> 
       
      <li class="nav-item c_font_category">   
        <form class="form-inline my-2 my-lg-0" style="padding:5px;"
        	action="mainResultForm.do" method="post">
      	<input class="form-control mr-sm-2 " type="search" name="p" 
      	style="width:300px;" placeholder="${str_search}" aria-label="Search"
      	value="${p}">
      	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">${btn_search}</button>
      </form>
      </li>
     </ul> 
     
    <!-- guest -->
    <c:if test="${sessionScope.memid eq null}">
    <ul class="navbar-nav"> 
      <li class="nav-item my-2 my-lg-0">
        <a class="nav-link c_font_category" href="dashBoard.do">
        <i class="fa-solid fa-cubes"></i></a>
      </li>
      <li class="nav-item my-2 my-lg-0">
        <a class="nav-link cc_purple c_font_category" href="signupForm.do">${menu_signup}</a>
      </li>
      <li class="nav-item my-2 my-lg-0"> 
        <a class="nav-link cc_purple c_font_category" href="loginForm.do">${menu_login}</a>
      </li> 
    </ul>
 	</c:if>
 	
 	<!-- member --> 
     <c:if test="${sessionScope.memid ne null}">
     <ul class="navbar-nav"> 
     <li class="nav-item my-2 my-lg-0">
        <a class="nav-link c_font_category" href="dashBoard.do">
        <i class="fa-solid fa-cubes"></i></a>
      </li>
     <li class="nav-item my-2 my-lg-0">
     	 <a class="nav-link" href="likeListForm.do">
     	 	<i class="fa-solid fa-heart cc_pink" style="padding-top:5px; font-size:20px;"></i>
     	 </a>
     </li>
     <li class="nav-item my-2 my-lg-0">
     	 <a class="nav-link" href="mapForm.do">
        	<i class="fa-solid fa-map-location-dot" style="padding-top:5px; font-size:20px;color:#9c446e;"></i>
        </a>
      </li>
      <li class="nav-item my-2 my-lg-0">
        <a class="nav-link cc_orange c_font_category" href="tutorMain.do">${menu_creator}</a>
      </li>
      <li class="nav-item my-2 my-lg-0">
        <a class="nav-link cc_purple c_font_category" href="myPage.do">${menu_mypage}</a>
      </li>
      <li class="nav-item my-2 my-lg-0"> 
        <a class="nav-link cc_gray c_font_category" onclick="kakaoLogout();"style="cursor: pointer;">${menu_logout}</a>
      </li> 
    </ul>
    </c:if>
  </div>
</nav>
</c:if>
</div>
</header>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('ba7439462d656bdc59c5331193480eaa');
        
    	function kakaoLogout() {
    	
        	if (!Kakao.Auth.getAccessToken()) {
        		window.location.href='/ClassProject1/logout.do'
    		    return;
    	    }
    	    Kakao.Auth.logout(function(response) {
    	    	window.location.href='/ClassProject1/logout.do'
    	    });
    	
    	
    };
    </script>



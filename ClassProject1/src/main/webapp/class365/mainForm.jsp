<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="setting.jsp" %>
<head> 
<!-- font awesome -->
<script src="https://kit.fontawesome.com/811e29d39a.js" crossorigin="anonymous"></script>
<!-- bootstrap ver4.6 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <link href="${project}/style.css" rel="stylesheet" type="text/css"> 
<script src="${project}/script.js"></script>

<title>${title_main}</title> 
</head>
<style>
.pro_img{
	border-radius:20px;
}
.profile{
	overflow:hidden; 
	display:flex; 
	width:100%; 
	height:100%; 
	object-fit:cover;
	transition: all 0.2s linear;
	max-width:100%;
}
.lvbox{
	position:absolute; 
	top:10px; 
	left:10px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.cbox{
	position:absolute; 
	top:10px; 
	left:80px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.sbox{
	position:absolute; 
	bottom:210px; 
	left:10px;
	border:solid 1px white;
	border-radius:7px;
	color:white;
	padding:3px 5px;
}
.hebox{
	position:absolute; 
	top:15px; 
	right:15px;
	z-index:200;

}
.lv1{
	background-color:#fda166;
}
.lv2{
	background-color:#ff6f61;
}
.lv3{
	background-color:#9c446e;
}
.ca1{
	background-color:#fda166;
}
.ca2{
	background-color:#ff6f61;
}
.ca3{
	background-color:#9c446e;
}
.s1{
	background-color:#ff6f61;
}
.s2{
	background-color:#9c446e;
}

.card{
	border:none;
}
.card img{
	border-radius:20px;
}
.card:hover{
	cursor:pointer;
}
.card:hover img{
	transform:scale(1.2);
}
.i:hover{
	cursor:pointer;
}
</style>
<body> 
<%@ include file="header.jsp" %>  
<section>  
<!-- main section -->
<div id="main_section" class="container-fluid">   

<!-- main ads section -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-bottom:5%;">
  	<!-- main ads list controller -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li> 
    </ol> 
    <div class="carousel-inner cb_main">  
      <div class="carousel-item active">  
      <!-- image ads1 -->   
      	<img class="bd-placeholder-img main_ads" src="${ads}/ads1.jpg"/>  
        <div class="container" > 
        <!-- 왼쪽정렬 --> 
          <div class="carousel-caption text-left" > 
            <h1>Welcome!!</h1> 
            <p>Some representative placeholder content for the first slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary " href="mainResultForm.do?c=금융">Sign up today</a></p>
          </div> 
        </div>
      </div>  
      <div class="carousel-item">
		<!-- image ads2 --> 
		<img class="bd-placeholder-img main_ads" src="${ads}/ads2.jpg"/>
        <div class="container">
         <!-- 가운데 정렬 --> 
          <div class="carousel-caption">
            <h1>Class</h1> 
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="mainResultForm.do?c=요리">Learn more</a></p>
          </div>
        </div> 
      </div>
      <div class="carousel-item">
      <!-- image ads3 -->
		<img class="bd-placeholder-img main_ads" src="${ads}/ads3.jpg"/>
        <div class="container">
         <!-- 오른쪽정렬 -->
          <div class="carousel-caption text-right">
            <h1>365${txid}</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="mainResultForm.do?c=운동">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <!-- main ads left button -->
    <button class="carousel-control-prev" type="button" data-target="#myCarousel" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </button>
    <!-- main ads right controller -->
    <button class="carousel-control-next" type="button" data-target="#myCarousel" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </button>
  </div>
   
<!-- main lecture list section --> 
	<div class="container" style="max-width:fit-content; margin:auto;"> 
		<div class="row">   
		<c:forEach var="dto" items="${dtos}" varStatus="sta">
			<div class="col" style="margin:2% 0;" >
				<div class="card" style="height:500px; width: 300px; margin:auto;">
					<!-- 
					onclick="location.href='classForm.do?lec_num=${dto.lec_num}'">
					 -->
					<div class="row">
		                  <div  class="mx-auto"  style="width: 300px;">
		                   <div class="pro_img" id="thumb_container" style="height:300px; overflow:hidden;">
		                   		<img class="profile" src="${imagepath}${dto.thu}" style="position:relative;"
		                   			onclick="location='classForm.do?lec_num=${dto.lec_num}'">
		                   		<c:if test="${dto.lv eq '입문자'}">
		                   		<span class="lvbox lv1">${dto.lv}</span>
		                   		</c:if>
		                   		<c:if test="${dto.lv eq '초급자'}">
		                   		<span class="lvbox lv2">${dto.lv}</span>
		                   		</c:if>
		                   		<c:if test="${dto.lv eq '중급자'}">
		                   		<span class="lvbox lv3">${dto.lv}</span>
		                   		</c:if>
		                   		
		                   		<c:if test="${dto.cate eq '요리'}">
		                   		<span class="cbox ca1">${dto.cate}</span>
		                   		</c:if>
		                   		<c:if test="${dto.cate eq '운동'}">
		                   		<span class="cbox ca2">${dto.cate}</span>
		                   		</c:if>
		                   		<c:if test="${dto.cate eq '금융'}">
		                   		<span class="cbox ca3">${dto.cate}</span>
		                   		</c:if>
		                   		
		                   		<c:if test="${dto.sta eq 1}">
		                   		<span class="sbox s1">모집중</span>
		                   		</c:if>
		                   		<c:if test="${dto.sta eq 2}">
		                   		<span class="sbox s2">마감</span>
		                   		</c:if>
								
								<!-- LIKE -->
						     	<c:if test="${memid ne null and memid ne '' }">
						     	<c:if test="${dto.lid ne null}">
						     	<div id="likeresult_${dto.lec_num}">
			                   			<form id="likeform_${dto.lec_num}">
			                   				<input type="hidden" name="lec_num" value="${dto.lec_num}">
								     	 	<i id="likeicon_full_${dto.lec_num}"class="hebox fa-solid fa-heart cc_pink" 
								     	 	style="padding-top:5px; font-size:25px; "></i>
								     	 </form>
								     	 </div>
						     	</c:if>
						     	<c:if test="${dto.lid eq null}">
						     	<div id="likeresult_${dto.lec_num}">
			                   			<form id="likeform_${dto.lec_num}">
			                   				<input type="hidden" name="lec_num" value="${dto.lec_num}">
								     	 	<i id="likeicon_empty_${dto.lec_num}"class="hebox fa-regular fa-heart cc_pink" 
								     	 	style="padding-top:5px; font-size:25px; "></i>
								     	 </form>
								     	 </div>
						     	</c:if>
						     	</c:if>
						     	<c:if test="${memid eq null or memid eq '' }">
						     	<i id="likeicon" class="hebox fa-regular fa-heart cc_pink" 
								     	 	style="padding-top:5px; font-size:25px; "></i>
						     	</c:if>
	
						     	<c:if test="${memid eq null or memid eq '' }">
						     	<a class="hebox" href="loginForm.do">
								     <i class="fa-regular fa-heart cc_pink" style="padding-top:5px; font-size:25px;"></i>
								 </a>
								 </c:if>
								 
		                   	</div>    
		                    </div>
		                </div>
				  <div class="card-body">
				    <h4 class="card-title" style="text-overflow: ellipsis; overflow:hidden;"> ${dto.sub}</h4>
				    <h7 class="card-text" style="display:block; margin-bottom:5px;">${dto.id}</h7>
				    <h7 class="card-text" style="display:block; margin-bottom:5px;text-overflow: ellipsis; overflow:hidden;">${dto.intr}</h7>
				    <div style="bottom:0px;">
				    <h5 class="card-text" style="padding:5px 10px; display:inline;color:#ff6f61; margin-right:auto;">월 ${dto.pri}원</h5>
				    <!-- like 
				    <a href="#"><i class="fa-regular fa-heart cc_pink" style="padding:5px 10px; inline"></i></a>
				    -->
				    <a href="classForm.do?lec_num=${dto.lec_num}" class="btn btn-primary"
				    style="float:right;">상세정보</a>
					</div>
				    <!-- classForm.jsp?classNum=${classNum} -->
				  </div>
				</div>
			</div>
			</c:forEach>
		
		</div>
	</div>

</div>
	
	<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>
						     	<script type="text/javascript">
								$(document).ready(
									function() {
										$("i[id^='likeicon']").on(
											"click",
											function( event ) {
												var idstr =$(this).attr('id');
												var sta=idstr.split('_')[1];
												var num=idstr.split('_')[2];
												$.ajax(
													{
														type : "POST",
														url : (sta=='empty')?'efheart.do':'feheart.do',
														data : $("#likeform_"+num).serialize(),
														dataType : "text",
														success : function( data ) {
															console.log(data);
															$("#likeform_"+num).remove();
															$("#likeresult_"+num).html(data);
															
															
														},
														error : function(error) {
															alert(error);
														}
													}		
												)}
										);
									}	
								);
							</script>
						     	
</section> 
<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 </body>

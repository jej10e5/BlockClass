<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="lecture.LectureDBBean"%>
<%@page import="tutor.TutorDataBean" %>
<%@include file="setting.jsp" %>
 <link href="${project}/style.css" rel="stylesheet" type="text/css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="${project}/jquery-3.6.0.js"></script>
<style>
body{
    margin-top:20px;
    background:#f8f8f8
}
.pro_img{
overflow:hidden;
width: 200px;
height: 200px;

}
.profile{
	overflow:hidden; 
	display:flex; 
	width:100%; 
	height:100%; 
	object-fit:cover;
}
</style>
<script type="text/javascript">
//사진미리보기
function setImagePreview(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      $("#image_container *").remove();
      document.querySelector("div#image_container").appendChild(img);
      $("img").addClass("profile");
    };
	
    reader.readAsDataURL(event.target.files[0]);
  }

</script>
<body>
<jsp:include page="header.jsp"/>
<div class="container" style="margin:3% auto;">
<h2>튜터 정보</h2>
<div class="row flex-lg-nowrap">
  <div class="col">
    <form class="form" action="tutorInfoPro.do" method="post" enctype="multipart/form-data">
    <div class="row">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
              <div class="row">
                <div class="col-12 col-sm-auto mb-3">
                  <div  class="mx-auto"  style="width: 200px;">
        		<c:set var="imagepath" value="/ClassProject/classImage/"/>
                  <c:if test ="${dto.pro eq null or dto.pro eq ''}">
                    <div id="image_container"class="d-flex justify-content-center align-items-center rounded" style="height: 200px; background-color: rgb(233, 236, 239);">
                      <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">200x200</span>
                      </div>
                   </c:if>
                   <c:if test ="${dto.pro ne null and  dto.pro ne ''}">

                   <div class="pro_img"id="image_container">
                   		<img class="profile" src="${imagepath}${dto.pro}">
                   	</div>


                   </c:if>    
                    </div>
                  </div>
                </div>
                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                  <div class="text-center text-sm-left mb-2 mb-sm-0">
                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${dto.id}</h4>
                    
                    <div class="mt-2">
                    
                     <label class="btn btn-primary" for="file">             
                        <i class="fa fa-fw fa-camera"></i>               
                        <span>프로필 사진 업로드</span>
                     </label>
                      <input style="visibility:hidden;" accept="image/*" type="file" id="file"name="pro" onchange="setImagePreview(event);">
                    </div>
                  </div>
                 
                </div>
              </div>
              
              <div class="tab-content pt-3">
                <div class="tab-pane active">
                 
                    <div class="row">
                      <div class="col">
                        <div class="row">
                          <div class="col mb-3">
                            <div class="form-group">
                              <label>소개말</label>
                              <c:if test = "${dto.info eq null or dto.info eq ''}">
                              <textarea class="form-control"name="info" rows="5" placeholder="튜터님의 소개를 입력해주세요"></textarea>
                              </c:if>
                              <c:if test = "${dto.info ne null and dto.info ne''}">
                              <textarea class="form-control"name="info" rows="5" placeholder="튜터님의 소개를 입력해주세요">${dto.info}</textarea>
                              </c:if>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>계좌번호</label>
                              <c:if test="${dto.acc eq null or dto.acc eq ''}">
                              <input class="form-control" type="number" name="acc" placeholder="튜터님의 계좌번호를 입력하세요">
                              </c:if>
                              <c:if test="${dto.acc ne null and dto.acc ne ''}">
                           	  <input class="form-control" type="number" name="acc" value="${dto.acc}" placeholder="튜터님의 계좌번호를 입력하세요">		
                              </c:if>                              	
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                   
                    <div class="row">
                      <div class="col d-flex justify-content-end">
                      	<button class="btn btn-primary" style="margin:10px;"type="reset">취소하기</button>
                        <button class="btn btn-primary" style="margin:10px;" type="submit">저장하기</button>
                      </div>
                    </div>
                  

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      </form>
    </div>

  </div>
</div>
</div>


<!-- 부트스트랩 body 태그 이전에 넣어줘야합니다. -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
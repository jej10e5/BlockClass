<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- bootstrap ver4.6 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <%@include file="setting.jsp"%>
<link href="${project}/style.css" rel="stylesheet" type="text/css"> 
</head>
<style>
body{
    background:#f8f8f8
}
.profile{
	overflow:hidden; 
	display:flex; 
	width:100%; 
	height:100%; 
	object-fit:cover;
}
</style> 
<script type="text/javascript" src="${project}/script.js" charset="utf-8"></script>
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
function setThumbPreview(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      $("#thumb_container *").remove();
      document.querySelector("div#thumb_container").appendChild(img);
      $("img").addClass("profile");
    };
	
    reader.readAsDataURL(event.target.files[0]);
  } 

</script>
<body>
<jsp:include page="header.jsp"/>
<div class="container" >
        <div class="card" style="padding:3%;">
               <p class="c_font_main cc_black">
               ${sessionScope.memid}님의 강의 생성</p>   
              <div class="tab-content pt-3">
                <div class="tab-pane active">
                  <form class="form" name="createform" enctype="multipart/form-data" method="post" 
                  action="createClassPro1.do" onsubmit="return createcheck()">
                    <div class="row">
                      <div class="col">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label>강의명</label>
                              <input class="form-control" type="text" name="lec_sub" placeholder="강의명을 입력하세요."
                              	maxlength="29" required="required">
                            </div>
                          </div>
                          <div class="col-md-6">
                          	<label>카테고리*</label>
									<select name="category" class="form-control" aria-label="Default select example"
										required="required">
  										<option value="">카테고리를 선택하세요</option>
  										<option value="요리">요리</option>
 										<option value="운동">운동</option>
  										<option value="금융">금융</option>
									</select>
								</div>
                         </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>강의 요약</label>
                              <textarea class="form-control" rows="3" 
                              name="lec_intr" placeholder="강의 요약 내용을 입력하세요." 
                              maxlength="51" required="required"></textarea>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label>강의 내용</label>
                              <textarea class="form-control" rows="6" 
                              name="lec_con" placeholder="강의 내용을 입력하세요."
                              maxlength="1500" required="required"></textarea>
                            </div>
                          </div>
                        </div>
                        <!-- 사진업로드 --> 
                       <div class="class_img">
                       <h5>Class 사진</h5>
		              <div class="row">
		                <div class="col-12 col-sm-auto mb-3">
		                  <div  class="mx-auto"  style="width: 600px;">
		                   <div class="pro_img"id="image_container" style="height: 400px;">
		                    <div id="image_container"class="d-flex justify-content-center align-items-center rounded" 
		                    style="height: 400px; background-color: rgb(233, 236, 239);">
                     		 <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">600x400</span>
		                   	</div>    
		                    </div>
		                  </div>
		                </div>
		                </div>
		                <div class="row">
		                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
		                  <div class="text-center text-sm-left mb-2 mb-sm-0">
		                    <div class="mt-2">
		                     <label id="imgfile" class="btn btn-primary" for="file1">             
		                        <i class="fa fa-fw fa-camera"></i>               
		                        <span>사진 업로드</span>
		                     </label>

		                      <input style="visibility:hidden;" accept="image/*" type="file" id="file1"name="img"

		                       onchange="setImagePreview(event);">
		                    </div>
		                  </div>
		                </div>
		              </div>
		              </div>
		              <div class="thumb_img">
		              <h5>썸네일 사진</h5>
		              <div class="row">
		                <div class="col-12 col-sm-auto mb-3">
		                  <div  class="mx-auto"  style="width: 300px;">
		                   <div class="pro_img" id="thumb_container" style="height: 300px;">
		                    <div id="image_container"class="d-flex justify-content-center align-items-center rounded" style="height: 300px;background-color: rgb(233, 236, 239);">
                      			<span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">300x300</span>
		                   	</div>    
		                    </div>
		                  </div> 
		                </div>
		                </div>
		                <div class="row">
		                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
		                  <div class="text-center text-sm-left mb-2 mb-sm-0">
		                    <div class="mt-2">
		                     <label class="btn btn-primary" for="file2">             
		                        <i class="fa fa-fw fa-camera"></i>               
		                        <span >썸네일 업로드</span>
		                     </label>

		                      <input style="visibility:hidden;" accept="image/*" type="file" id="file2"name="thumb"

		                       onchange="setThumbPreview(event);">
		                    </div>
		                  </div>
		                </div>
		              </div>
                      </div>
                        
						<div class="row">
                      			<div class="col d-flex justify-content-end">
                       			 <button class="btn btn-primary" type="submit">save & next</button>
                       			 </div>
                    		</div>
                      </div>
                    </div>  
				</form>
			</div>				
		</div>
	</div>
</div>


 
<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 </body>
 </html>
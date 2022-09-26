  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- bootstrap ver4.6 css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <%@include file="setting.jsp"%>
<script type="text/Javascript" src="${project}/script.js" charset="UTF-8"></script>
<script src="/JQueryEx/jquery-3.6.0.js" type="text/javascript"></script>

<link href="${project}/style.css" rel="stylesheet" type="text/css"> 
</head>
<style>
body{
    background:#f8f8f8
}
</style>
<body>
<jsp:include page="header.jsp"/>
<div class="container" >
	<h2>강의번호 : ${param.lec_num}</h2>
        <div class="card" style="padding:3%;">
               <p class="c_font_main cc_black">
               ${sessionScope.memid}님의 강의 생성 - 상세정보</p>   
              <div class="tab-content pt-3">
                <div class="tab-pane active">
                  <form class="form" name="createform" method="post" 
                  action="createClassPro2.do?lec_num=${param.lec_num}" onsubmit="return createcheck()">
                    
                    <div class="row">
                      <div class="col">
                        <div class="row">
                          <div class="col-md-4">
                            <div class="form-group">
                              <label>가격*</label>
                              <input class="form-control" type="number" name="pri" placeholder="가격을 입력하세요." required>
                            </div>
                          </div>
                          <div class="col-md-4">
                          	<label>난이도*</label>
									<select name="lv" class="form-control" aria-label="Default select example" required>
  										<option value="">난이도</option>
  										<option value="입문자">입문자</option>
 										<option value="초급자">초급자</option>
  										<option value="중급자">중급자</option>
									</select>

							</div>
                         </div>
                        <div class="row">
                        	<div class="col-md-4">
                            <div class="form-group">
                              <label>최대인원*</label>
                              <input class="form-control" type="number" name="cap" placeholder="최대인원을 입력하세요." required>
                            </div>
                          </div>
                        </div>
						<div class="row">
                          <div class="col-md-4">
                          	<label>강의시작일*</label>
								<input class="form-control" id="date" type="date" name="be" required>
							</div>
                         <div class="col-md-4">
                          	<label>강의마지막날*</label>
							<input class="form-control" type="date" name="fin" required> 
							</div>

                         </div>                
                                         
                         
                         <div class="row">
                         	<div class="col-md-4">
                         	<label>강의 열리는 곳*</label>
                         	<input class="form-control" type="text" id="address_kakao" name="adr" readonly />
                         	</div>
                         	<div class="col-md-4">
                         	<!-- 주소 가져오는 api -->
                         	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
								window.onload = function(){
								    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
								        //카카오 지도 발생
								        new daum.Postcode({
								            oncomplete: function(data) { //선택시 입력값 세팅
								                document.getElementById("address_kakao").value = data.address; // 주소 넣기
								                //document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
								            }
								        }).open();
								    });
								}
								</script>
                         	
							</div>
                         </div>
						<div class="row">
                   			<div class="col d-flex justify-content-end">
                   			 <button class="btn btn-primary" id="create" type="button">Save Class</button>
                   			 </div>
                   		</div>
                      </div> 
                     </div>
				</form>
					  <script type="text/javascript">
                         $('#create').on('click',function(e){	
                        	  var dateFrom = $('Input[name="be"]').val();	//시작일
                        	  
                        	  var dateTo = $('Input[name="fin"]').val();	//종료일
                        	
                        	  var today = new Date();				//오늘 날짜
							  var today2 = new Date();
                        	  dateFrom = new Date(dateFrom);
                        	  dateFrom2 = new Date(dateFrom);
                        	  
                        	  var fromYear = dateFrom.getFullYear();                      	               	  
                        	  var fromMonth = dateFrom.getMonth() + 1;
                        	  var fromDay = dateFrom.getDate();
                               
                        	  
                        	  
                        	  
                        	  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
                        	  if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
                        	    fromYear  = 0;
                        	    fromMonth = 0;
                        	    fromDay   = 0;
                        	  }

                        		dateFrom = fromYear +'-'+ fromMonth +'-'+fromDay; 
								
                        	 
							   
								dateTo = new Date(dateTo);
								dateTo2 = new Date(dateTo);
                        	  var toYear  = dateTo.getFullYear();
                        	
                        	  
                        	  var toMonth = dateTo.getMonth() + 1;
                        	  var toDay   = dateTo.getDate();

                        	  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
                        	  if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)){
                        	  toYear  = 0;
                        	  toMonth = 0;
                        	  toDay   = 0;
                        	  }

                        	    dateTo = toYear +'-'+ toMonth +'-'+toDay;
						
                        	  //오늘날짜 날짜 형식으로 지정
                        	  var todayYear  = today.getFullYear(); 	//2020
                        		
                        	  
                        	  var todayMonth = today.getMonth() + 1;    	//06
                        	  var todayDay   = today.getDate();  		//11
                        	  today = todayYear +'-'+ todayMonth +'-'+todayDay;  // 2020/06/11 (형식 지정은 본인 자유)
                        	
                        	  console.log(dateFrom,dateTo,today)
                        	  
                        	  //날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌
                        	  if((dateFrom2.getTime() >= today2.getTime()) && (dateTo2.getTime() >= dateFrom2.getTime())){
                        		  document.forms["createform"].submit();	
                        		  return true;
                        	  } else if(dateFrom2.getTime()<=today2.getTime()){
                        	 	 alert("강의 시작날짜가 현재보다 작습니다. 다시 확인해주세요.");
                        	 	$('Input[name="be"]').focus();
                        	  }else if(dateFrom2.getTime()>=dateTo2.getTime()){
                        		  alert("강의 종료날짜가 강의 시작날짜보다 작습니다. 다시 확인해주세요.");
                        		  $('Input[name="fin"]').focus();
                        	  } 
                        	});         	                       
                         </script>
			</div>				
		</div>
	</div>
</div>

<!-- bootstrap ver4.6 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
 </body>
</html>

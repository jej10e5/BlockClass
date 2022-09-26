var substr="강의명을 입력하세요.";
var constr="강의 내용을 입력하세요.";
var intrstr="강의 내용 요약을 입력하세요.";
var catestr="카테고리를 선택하세요.";
var idstr = "아이디를 입력하세요";
var passwdstr = "비밀번호를 입력하세요";
var iderror ="입력하신 아이디가 없습니다.\n다시 확인하세요";
var passwderror ="입력하신 비밀번호가 다릅니다.\n다시 확인하세요";
var modifyerror = "회원정보 수정에 실패했습니다.\n다시 확인하세요";
//강의만들기
function createcheck(){
	var img=$("#classimg").attr("src");
	var thumb=$("#thumbimg").attr("src");
	if(!createform.lec_sub.value){
		alert(substr);
		createform.lec_sub.focus();
		return false;
	}else if(!createform.lec_con.value){
		alert(constr);
		createform.lec_con.focus();
		return false;
	}else if(!createform.lec_intr.value){
		alert(intrstr);
		createform.lec_intr.focus();
		return false;
	}else if(createform.category.value==0){
		alert(catestr);
		createform.category.focus();
		return false;
	}else if(!createform.img.value && img==null){
		  alert("클래스 사진파일을 업로드하세요");
		  return false;
	}else if(!createform.thumb.value && thumb==null){
		  alert("썸네일 사진파일을 업로드하세요");
		  return false;
	 }
}
//로그인
function erroralert(msg){
	alert(msg);
	history.back();
}

function logincheck(){
	if(! loginform.id.value){
		alert(idstr);
		loginform.id.focus();
		return false;
	}else if( ! loginform.passwd.value){
		alert(passwdstr);
		loginform.passwd.focus();
		return false;
	}
}
//--로그인
//사진미리보기
function setImagePreview(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
function setThumbPreview(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      document.querySelector("div#thumb_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }



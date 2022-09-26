var substr="강의명을 입력하세요.";
var constr="강의 내용을 입력하세요.";
var intrstr="강의 내용 요약을 입력하세요.";
//강의만들기
function createcheck(){
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
	}
}
// 지갑 생성 버튼
var alertsVisible = 0;

function makeAlert(type = "info", msg) {
	var div = document.getElementById("alerts");
	
	// 클릭하면 나타나는 창 영역
	var notif = document.createElement("div"), 
		contents = document.createElement("div"), 
		header = document.createElement("div"), 
		footer = document.createElement("div");
	
	header.classList.add("alert__header");
	contents.classList.add("alert__body");
	footer.classList.add("alert__footer");
	notif.classList.add("alert__container");
	
	if(type == "confirm") {
		
		for(var i = 0; i < msg.options.length; i++) {
			var tmp = document.createElement("button");
			
			tmp.innerHTML = msg.options[i].label || "Button";
			tmp.classList.add("btn");
			//tmp.classList.add(msg.options[i].style || "btn-grey");
			tmp.onclick = msg.options[i].funct;
			
			
			tmp.addEventListener("click", function() {
				killAlert(this.parentNode.parentNode);
			});
			
			footer.appendChild(tmp);
		}
		
		notif.classList.add('info');
	}
	
	
	header.innerHTML = msg.header || "Alert";
	contents.innerHTML = msg.contents || "";
	document.getElementById("alerts-background").classList.remove("hidden");
	
	notif.appendChild(header);
	notif.appendChild(contents);
	notif.appendChild(footer);
	div.appendChild(notif);
}

// 윈도우 안보이게
function killAlert(alert) {
	alert.style.display = "none";
	alertsVisible--;
	
	if(alertsVisible <= 0) {
		alertsVisible = 0;
		document.getElementById("alerts-background").classList.add("hidden");
	}
	
}

// 지갑 생성 확인창
function makeConfirm() {
	makeAlert("confirm", {
		header: "Confirm",
		contents: "Would you create your Smart Wallet?",
		options: [
			{
				label: "Yes",
				funct: function() {
					alert("Your Wallet is created.");	
				}
			}
		]
	});
}



// 삭제 버튼으로 신청내역 지우기
function deleteRow(obj){
	var tr = $(obj).parent().parent();
    tr.remove();
}
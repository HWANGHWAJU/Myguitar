


/*function LoginCheck(){
	var checkid = document.getElementById("userid").value;
	var checkpw = document.getElementById("userpw").value;
	

}
*/
function JoinCheck(){
	var joinid = document.getElementById("inputid").value;
	var joinpw = document.getElementById("inputpw").value;
	var joinpwcon = document.getElementById("pwcon").value;
	
	if(joinid.length < 5){
		alert(" 아이디는 5자 이상으로 입력 해주세요.");
		document.joinform.inputid.focus();
		document.joinform.inputid.select();
		return false;
	}
	else if(joinpw.length <8 ){
		alert(" 비밀 번호는 8자 이상 입력 해주세요.");
		document.joinform.inputpw.focus();
		document.joinform.inputpw.select();
		return false;
	}
	else if(joinpw != joinpwcon) {
		alert(" 비밀 번호가 일치하지 않습니다. ");
		document.joinform.pwcon.focus();
		document.getElementById("pwcon").value="";
		return false;
	}
	else {
		window.alert(" 가입이 완료 되었습니다. ");
	}
}

function CheckID(){
	window.open("IDcheck.html", "chk", "width=300, height=100");
}


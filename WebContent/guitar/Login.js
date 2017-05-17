


function LoginCheck(){
	var checkid = document.getElementById("id").value;
	var checkpw = document.getElementById("pw").value;
	
	if(checkid == null ){
		alert("아이디를 입력하세요");
		document.loginmain.id.focus();
		return false;
	}
	else if(checkpw == null || checkpw.length < 8){
		alert("비밀번호를 확인해주세요");
		document.loginmain.pw.focus();
		return false;
	}

}

function JoinCheck(){
	var joinid = document.getElementById("inputid").value;
	var joinpw = document.getElementById("inputpw").value;
	var joinpwcon = document.getElementById("pwcon").value;
	var admin = "admin";
	
	if(joinid == admin ) { alert("이 아이디는 사용할 수 없습니다. "); return false;}
	
	
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




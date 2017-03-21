package member.service;

import java.util.Map;

public class JoinRequest {

	private String id;
	private String pw;
	private String confirmPw;
	private String name;
	private String age;
	private String email;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAge(){
		return age;
	}
	
	public void setAge(String age){
		this.age=age;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getConfirmPw() {
		return confirmPw;
	}

	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email=email;
	}

	public boolean isPasswordEqualToConfirm() {
		return pw != null && pw.equals(confirmPw);
	}

	public void validate(Map<String, Boolean> errors) {
	
		
		checkEmpty(errors, id, "id");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, age,"age");
		checkEmpty(errors, email,"email");
		checkEmpty(errors, pw, "pw");
		checkEmpty(errors, confirmPw, "confirmPw");
	
		
		if (!errors.containsKey("confirmPw")) {
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		} //비밀번호가 같은지 확인 
	}

	private void checkEmpty(Map<String, Boolean> errors, 
			String value, String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}
}

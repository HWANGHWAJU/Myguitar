package member.model;


public class Member {

	private String id;
	private String pw;
	private String name;
	private String age;
	private String email;

	public Member(String id, String pw, String name, String age, String email) {
		this.id = id;
		this.pw=pw;
		this.name=name;
		this.age=age;
		this.email=email;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPw() {
		return pw;
	}
	
	public String getAge(){
		return age;
	}
	
	public String getEmai(){
		return email;
	}

	public boolean matchPassword(String pw) {
		return pw.equals(pw);
	}

	public void changePassword(String newPw) {
		this.pw = newPw;
	}

}

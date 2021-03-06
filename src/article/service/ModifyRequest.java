package article.service;

import java.util.Map;

public class ModifyRequest {

	private String userId;
	private int articleNumber;
	private String header;
	private String title;
	private String content;
	private String newfile;
	private String newfile2;

	public ModifyRequest(String userId, int articleNumber, String header,String title, String content, String new1, String newfile2) {
		this.userId = userId;
		this.articleNumber = articleNumber;
		this.header = header;
		this.title = title;
		this.content = content;
		this.newfile = new1;
		this.newfile2 = newfile2;
	}

	public String getUserId() {
		return userId;
	}

	public int getArticleNumber() {
		return articleNumber;
	}

	public String getHeader(){
		return header;
	}
	
	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getFilename1(){
		return newfile;
	}
	
	public String getFilename2(){
		return newfile2;
	}
	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}

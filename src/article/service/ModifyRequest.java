package article.service;

import java.util.Map;

public class ModifyRequest {

	private String userId;
	private int articleNumber;
	private String header;
	private String title;
	private String content;
	private String filename;

	public ModifyRequest(String userId, int articleNumber, String header,String title, String content, String filename) {
		this.userId = userId;
		this.articleNumber = articleNumber;
		this.header = header;
		this.title = title;
		this.content = content;
		this.filename = filename;
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

	public String getFilename(){
		return filename;
	}
	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}

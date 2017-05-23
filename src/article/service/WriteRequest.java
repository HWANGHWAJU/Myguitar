package article.service;

import java.util.Map;

import article.model.AWriter;
//악보 게시판에 글 쓰기 글 쓰는데 필요한 데이터 제공 
public class WriteRequest {

	private String header;
	private AWriter writer;
	private String title;
	private String content;
	private String filename1;
	private String filename2;

	public WriteRequest(String header,AWriter writer, String title, String content, String filename1, String filename2) {
		this.header = header;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.filename1 = filename1;
		this.filename2 = filename2;
	}

	public String getHeader(){
		return header;
	}
	
	public AWriter getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}
	
	public String getFilename1(){
		return filename1;
	}
	
	public String getFilename2(){
		return filename2;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}

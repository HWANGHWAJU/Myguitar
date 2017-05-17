package article.service;

import java.util.Map;

import article.model.AWriter;
//악보 게시판에 글 쓰기 글 쓰는데 필요한 데이터 제공 
public class WriteRequest {

	private String header;
	private AWriter writer;
	private String title;
	private String content;
	private String filename;

	public WriteRequest(String header,AWriter writer, String title, String content, String filename) {
		this.header = header;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.filename = filename;
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
	
	public String getFilename(){
		return filename;
	}

	public void validate(Map<String, Boolean> errors) {
		if (title == null || title.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}
}

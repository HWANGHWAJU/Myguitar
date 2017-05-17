package article.model;

//해당 번호의 악보의 정보를 담을 클래스 

public class ArticleContent {

	private Integer number;
	private String content;
	private String filename;
	
	
	public ArticleContent(Integer number, String content, String filename) {
		this.number = number;
		this.content = content;
		this.filename=filename;
	}

	public Integer getNumber() {
		return number;
	}

	public String getContent() {
		return content;
	}
	
	public String getFilename(){
		return filename;
	}

}

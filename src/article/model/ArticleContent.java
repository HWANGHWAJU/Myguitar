package article.model;

//해당 번호의 악보의 정보를 담을 클래스 

public class ArticleContent {

	private Integer number;
	private String content;
	private String filename1;
	private String filename2;
	
	
	public ArticleContent(Integer number, String content, String filename1, String filename2) {
		this.number = number;
		this.content = content;
		this.filename1=filename1;
		this.filename2=filename2;
	}

	public Integer getNumber() {
		return number;
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

}

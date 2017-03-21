package article.model;

//1. 악보 게시글의 기본 데이터를 저장할 클래스 

public class Article {

	private Integer number;
	private Writer writerid;
	private String title;
	private int readCount;

	public Article(Integer number, String title,  Writer writerid, 	 int readCount) {
		this.number = number;
		this.writerid = writerid;
		this.title = title;
		this.readCount = readCount;
	}

	public Integer getNumber() {
		return number;
	}

	public Writer getWriterid() {
		return writerid;
	}

	public String getTitle() {
		return title;
	}

	public int getReadCount() {
		return readCount;
	}

}

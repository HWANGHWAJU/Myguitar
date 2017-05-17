package article.model;

//1. 악보 게시글의 기본 데이터를 저장할 클래스 

public class Article {

	private String header;
	private Integer number;
	private AWriter writerid;
	private String title;
	private String date;
	private int readCount;

	public Article(String header,Integer number, String title,  AWriter writerid, String date,	 int readCount) {
		this.header = header;
		this.number = number;
		this.writerid = writerid;
		this.title = title;
		this.date = date;
		this.readCount = readCount;
	}

	
	public String getHeader(){
		return header;
	}
	
	public Integer getNumber() {
		return number;
	}

	public AWriter getWriterid() {
		return writerid;
	}

	public String getTitle() {
		return title;
	}

	public String getDate(){
		return date;
	}
	public int getReadCount() {
		return readCount;
	}

}

package article.model;
//모든 게시글의 작성자 정보를 담을 코드 
public class Writer {

	private String id;
//	private String name;
//String name
	public Writer(String id ) {
		this.id = id;
	//	this.name = name;
	}

	public String getId() {
		return id;
	}

/*	public String getName() {
		return name;
	}
*/
}

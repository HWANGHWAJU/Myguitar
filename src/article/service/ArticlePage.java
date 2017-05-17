package article.service;

import java.util.List;

import article.model.Article;
//현재 페이지의 정보를 제공할 클래스 객체, 이미 listService.getArticlePage를 통해 리스트가 완료 
public class ArticlePage {

	private int total;
	private int currentPage;
	private List<Article> content;
	private int totalPages;
	private int startPage;
	private int endPage;

						//DB에서 count한 total, 선택한 현재페이지, 한 페이지에 표시될 개수 5개, content =result 배열 (게시글들 정보)
	public ArticlePage(int total, int currentPage, int size, List<Article> content) {
	
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if (total == 0) {	//게시글이 없습니다. 
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {					// 전체 레코드 수 total = 15, size = 5 , total pages = 3 
			totalPages = total / size;
			
			if (total % size > 0) {				//전체 레코드 수 15를 size 5로 나눈 나머지 값이 0이상, 남는 게시글이 있으면 totalpages 증가 
				totalPages++;
			}
			
			int modVal = currentPage % 5;				//현재 페이지 if 1 , %5 =0
			startPage = currentPage / 5 * 5 + 1;		// startPage = (currentPage / 5 = 0 ) * 5 + 1 = 1; 
			if (modVal == 0) startPage -= 5;
			
			//게시글 하단에 첫 페이지 수 표시. 5개로 제한 
			
			endPage = startPage + 4;
			if (endPage > totalPages) endPage = totalPages;
			
			//게시글 하단에 마지막 페이지 수 표시 
		}
	}
	
	
	public int getTotal() {
		return total;
	}

	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<Article> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
}

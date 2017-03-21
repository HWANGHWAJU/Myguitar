package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticlePage;
import article.service.ListArticleService;
import mvc.command.CommandHandler;


//listarticleservice 객체 선언! 
//리스트 pageNo를 받아와서 pageNoVal 값에 입력 
//만약 pageNo가 없으면 1페이지부터 시작하니까! pageNo을 1로 선언 
//pageNoVal 값이 null이 아닐 때 pageNo값에 integer 형으로 변환한 숫자를 입력
//새로 articlepage를 생성하고 미리 생성한 listarticleservice에 pageNo 값을 넣어 articlepage로 전달 
//listhandler가 호출된 곳에 articlePage 객체를 전달 후 악보 리스트가 나타날 화면에 출력 
//그럼! 이 핸들러를 통해 전달되는 값은 
//articlePage에 pageNo가 입력되어 도출된 값들이 전달됨.  


public class ListArticleHandler implements CommandHandler {

	private ListArticleService listService = new ListArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		ArticlePage articlePage = listService.getArticlePage(pageNo);
		req.setAttribute("articlePage", articlePage);
		return "/WebContent/guitar/Music.jsp";
	}

}

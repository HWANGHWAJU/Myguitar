package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.LoginFailException;
import auth.service.LoginService;
import auth.service.User;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WebContent/guitar/LoginForm.jsp";	//로그인 실패시 돌아가 비춰줄 화면 
	private LoginService loginService = new LoginService(); 	//로그인 서비스 객체 생성

	//로그인 데이터 전달시 전당 방법에 따른 변화 
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {	
	
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	
	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}								//get 방법으로 보냈을 때 오류 다시 로그인 화면으로 

	
	//post 로 데이터 전송시 
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 	throws Exception {
	
		String id = trim(req.getParameter("id"));
		String pw = trim(req.getParameter("pw"));

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		
			//id 나 pw가 입력받지 않았거나 공백이 있을 때
		if (id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if (pw == null || pw.isEmpty())
			errors.put("password", Boolean.TRUE);
																
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}	//error가 공백이 아닌 값이 있을 때 오류가 있을 때 로그인 폼으로 다시! 

		//오류가 없을 때 디비의 값과 비교하여 확인. 
		try {
			User user = loginService.login(id, pw);
			req.getSession().setAttribute("authUser", user);
			res.sendRedirect(req.getContextPath() + "/index.jsp");
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	
	
	
	
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}

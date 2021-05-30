파일명 : AnnoMapping
-- java
@Webservlet("/13Sevlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		// request영역에 속성저장
		req.setAttribute("message","@Webservlet으로 매핑");
		// view로 포워드
		req.getRequestDispatcher("/13Sevlet/AnnoMapping.jsp").forward(req,resp);
		
		}


}

파일명 : FrontController
@Webservlet("*.one")
public class FrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		// 호스트명을 제외한 나머지 URL을 얻어옴
		String uri = req.getRequestURI();
		// uri의 제일 마지막 문자열을 얻어오기 위해 /의 index를 얻는다.
		int lastSlash = uri.lastIndexOf("/");
		// 요청명의 제일 마지막 문자열을 얻어온다.
		String commandStr = uri.substring(lastSlash);
		
		// 마지막 요청명을 비교해서 각 처리를 위한 메소드를 호출한다.
		if(commandStr.equals("/regist.one")){
			registFunc(req);
		}else if(commandStr.equals("/login.one")){
			loginFunc(req);
		}else if(commandStr.equals("/freeboard.one")){
			freeboardFunc(req);
		}
		
		// request영역에 속성 저장 후 View로 포워드 한다.
		req.setAttribute("uri",uri);
		req.setAttribute("commandStr",commandStr);
		req.getRequestDispatcher("/13Sevlet/FrontController.jsp").forward(req, resp);
		
		
		
		
	}
	
	
	void registFunc(HttpServletRequest req){
		req.setAttribute("resultValue","<h3>회원가입</h3>");
	}
	
	void loginFunc(HttpServletRequest req){
		req.setAttribute("resultValue","<h3>로그인</h3>");
	}
	
	void freeboardFunc(HttpServletRequest req){
		req.setAttribute("resultValue","<h3>자유게시판</h3>");
	}
	
	
}


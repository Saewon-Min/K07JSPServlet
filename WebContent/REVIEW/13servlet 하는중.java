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

파일명 : HelloServlet.java
/*
서블릿 클래스 작성시
1. HttpServlet클래스를 상속한다.
2. 요청을 받을 doGet() 혹은 doPost()메소드를 오버라이딩 한다.
3. 2번의 메소드를 오버라이딩 시 요청을 받기 위한 request객체와
	응답을 하기 위한 response객체가 매개변수로 정의된다.
*/
public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		
		/*
		request영역에 속성을 저장한다.
			: 서블릿에서 request영역을 사용하기 위해 해당 메소드에는
			HttpServletRequest 타입의 매개변수가 있다. 사용자의 모든
			요청을 받을 수 있고, 또한 request 내장객체의 모든 기능을 
			사용할 수 있다.
		*/
		req.setAttribute("message","hello-servlet");
		
		/*
		View에 해당하는 jsp페이지에 포워드한다. 그러면 request영역에
		저장된 데이터가 공유되어 출력할 수 있다. 즉, 서블릿은 영역을
		이용해서 jsp쪽으로 데이터(객체)를 전달하게 된다.
		*/
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp).forward(req, resp);
	}
	
}



파일명 : MemberAuth.java
public class MemberAuth extends HttpServlet {
	
	// DAO객체를 멤버변수로 선언하여 모든 메소드에서 사용한다.
	MemberDAO dao;
	
	/*
	서블릿 수명주기 메소드에서 서블릿 객체 생성시 최초로 한번만
	호출되는 메소드로, 여기서는 db연결을 담당한다.
	*/
	@Override
	public void init() throws ServletException{
		ServletContext application = this.getServletContext();
		String driver = application.getInitPatamenter("JDBCDriver");
		String connectUrl = application.getInitPatamenter("ConnectionURL");
		
		dao = new MemberDAO(driver, connectUrl);
		
		
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
				
				
		//서블릿 초기화 파라미터를 얻어온다.
		String admin_id = this.getInitPatamenter("admin_id");
		
		//View에서 전송한 파라미터를 얻어온다.
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		// DAO의 메소드를 통해 회원인증 처리를 한다.
		MemberDTO memberDTO = dao.getMemberDTO(id,pass0;
		
		String memberName = memberDTO.getName();
		if(memberName != null){
			
		
			
			
			
		}
	
	
	
	
}

















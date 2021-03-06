<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeAction.jsp</title>
</head>
<body>
	<% 
	// include 할 페이지의 경로를 String으로 설정함
	String directivePath = "./include/DirectivePage.jsp";
	String actionTagPath = "./include/ActionTagPage.jsp";
	
	// 페이지영역, 리퀘스트영역에 속성을 저장함
	pageContext.setAttribute("pageVar","페이지 영역에 저장");
	request.setAttribute("requestVar", "리퀘스트 영역에 저장");
	%>
	
	<h2>include 액션태그</h2>
	
	<!-- 
		지시어(Directive)를 통한 include는 표현식을 사용할 수 없다.
		반드시 문자열로 기술해야 한다.
	 -->
	<h3>include 지시어로 페이지 포함하기</h3> 
	<%--@ include file="<%=directivePath %>" --%>	
	<%@ include file="./include/DirectivePage.jsp" %>
	
	
	<!-- 
		액션태그의 경우에는 표현식, String 두가지 모두 사용할수있다.
	 -->
	<h3>include 액션태그로 페이지 포함하기</h3>
	<jsp:include page="<%=actionTagPath %>"/>
	<jsp:include page="./include/ActionTagPage.jsp"/>
	
	
	<!-- 
		include 지시어와 액션태그의 차이점
		
		[지시어]
			- jsp소스를 그대로 포함시킨 후 페이지를 실행(컴파일)한다.
			- 즉, 현재 페이지와 같은 페이지를 의미한다.
			
		[액션태그]
			- jsp소스를 먼저 실행한 후 실행된 결과를 포함시킨다.
			- 따라서 기존 페이지에서 선언된 변수는 포함시킨 페이지에서
				사용할 수 없다.
			- 다른 페이지를 의미하므로 page 영역은 공유되지 않는다.
			- 하지만 forward와 같이 request 영역은 공유된다.
	 -->
	<h2>각각의 포함된 페이지 안에서 선언한 변수 사용하기</h2>
	
	<h3>디렉티브 페이지에서 선언한 변수 사용</h3>
	변수 출력 : <%=dirString %>
	
	<h3>액션태그 페이지에서 선언한 변수 사용</h3>
	변수 출력 : <%--=actionString --%>
	
	<!-- 
		변수 선언시
		지시어는 파일을 그대로 가져와서 사용하므로 메소드 사용이 가능하고
		액션태그는 파일의 결과만을 가져오기 때문에 html의 기능만 살아있다.
		때문에 변수를 가져와서 사용할 경우 지시어를 사용하는 것이 좋다.
		
		결론적으로 JSP코드가 있는 jsp를 포함시킬때는 지시어를 사용하고
		JSP코드가 없는 jsp를 포함시킬때는 액션태그를 사용한다.
		
		대부분의 경우에는 지시어를 사용하여 파일 전체를 읽어온다.
	 -->
	
	
</body>
</html>
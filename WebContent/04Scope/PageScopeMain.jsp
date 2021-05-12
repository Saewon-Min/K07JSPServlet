<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
/*
JSP의 모든 영역(page, request, session, application)에는 모든
타입의 객체를 저장할 수 있다. Object 타입으로 자동 형변환되어
저장되고, 사용시에는 각 객체로 형변환후 사용하면 된다.
차후 EL, JSTL에서 주로 해당 영역을 사용하게 된다.
*/
pageContext.setAttribute("pageNumber", 1000); // Integer객체(Wrapper클래스)
pageContext.setAttribute("pageString", "페이지영역에 저장한 문자열"); //String 객체
pageContext.setAttribute("pageDate", new Date()); // Date객체

/*
	개발자가 정의한 DTO객체를 초기화 한 후 page영역에 저장한다.
*/
MemberDTO member1 = new MemberDTO();

member1.setId("KOSMO");
member1.setName("한국소프트웨어인재개발원");
member1.setPass("가산1234");
member1.setRegidate(java.sql.Date.valueOf("2017-12-31"));
pageContext.setAttribute("pageMember1",member1); // setter를 통해 초기화

pageContext.setAttribute("pageMember2",
		new MemberDTO("saewon","1234","민세원",null)); // 생성자를 통해 초기화


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageScopeMain.jsp</title>
</head>
<body>
	<h2>page영역에 저장된 속성값 읽어오기</h2>
	<%
	Object obj = pageContext.getAttribute("pageDate");
	String dateString = "";
	if(obj instanceof Date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dateString = sdf.format((Date)obj);
	}
	
	MemberDTO m1 = (MemberDTO)pageContext.getAttribute("pageMember1");
	String m1Str = String.format("아이디:%s , 비번:%s , 이름:%s , 가입일:%s",
			m1.getId(),
			m1.getPass(),
			m1.getName(),
			m1.getRegidate()
			);
	
	MemberDTO m2 = (MemberDTO)pageContext.getAttribute("pageMember2");
	
	%>
	
	<ul>
		<li>Integer 타입 : <%=pageContext.getAttribute("pageNumber") %></li>
		<li>String 타입 : <%=pageContext.getAttribute("pageString") %></li>
		<li>Date 타입 : <%=dateString%></li>
		<li>MemberDTO 타입1 : <%=m1Str%></li>
		<li>MemberDTO 타입2 : 아이디 : <%=m2.getId()%>,
								비번 : <%=m2.getPass()%>,
								이름 : <%=m2.getName()%>,
								가입일 : <%=m2.getRegidate() %></li>
	
	</ul>
	
	<%--
		page영역에 저장된 속성값은 새로운 페이지에 대한 요청이
		발생되면 속성값이 모두 파괴되어 소멸된다.
		즉, 다른 페이지와는 속성이 공유되지 않는다.
	
	 --%>
	<h2>페이지 이동</h2>
	<a href="PageResult.jsp">
		page영역 공유 확인을 위한 링크
	</a>
	<br />
	
	<%--
		외부파일을 include 하는 것은 해당 파일을 원본그대로
		현재문서에 포함시킨 후 컴파일 되므로 include지시어를
		사용하는 경우 같은 페이지로 취급되어 페이지 영역이 공유된다.
	 --%>
	<%@ include file = "PageInclude.jsp" %>
	
	
</body>
</html>

































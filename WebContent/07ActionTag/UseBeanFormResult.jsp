<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 한글처리
request.setCharacterEncoding("UTF-8");

// 폼값 받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

// DTO 객체(자바빈)생성
MemberDTO member1 = new MemberDTO();

// setter를 통해 값 설정
member1.setId(id);
member1.setPass(pass);
member1.setName(name);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>useBean 액션태그로 폼의 하위요소 값 받기</h2>

	<!-- 
		DTO객체의 getter()를 통해 출력
	 -->
	<h3>자바코드를 통해 받기</h3>
	<ul>
		<lu><%=member1.getId() %></lu>
		<lu><%=member1.getPass() %></lu>
		<lu><%=member1.getName() %></lu>
	</ul>
	
	
	<%-- 
		useBean을 통해 객체 생성시 scope속성을 지정하지 않으면
		가장 좁은 page 영역에 저장된다. 자바빈을 생성한 후 전송된
		폼 값을 한번에 설정한다.
		폼의 name속성과 1:1로 매칭되는 DTO의 멤버변수들이 있기때문에
		이와 같은 작업이 가능하게 된다.
	 --%>
	<!-- 
		scope속성이 빠지면 제일 작은 영역에 저장됨 : page영역
	 -->
	<h3>액션 태그로 폼값 받기</h3>
	<jsp:useBean id="actionMember" class="model.MemberDTO"></jsp:useBean>
	<!-- *를 통해 폼 값을 한번에 받을 수 있다. -->
	<jsp:setProperty name="actionMember" property="*"></jsp:setProperty>
	
	<ul>
		<li><%=actionMember.getId() %></li>
		<li><%=actionMember.getPass() %></li>
		<li><%=actionMember.getName() %></li>
	</ul>
	
</body>
</html>
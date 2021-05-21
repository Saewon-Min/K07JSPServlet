<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL의 param 내장객체로 파라미터 읽기</h2>
	
	<h3>자바코드로 영역 및 파라미터 읽기</h3>
	
	<h4>영역에 저장된 값</h4>
	<%
	/*
	JSP코드를 통해 영역에 저장된 속성을 가져올때는
	1. getAttribute()으로 속성을 얻어온다.
	2. 형변환 한다.
	3. getter로 저장된 값을 출력한다.
	*/
	MemberDTO member = (MemberDTO)request.getAttribute("dtoObj");
	%>
	<ul>
		<li>
			MemberDTO객체 : <%=String.format("아이디:%s, 비번:%s, 이름:%s",
					member.getId(),
					member.getPass(),
					member.getName()) %>
		
		</li>
		
		<!-- 
		String, Integer와 같은 기본 객체는 별도의 형변환없이 사용할 수 있다. 
		-->
		<li>
			String객체 : <%=request.getAttribute("strObj") %>
		</li>
		<li>
			Integer객체 : <%=request.getAttribute("IntegerObj") %>
		</li>
	
	</ul>
	
	<h4>파라미터로 전달된 값 읽기</h4>
	<%
	/*
	파라미터로 전달되는 값은 항상 String형이므로 산술연산을 위해서는 반드시
	int형으로 변환해줘야 한다.
	*/
	int fNum = Integer.parseInt(request.getParameter("firstNum"));
	int sNum = Integer.parseInt(request.getParameter("secondNum"));

	%>
	두 파라미터의 합 : <%=fNum+sNum %>
	
	<!--  
	영역에 저장된 속성명이 중복되지 않았다면 xxxScope 내장객체를 사용없이 
	읽어올 수 있고, 형변환도 별도로 필요 하지 않다.
	또한 산술연산시 int형으로 변환도 필요없다.
	getter의 호출없이 멤버변수의 이름만으로 저장된 값을 바로 읽어 
	출력할 수 있다. 따라서 JSP코드를 사용할때보다 EL을 사용하면
	훨씬 간편해진다.
	-->
	<h3>EL로 영역과 파라미터로 전달된 값 읽기</h3>
	<h4>영역에 저장된 값</h4>
	<ul>
		<li>MemberDTO객체 : 
			아이디 : ${dtoObj.id },
			비밀번호 : ${dtoObj.pass },
			이름 : ${dtoObj.name }
		</li>
		<!--  
		속성명이 유일하다면 영역은 지정하지 않아도된다.
		-->
		<li>String객체 : ${requestScope.strObj }</li>
		<li>Integer객체 : ${IntegerObj }</li>
		
		
	</ul>
	
	<!--  
	EL의 param내장객체를 통해 파라미터를 읽을때
		
		1. param.폼명
		2. parma['폼명']
		3. parma["폼명"] 
		
		위의 세가지 모두 표현 가능
	-->
	<h4>파라미터로 전달된 값의 합</h4>
	<ul>
		<li> ${param.firstNum + param['secondNum'] }</li> <!-- 500 -->
		<li> ${param.firstNum} + ${param["secondNum"] }</li> <!-- 200 + 300 -->
	
	</ul>
	
	
	
	
	
</body>
</html>
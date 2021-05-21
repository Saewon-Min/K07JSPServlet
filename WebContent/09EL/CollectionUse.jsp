<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List 컬렉션</h2>
	<%
	ArrayList<Object> aList = new ArrayList<Object>();
	// String 객체, Person객체를 각각 저장
	aList.add("청해진");
	aList.add(new Person("장보고",28));
	// page영역에 속성 저장
	pageContext.setAttribute("Ocean", aList);
	
	%>
	<ul>
		<li>0번째요소 : ${Ocean[0] }</li><!-- String객체 출력 -->
		<!--  
		List계열의 컬렉션은 배열과 같이 index를 통해 접근한다.
		멤버변수명 만으로 출력이 가능한 이유는 getter가 있기때문이다.
		즉, getter가 없다면 에러가 발생한다.
		-->
		<li>1번째요소 : ${Ocean[1].name }, ${Ocean[1].age }</li>
		<li>2번째요소 : ${Ocean[2] }</li><!-- 출력 X, 에러X -->
	</ul>

	<h2>Map컬렉션</h2>
	<%
	Map<String, String> map = new HashMap<String, String>();
	map.put("한글","훈민정음");
	map.put("Eng","English");
	pageContext.setAttribute("King", map);
	
	%>
	<!--  
	Map컬렉션 사용시 key값으로 한글을 사용할 수 있다.
	단, EL에서 값을 읽을때 한글일 경우에는 .을 사용할 숭 ㅓㅄ다.
	반드시 배열 형태로 사용해야한다.
	-->
	<ul>
		<li>한글 key : ${King["한글"] }, ${King['한글'] },
			\${King.한글 }</li><!-- 앞에 \없으면 에러발생 -->
		<li>영문 key : ${King["Eng"] }, ${King['Eng'] },
			${King.Eng }</li>
  
	</ul>
	


</body>
</html>
































<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<% 
// 폼값으로 한글이 전송되는 경우 깨짐 처리
// web.xml에 필터 성정을 한 경우에는 기술하지 않아도 됨 
request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파라미터 값 받기</h2>
	
	<h3>JSP(자바코드)로 받기</h3>
	<ul>
		<li>
			이름 : <%=request.getParameter("name") %>
		</li>
		<li>
			성별 : <%=request.getParameter("gender") %>
		</li>
		<li>
			관심사항 : 
			<% 
			/*
			체크박스의 경우 2개 이상의 값이 전송될수 있으므로
			String 타입의 배열로 폼값을 받아서 처리한다.
			*/
			String[] inters = request.getParameterValues("inter");
			for(String s : inters){
				out.println(s+" ");
			} %>
		
		</li>
		<li>
			학력 : <%=request.getParameter("grade") %>
		</li>
		
	</ul>
	
	
	<%--   
	EL로 폼 값을 받을때는 EL내장객체를 사용한다.
		text, radio와 같은 폼값은 ${param.폼명}
		checkbox와 같은 다중 폼값은 ${paramValues.폼명}
		
		또한 쿼리스트링으로 전달되는 파라미터도 동일하게 받을 수 있다.
		웹 URL?nowPage=10 	=> 	${param.nowPage}
	
	--%>
	<h3>EL로 받기</h3>
	<ul>
		<li>이름 : ${param.name }</li>
		<li>성별 : ${param.gender }</li>
		<li>관심사항 :
			<!-- 
			[for-each문]
			for(String s : items){}
			items:배열, s:출력변수
			
			
			[JSTL의 foreach문]
			items:배열 var:출력변수
			
			JSTL의 forEach태그는 JAVA의 확장for문과 동일한 역할을 한다.
			items속성에 지정한 배열에 있는 요소를 하나씩 꺼내
			var속성에 지정한 변수에 할당하면서 반복한다.
			 -->
			<c:forEach items="${paramValues.inter }" var="s">
				${s }&nbsp;
			</c:forEach>
		</li>
		<li>학력 : ${param.grade }</li>
	
	</ul>
	
	
	
	
	
	
	
	
	
	
</body>
</html>
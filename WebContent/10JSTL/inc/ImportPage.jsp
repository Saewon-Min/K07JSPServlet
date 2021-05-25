<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 

request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>포함된 페이지 (ImportPage.jsp)</h4>
	<hr />
	<h5>리퀘스트 영역에 저장된 속성값</h5>
	저장된 값(방법1) : ${requestVar }
	<br />
	저장된 값(방법2) : ${requestScope.requestVar }
	<br />
	<h5>파라미터로 전단될 값</h5>
	파라미터1 : ${param.user_id }
	<br />
	파라미터2 : ${param.user_pw }
<hr />



</body>
</html>
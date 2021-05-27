<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC 패턴으로 회원인증하기</h2>
	<p>
		<strong>${authMessage }</strong>
		<br />
		<a href="./MemberAuth.mvc?id=test&pass=1234">회원인증1</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=pro1&pass=p1234">회원인증2</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=ididid&pass=1234">회원인증3</a>
		&nbsp;&nbsp;
	
	</p>
	
	
	
	
</body>
</html>
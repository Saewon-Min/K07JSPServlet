<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("cache-control", "no-cache");

response.setContentType("binary/octect-stream");

long time = new Date().getTime();
System.out.println(time);
response.setDateHeader("currntDate", time);

SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
time = simple.parse("2017-12-31 10:30").getTime();
System.out.println(time);
response.addDateHeader("currentDate2", time);

response.addIntHeader("numberOfCrew", 100);
response.setIntHeader("numberOfCrew", 99);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader.jsp</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	
	for(String headerName : headerNames){
		String headerValue = response.getHeader(headerName);
	
	%>
		<li><%=headerName %> : <%=headerValue %></li>
	<%
	}
	%>
	
	<h2>응답헤더명 존재여부 확인하기</h2>
	<h3>currentDate 응답헤더명</h3>
	<%=response.containsHeader("currentDate")  ?
		"존재함":"존재하지않음"%>
		
	<h3>Content-type 응답헤더명</h3>
	<%=response.containsHeader("Content-type")  ?
		"존재함":"존재하지않음"%>
</body>
</html>















<%@page import="java.util.TimeZone"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="today" value="<%=new java.util.Date() %>" />
	
	<h4>날짜 포맷</h4><!-- type="date" : 날짜만 표시 -->
	full : <fmt:formatDate value="${today }" type="date" dateStyle="full" />
	<br />	
	short : <fmt:formatDate value="${today }" type="date" dateStyle="short" />
	<br />
	long : <fmt:formatDate value="${today }" type="date" dateStyle="long" />
	<br />
	default : <fmt:formatDate value="${today }" type="date" dateStyle="default" />
	<br />
	
	<h4>시간 포맷</h4><!-- type="time" : 시간만 표시 -->
	full : <fmt:formatDate value="${today }" type="time" dateStyle="full" />
	<br />	
	short : <fmt:formatDate value="${today }" type="time" dateStyle="short" />
	<br />
	long : <fmt:formatDate value="${today }" type="time" dateStyle="long" />
	<br />
	default : <fmt:formatDate value="${today }" type="time" dateStyle="default" />
	<br />
	
	
	<h4>날짜/시간 표시</h4><!-- type="both" : 시간/날짜 둘 다 표시 -->
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	<br />	
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
	<br />
	
	
	
	<h4>타임존 설정</h4>
	<!-- GMT : 세계 표준시로 영국의 그리니치 천문대를 기준으로 한다 -->
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
		<br />	
	</fmt:timeZone>

	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both"  dateStyle="full" timeStyle="full"/>
		<br />
	</fmt:timeZone>
	
	<!-- 그리니치 천문대 기준으로 한국의 시간은 +9시간
		표준시(GMT)에 9를 더하면 KST(대한민국표준시)가 된다. -->
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate value="${today }" type="both"  dateStyle="full" timeStyle="full"/>
		<br />
	</fmt:timeZone>
	
	
	<fmt:timeZone value="Asia/Seoul">
		<fmt:formatDate value="${today }" type="both"  dateStyle="full" timeStyle="full"/>
		<br />
	</fmt:timeZone>
	
	<h4>timeZone에 사용할 수 있는 문자열 구하기</h4>
	<c:forEach var="ids" items="<%=TimeZone.getAvailableIDs() %>">
		${ids }
		<br />
	</c:forEach>
	
	
	
	


</body>
</html>
<%@page import="model.MemberDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageResult.jsp</title>
</head>
<body>
	<h2>이전페이지에서 저장한 페이지영역의 속성 읽기</h2>
	<%
	/*
	page영역에 저장된 속성을 읽어온다.
	영역에 저장될때는 Object형으로 자동형변환 되므로, 
	읽어올때도 Object형으로 가져오게 된다.
	*/
	Object obj = pageContext.getAttribute("pageDate");
	String dateString = "";
	
	// 해당 객체가 Date형으로 형변환 가능한지 확인함
	if(obj instanceof Date){ // 실질적으로 이렇게 쓰지 않음
 		// 만일 형변환이 가능하다면 변환 후 사용한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dateString = sdf.format((Date)obj);
	}
	
	
	/*
	DTO객체에 저장된 각 속성들을 getter()를 통해 문자열로 가져온후
	하나의 String객체를 만들게 된다.
	*/
	// Object 타입을 MemberDTO타입으로 형변환
	MemberDTO m1 = (MemberDTO)pageContext.getAttribute("pageMember1");
	String m1Str = String.format("아이디:%s,비번:%s,이름:%s,가입일:%s",
						m1!=null ? m1.getId():"",
						m1!=null ? m1.getPass():"",
						m1!=null ? m1.getName():"",
						m1!=null ? m1.getRegidate():"");
	%>	
	<ul>
		<li>Date객체 : <%=dateString %></li>
		<li>MemberDTO객체 : <%=m1Str %></li>
	</ul>

</body>

</html>
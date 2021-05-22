

<%@page import="utils.JSFunction"%>
<%@page import="homework.MembershipDAO"%>
<%@page import="homework.MembershipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>


<% 
	// 폼값 받기
	String userId = request.getParameter("user_id"); 
	String userPass = request.getParameter("pass1"); 
	String name = request.getParameter("name"); 
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthday"); 
	String zipcode = request.getParameter("zipcode"); 
	String address1 = request.getParameter("address1"); 
	String address2 = request.getParameter("address2"); 
	String email1 = request.getParameter("email1"); 
	String email2 = request.getParameter("email2"); 
	String mobile1 = request.getParameter("mobile1"); 
	String mobile2 = request.getParameter("mobile2"); 
	String mobile3 = request.getParameter("mobile3"); 
	String tel1 = request.getParameter("tel1"); 
	String tel2 = request.getParameter("tel2"); 
	String tel3 = request.getParameter("tel3");
	
	
	// 폼값과 로그인 아이디를 저장하기 위한 DTO객체
	MembershipDTO dto = new MembershipDTO();
	
	dto.setId(userId);
	dto.setPass(userPass);
	dto.setName(name);
	dto.setGender(gender);
	dto.setBirth(birthday);
	dto.setZipcode(zipcode);
	dto.setAddress(address1+" "+address2);
	dto.setEmail(email1+"@"+email2);
	dto.setPhone(mobile1+"-"+mobile2+"-"+mobile3);
	dto.setHomephone(tel1+"-"+tel2+"-"+tel3);
	


	// DAO객체 생성 및 쓰기 처리를 위한 메소드 호출
	MembershipDAO dao = new MembershipDAO(application);
	
	
	int iResult = dao.memberRegist(dto);
	dao.close();
	
	if(iResult==1){
		response.sendRedirect("memberRegistForm.jsp");
	}else{
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입이 완료되었습니다.</h2>
</body>
</html>
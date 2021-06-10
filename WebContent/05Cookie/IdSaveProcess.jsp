<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 전송된 폼 값을 받아온다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");

// 아이디 저장 체크박스를 체크한 경우 전송되는 폼값
String save_check = request.getParameter("save_check");
System.out.println(save_check);

// 문자열을 통해 인증처리 한다.
// 로그인 성공하는 경우
if("must".equals(user_id) && "1234".equals(user_pw)){
	// 아이디 저장 체크박스에 체크한 경우 쿠키를 생성한다.
	if(save_check !=null && save_check.equals("Y")){
		// 쿠키명 : loginId, 쿠키값 : 입력한 아이디, 유효시간 : 1일
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	
	// 체크박스에 체크하지 않은 경우 쿠키를 삭제한다.
	}else{
		CookieManager.deleteCookie(response, "loginId");
	}
	// 메세지를 경고창으로 띄우고 로그인 페이지로 이동한다.
	JSFunction.alertLocation("로그인 성공", "IdSaveMain.jsp", out);

// 로그인 실패하는 경우
}else{
	JSFunction.alertBack("로그인 실패", out);
}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdSaveProcess.jsp</title>
</head>
<body>

</body>
</html>
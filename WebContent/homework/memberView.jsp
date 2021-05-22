
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 파라미터 받기
String id = request.getParameter("id");// 일련번호
String searchField = request.getParameter("searchField");// 검색필드
String searchWord = request.getParameter("searchWord"); // 검색어

String queryStr = "";
if(searchWord != null){
	// 검색 파라미터 추가하기
	queryStr = "searchField="+searchField+"&searchWord="+searchWord;
}

MembershipDAO dao = new MembershipDAO(application);


// 파라미터로 전달된 아이디를 조회
MembershipDTO dto = dao.memberView(id);



dao.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberView.jsp</title>

</head>
<body>
	<h2>회원목록 - 상세보기(View)</h2>
	<!-- 
		회원제 게시판에서 게시물 삭제를 위해 상세보기에
		게시물의 일련번호를 hidden 입력상자를 삽입한다.
	 -->
	<form name="writeFrm">
	<!-- 
		hidden 입력상자는 화면상에 보이지는 않지만 해당 값이 전송되어
		로그인 한 회원이 작성자가 맞는지 확인한다.
	 -->
	<input type="hidden" name="id" value="<%=id%>"/>
	<table border="1" width="90%">
		<tr>
			<td>아이디</td>
			<td><%=dto.getId() %></td>
			<td>이름</td>
			<td><%= dto.getName() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= dto.getPass()%></td>
			<td>생년월일</td>
			<td><%= dto.getBirth() %></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><%=dto.getZipcode() %></td>
			<td>전체주소</td>
			<td><%=dto.getAddress() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%= dto.getEmail() %></td>
			<td>휴대폰번호</td>
			<td><%= dto.getPhone() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%= dto.getHomephone() %></td>
			<td>회원가입일</td>
			<td><%= dto.getRegidate() %></td>
		</tr>
		
		
		<tr>
			<td colspan="4" style="text-align: center">
			<button type="button" onclick="location.href='memberList.jsp?';">
				회원목록 바로가기
			</button>
			</td>
		
		</tr>
	
	</table>
	
	</form>

</body>
</html>
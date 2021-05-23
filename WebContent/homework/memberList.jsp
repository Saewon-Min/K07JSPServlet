<%@page import="utils.BoardPage"%>
<%@page import="homework.MembershipDTO"%>
<%@page import="java.util.List"%>
<%@page import="common.BoardConfig"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// application 내장객체를 인수로 DAO객체를 생성한다.(DB연결)
MembershipDAO dao = new MembershipDAO(application);

// 파라미터를 저장하기 위해 Map 컬렉션 생성
Map<String, Object> param = new HashMap<String, Object>();

// 검색에 대한 파라미터를 받아서 변수에 저장
String searchField = request.getParameter("searchField"); // 검색할 필드명
String searchWord = request.getParameter("searchWord"); // 검색할 이름


// 검색 파라미터 추가 위한 변수
String queryStr = ""; 

// 사용자가 검색을 했다면
if(searchWord != null){
	// 검색 필드와 검색어를 Map에 추가한다.
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
	
	// 검색 파라미터 추가하기
	queryStr = "searchField="+searchField+"&searchWord="+searchWord;
}

// 게시물의 전체 개수를 카운트하기 위한 메소드 호출
int totalCount = dao.selectCount(param);



/* 페이지 처리 start */
int pageSize = BoardConfig.PAGE_PER_SIZE; // 한페이지에 출력할 게시물의 개수
int blockPage = BoardConfig.PAGE_PER_BLOCK; // 한 블럭당 출력할 페이지번호의 개수
int totalPage = (int)Math.ceil((double)totalCount/pageSize); // 전체 페이지 수 계산
int pageNum = 1; // 목록 첫 진입시에는 무조건 1페이지로 지정

String pageTemp = request.getParameter("pageNum"); 

//만약 파라미터로 전달된 페이지번호가 있다면
if(pageTemp != null && !pageTemp.equals(""))
	// 해당 번호로 페이지 번호를 지정한다.
	pageNum = Integer.parseInt(pageTemp);

// 목록을 페이지별로 구분하기 위해 between에 사용할 값 계산
int start = (pageNum-1)*pageSize+1;
int end = pageNum * pageSize;

// 계산된 값은 Map컬렉션에 저장
param.put("start", start);
param.put("end", end);
System.out.println(start+" = "+end);
/* 페이지 처리 end */



// 목록에 실제 출력할 레코드를 얻어오기 위한 메소드 호출
List<MembershipDTO> boardLists = dao.memberList(param);  


// 자원해제(반납)
dao.close();



%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입 목록 보기(List)</h2>
	<%@ include file="./mainMenu.jsp" %>
	<!-- 검색폼 : 제목과 내용을 통해 검색할 수 있다. -->
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align='center'>
			<select name="searchField">
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>
	
	</table>
	</form>
	
	<!-- 목록 출력을 위한 테이블 -->
	<table border="1" width="90%">
	<tr>
		<th width="10%">번호</th>
		<th width="20%">아이디</th>
		<th width="15%">이름</th>
		<th width="20%">핸드폰번호</th>
		<th width="20%">이메일</th>
		<th width="15%">가입날짜</th>
	</tr>
<% 
// 컬렉션에 저장된 데이터가 없다면
if(boardLists.isEmpty()){
%>
	<tr>
		<td colspan="5" align="center">
			등록된 게시물이 없습니다.
		</td>
	
	</tr>
<% 
// 컬렉션에 저장된 데이터가 있다면 해당 내용을 반복하여 출력한다.
}else{
	int vNum = 0; // 목록의 가상 번호
	int countNum = 0; 
	// List컬렉션에 저장된 개수만큼 반복하기 위해 확장 for문 사용
	for(MembershipDTO dto : boardLists){
		// 게시물의 카운트 개수를 통해 가상번호 부여
		// 현재 페이지 번호를 적용해서 가상번호 계산
		vNum = totalCount - (((pageNum-1)*pageSize)+countNum++); //=> 페이지번호가 있을때
	
%>
		<!-- getter()를 통해 출력한다. -->
		<tr align="center">
			<td><%=vNum %></td>
			<td align="left">
				<a href="memberView.jsp?id=<%=dto.getId() %>&<%=queryStr%>"><%=dto.getId() %></a>
			</td>
			
			<td align="center" ><%=dto.getName() %></td>
			<td align="center" ><%=dto.getPhone() %></td>
			<td align="center" ><%=dto.getEmail() %></td>
			<td align="center" ><%=dto.getRegidate() %></td>
		</tr>
		
<% 		
	}
}
%>
	</table>
	<table border="1" width="90%">

		<tr align="center">
			<td>
		
				<%= BoardPage.pagingStr(totalCount,pageSize,
						blockPage, pageNum, request.getRequestURI(), queryStr) %>
			</td>

		</tr>
	</table>
	
</body>
</html>
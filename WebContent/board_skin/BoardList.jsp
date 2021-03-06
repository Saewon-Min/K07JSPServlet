
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./inc/boardHead.jsp" />

<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();

String keyField = request.getParameter("keyField");
String keyString = request.getParameter("keyString");

if(keyString != null){
	param.put("keyField", keyField);
	param.put("keyString", keyString);
	
}

int totalCount = dao.selectCount(param);

List<BoardDTO> boardLists = dao.selectList(param);

dao.close();





%>







<body>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>목록보기</small></h3>
			
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<select name="keyField" class="form-control">
							<option value="title">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="keyString"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:12px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
				</thead>				
				<tbody>
								 
				<%  
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
						for(BoardDTO dto : boardLists){
							// 게시물의 카운트 개수를 통해 가상번호 부여
							vNum = totalCount--;
					%>
							<!-- getter()를 통해 출력한다. -->
							<tr align="center">
								<td><%=vNum %></td>
								<td align="left">
									<a href="BoardView.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
								</td>
								<td align="center" ><%=dto.getId() %></td>
								<td align="center" ><%=dto.getVisitcount() %></td>
								<td align="center" ><%=dto.getPostdate() %></td>
							</tr>
							
					<% 		
						}
					}
					%>
				
				
				</tbody>
				
				
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn">Basic</button>
					<button type="button" class="btn btn-primary" onclick="location.href='BoardWrite.jsp';">글쓰기</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='Edit.jsp';">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList';">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>		
						<li class="page-item active"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>		
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div>				
			</div>		
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<jsp:include page="./inc/boardBottom.jsp" />
</div>
</body>
</html>


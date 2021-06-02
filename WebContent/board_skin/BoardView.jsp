<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./inc/boardHead.jsp" />
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);

dao.updateVisitCount(num);

BoardDTO dto = dao.selectView(num);
dao.close();


%>




<body>

<script type="text/javascript">
function isDelete(){
	var c = confirm("정말로 삭제하시겠습니까?");
	if(c){
		var f = document.writeFrm;
		f.method = "post";
		f.action = "DeleteProcess.jsp";
		f.submit();
		
	}
}



</script>

<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>내용보기</small></h3>
			<form name="writeFrm">
			<input type="hidden" name="num" value="<%=num%>"/>
			<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center table-active align-middle">작성자</th>
						<td><%=dto.getName() %></td>
						<th class="text-center table-active align-middle">작성일</th>
						<td><%= dto.getVisitcount() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">이메일</th>
						<td>hong@naver.com</td>
						<th class="text-center table-active align-middle">조회수</th>
						<td><%=dto.getVisitcount() %></td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">제목</th>
						<td colspan="3">
							<%=dto.getTitle() %>
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">내용</th>
						<td colspan="3" class="align-middle" style="height:200px;">
							<%=dto.getContent().replace("\r\n","<br>") %>
						</td>
					</tr>
					<tr>
						<th class="text-center table-active align-middle">첨부파일</th>
						<td colspan="3">
							파일명.jpg <a href="">[다운로드]</a>
						</td>
					</tr>
				</tbody>
				</table>
			</div>
			<div class="row mb-3">
				
				<div class="col-6">
					<% 
					/*
					로그인이 되었고, 동시에 해당 글의 작성자이면
					수정, 삭제 버튼을 보이게 처리한다.
					*/
					if(session.getAttribute("USER_ID") != null && 
						session.getAttribute("USER_ID").toString().equals(dto.getId())){
					%>
						<button type="button" class="btn btn-secondary"
							onclick="location.href = 'Edit.jsp?num=<%=dto.getNum() %>';">
							수정하기
						</button>
						<button type="button" class="btn btn-success" onclick="isDelete();">삭제하기</button>
						<button type="button" class="btn btn-info" onclick="">답글쓰기</button>
					
					<% 
					}
					%>
	
	
					
				</div>
				<div class="col-6 text-right pr-5">
					<!-- 각종 버튼 부분 -->
					<!-- <button type="button" class="btn">Basic</button> -->
					<!-- <button type="button" class="btn btn-primary" 
						onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
					<!-- 
					<button type="button" class="btn btn-light">Light</button>
					<button type="submit" class="btn btn-danger">전송하기</button>
					<button type="reset" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-link">Link</button> -->
					<button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="./inc/boardBottom.jsp" />
</div>
</body>
</html>

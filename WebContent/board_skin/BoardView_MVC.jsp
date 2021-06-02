<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./inc/boardHead.jsp" />
<body>



<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="./inc/boardLeft.jsp" />
		<div class="col-9 pt-3">
			<h3>게시판 - <small>내용보기</small></h3>
			<form name="writeFrm">
			
			<div class="row mt-3 mr-1">
				<table class="table table-bordered">
				<colgroup>
					<col width="20%"/>
					<col width="30%"/>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				    <tr>
				   	 <td>번호</td>
				   	 <td>${dto.idx }</td>
				   	 <td>작성자</td>
				   	 <td>${dto.name }</td>
				    </tr>
				    <tr>
				   	 <td>작성일</td>
				   	 <td>${dto.postdate }</td>
				   	 <td>조회수</td>
				   	 <td>${dto.visitcount }</td>
				    </tr>
				    <tr>
				   	 <td>제목</td>
				   	 <td colspan="3">${dto.title }</td>
				    </tr>
				    <tr>
				   	 <td>내용</td>
				   	 <td colspan="3" height="100">${dto.content }</td>
				    </tr>
				    <tr>
				   	 <td>첨부파일</td>
				   	 <td>
				   	 <!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 -->
				   	 <c:if test="${not empty dto.ofile }">
				   		 ${dto.ofile } <!-- 기존 파일명 출력 -->
				   		 <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">
				   			 [다운로드]
				   		 </a>   	 
				   	 </c:if>   	 
				   	 </td>
				   	 <td>다운로드수</td>
				   	 <td>${dto.downcount }</td>
				    </tr>
				
				
				</table>
			</div>
			<div class="row mb-3">
				
				<div class="col-6">
				<button type="button"  class="btn btn-important" onclick="location.href='../mvcboard/pass.mvc?mode=edit&idx=${param.idx}';">
					수정하기
				</button>
				<button type="button"  class="btn btn-danger" onclick="location.href='../mvcboard/pass.mvc?mode=delete&idx=${param.idx}';">
					삭제하기
				</button>
				<button type="button"  class="btn btn-warning" onclick="location.href='../mvcboard/list.mvc';">
					리스트바로가기
				</button>					
				</div>

				</form>
			</div>
		</div>
	</div>
	
	<h2>댓글쓰기</h2>
<script>
function commentValidate(f){
	if(f.name.value==""){
		alert("작성자를 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
	if(f.comments.value==""){
		alert("댓글 내용을 입력하세요");
		f.comments.focus();
		return false;
	}
}
</script>
<form name="commentFrm" method="post" action="./commentWrite.comm" onsubmit="return commentValidate(this);">
	<!-- 해당 게시물의 일련번호로 댓글 테이블의 참조키가 된다. -->
	<input type="hidden" name="board_idx" value="${param.idx }" />
	<table border="1" width="90%">
		<colgroup>
			<col width="30%"/>
			<col width="40%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<td>작성자 : <input type="text" name="name" size="10" /></td>
			<td colspan="2">비밀번호 : <input type="password" name="pass" size="10" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="comments" style="width:100%;height:70px;"></textarea>
			</td>
			<td><input type="submit" value="댓글쓰기" style="width:80px;height:77px;" /></td>
		</tr>
	</table>

</form>


<h2>댓글 목록</h2>
<script>
function commentEdit(idx, board_idx) {
	window.open('./commentEdit.comm?idx='+idx+'&board_idx='+board_idx
			,'commentPop1','top=0,left=0,width=700,height=300');
}

function commentDelete(idx, board_idx) {
	window.open('./commentDelete.comm?idx='+idx+'&board_idx='+board_idx
			,'commentPop','top=0,left=0,width=700,height=300');
}


</script>

<!-- 
	HTML5에서 지원하는 앵커(Ancher) 기능으로 해당 페이지에서 특정
	위치를 로드하고 싶을때 아래와 같이 <a태그에 name속성을 부여한다.
	사용시에는 쿼리스트링 마지막에 #앵커명 형태로 사용하면 된다.
-->
<a name="commentsList"></a>
<table border="1" width="90%">
	<colgroup>
		<col width="30%" />
		<col width="40%" />
		<col width="*" />
	</colgroup>
	<c:choose>
		<c:when test="${empty comments }">
			<tr>
				<td colspan="3" align="center">
					등록된 댓글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items= "${comments }" var="row" varStatus="loop">
				<tr>
					<td>작성자 : ${row.name }</td>
					<td>작성일 : ${row.postdate }</td>
					<td>
						<!-- 수정, 삭제를 위해 전달되는 파라미터는 댓글의 일련번호,
							해당 게시물의 일련번호 2개가 필요하다. -->
						<input type="button" value="수정" 
							onclick="commentEdit(${row.idx }, ${row.board_idx });"/>
						<input type="button" value="삭제" 
							onclick="commentDelete(${row.idx }, ${row.board_idx });"/>
						
					</td>
				</tr>
				<tr>
					<td colspan="3">${row.comments }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	
	</c:choose>


</table>
	
	
	
	<jsp:include page="./inc/boardBottom.jsp" />
</div>








</body>
</html>

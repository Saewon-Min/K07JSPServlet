
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="./inc/boardHead.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style >a{text-decoration: none;}</style>
</head>
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

			<c:choose>
				<c:when test="${empty boardLists }">
						<tr>
							<td colspan="5" align="center">
								등록된 게시물이 없습니다.
							</td>
						
						</tr>
		</c:when>
		<c:otherwise>
			<!-- 게시물이 있는 경우 확장 for문 형태의 forEach태그 사용 -->
			<c:forEach items="${boardLists }" var="row" varStatus="loop">
	
			<tr align="center">
				<td>
					${map.totalCount - (((map.pageNum-1) * map.pageSize)
						+ loop.index) }
				</td>
				<td align="left">
					<a href="../mvcboard/view.mvc?idx=${row.idx }">${row.title }</a>
				</td>
				<td>${row.name }</td>
				<td>${row.postdate }</td>
				<td>${row.visitcount }</td>
				<td>
				<!-- 첨부된 파일이 있는경우에만 다운로드 링크 출력됨 -->
				<c:if test="${not empty row.ofile }">
					<!-- 파일 다운로드 시 다운로드 횟수를 증가시켜야 하므로
						게시물의 일련번호가 필요함 -->
					<a href="../mvcboard/download.?ofile=${row.ofile 
						}&sfile=${row.sfile }&idx=${row.idx }">[Down]</a>
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
				
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
						<li class="page-item">${map.pagingImg }</li>
						
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


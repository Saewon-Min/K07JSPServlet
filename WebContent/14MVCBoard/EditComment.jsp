<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정하기</title>
<script type="text/javascript">
	function formValidate(f){
		if(f.name.value==""){
			alert("작성자를 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.postdate.value==""){
			alert("날짜를 입력하세요");
			f.postdate.focus();
			return false;
		}
		if(f.comments.value==""){
			alert("내용을 입력하세요");
			f.comments.focus();
			return false;
		}
	}
	
	function close() {
		window.close();
	}
	
</script>
</head>
<body>

<h2>댓글 수정하기(comment Edit)</h2>

<form name="writeFrm" method="post" 
	action="./commentEditAction.comm"
	onsubmit="return formValidate(this);">

	<input type="hid den" name="idx" value=${dto.idx } /><!-- 댓글 일련번호 -->	
	<input type="hid den" name="board_idx" value=${dto.board_idx } />
	<input type="hid den" name="pass" value=${dto.pass } />

<table border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" value="${dto.name }" />
		</td>
	
		<td>작성일</td>
		<td>
			<input type="text" name="postdate" style="width:90%;" value="${dto.postdate }" />
		</td>
	</tr>
	<tr>
		<td>댓글</td>
		<td colspan="3">
			<textarea name="comments" style="width:90%;height:100px;">${dto.comments }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">RESET</button>
			<button onclick="close();">
				댓글 리스트바로가기
			</button>
		</td>
	</tr>
</table>	
</form>
</body>
</html>


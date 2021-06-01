<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function deleteCheck() {
		var con = confirm("해당 댓글을 삭제하시겠습니까?");
		if(con==true){
			alert("댓글이 삭제되었습니다.");
			return true;
		}else{
			alert("삭제가 취소되었습니다.");
			return false;
		}
		
	}

</script>


</head>
<body>
	<h2>댓글 삭제 페이지</h2>
	<form name="writeFrm" method="post" 
	action="./commentDeleteAction.comm"
	onsubmit="return deleteCheck();">

	<input type="hid den" name="idx" value=${dto.idx } /><!-- 댓글 일련번호 -->	
	<input type="hid den" name="board_idx" value=${dto.board_idx } />
	<input type="hid den" name="pass" value=${dto.pass } />

<table border="1" width="90%">
	<tr>
		<td>
		작성자: <input type="text" name="name" style="width:150px;" value="${dto.name }" />
		</td>
	</tr>
	<tr>
		<td>
		작성일: <input type="text" name="postdate" style="width:90%;" value="${dto.postdate }" />
		</td>
	</tr>
	<tr>
		<td>
			<textarea name="comments" style="width:90%;height:100px;">${dto.comments }</textarea>
		</td>
	</tr>
	<tr>    
		<td >
			<button type="submit">삭제하기</button>
		</td>
	</tr>
</table>	
</form>
</body>
</html>
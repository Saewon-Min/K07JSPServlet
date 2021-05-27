<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeCycle.jsp</title>
</head>
<body>
	<script>
	/*
	javascript에서 전송방식을 결정한 후 서버로 전송한다. 
	*/
	function requestAction(frm, met){		
		if(met==1){
			frm.method = 'get';
		}
		else{
			frm.method = 'post';
		}
		frm.submit();
	}
	</script>
	<h2>서블릿 생명주기(Life Cycle) 메소드</h2>
	<!--  
		자바스크립트를 통해 폼값을 전송하므로 input태그는
		button타입으로 설정한다. 
	-->
	<form action="./LifeCycle.do">
		<input type="button" value="Get방식 요청하기" 
			onclick="requestAction(this.form, 1);" />
		<input type="button" value="Post방식 요청하기" 
			onclick="requestAction(this.form, 2);" />
	</form>
	<a href="./HelloServlet.do">HelloServlet 바로가기</a>
</body>
</html>

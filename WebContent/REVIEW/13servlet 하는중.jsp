파일명 : AnnoMapping
어노테이션으로 매핑하기
-- jsp
<p>
<strong> ${message }</Strong>
<a href="<%=request.getContentPath()%>">바로가기</a>
</p>



파일명 : FrontController
<h3>한번의 매핑으로 여러가지 요청 처리하기</h3>
-- 각 요청을 처리한 후 request 영역에 저장할 문자열을 출력
${resultValue } 
<ol>
	-- 요청명을 분석하여 처리할 메소드를 구분하기 위한 문자열
	<li>uri : ${uri }</li>
	<li>commandStr : ${commandStr }</li>

</ol>
<ul>
	<li><a href="../13Servlet/regist.one">회원가입</li>
	<li><a href="../13Servlet/login.one">로그인</li>
	<li><a href="../13Servlet/freeboard.one">자유게시판</li>
</ul>
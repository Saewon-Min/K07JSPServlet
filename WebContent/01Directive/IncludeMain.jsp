<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
include 지시어
	: 공통으로 사용할 JSP파일을 생성한 후 현재문서에 포함시킬때 사용한다.
	각각의 JSP파일 상단에는 반드시 page 지시어가 삽입되어야 한다.
	단, 하나의 JSP파일에서 page지시어가 중복선언되면 안된다.
	
	***page 지시어가 없으면 html과 다를게 없다.
 --%>

<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>

<link rel="stylesheet" href="./css/div_layout.css" />

</head>
<body>
	<div class="AllWrap">
		<div class="header">
		<!-- GNB영역 -->
		<%@ include file = "../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
			<!-- LNB영역(Local Navigation Bar) -->
			<%@ include file="../common/Left.jsp" %>
			</div>
			<div class="contents">
				<!-- Contents영역 -->
				<h2>오늘의 날짜 : <%=todayStr %></h2>
				<br /><br />
				(서울=연합뉴스) 오보람 기자 = 이달 굵직한 가수들이 
				잇달아 컴백을 예고하면서 곧 초여름에 접어드는 가요계가 
				더 달아오르고 있다.
				<br />
				그중에서도 한국 대중가수 최초의 미국 그래미 어워즈 
				후보 입성으로 최전성기를 달리고 있는 그룹 방탄소년단(BTS)이 
				단연 눈에 띈다.
				<br />
				이들은 두 번째 영어 신곡 '버터'(Butter)를 오는 21일 
				발표하며 6개월 만에 돌아온다.
				<br />
				앞서 '버터' 콘셉트 클립 영상 등을 공개한 방탄소년단은 
				10일 엘리베이터를 배경으로 정장을 입고 있는 모습을 담은 
				단체 티저 사진을 공개하며 컴백 열기를 끌어올리는 중이다.
				<br />
				이번 신곡은 지난해 세계 팝 시장을 휩쓴 '다이너마이트'
				(Dynamite)에 이어 또 다른 방탄소년단의 메가 히트곡이 
				될 수 있을지에 대해서도 국내외에서 관심이 높다.
				<br /><br />
				
			</div>
		</div>
	</div>
	<div class="copyright">
	<!-- Copyright -->
		<%@ include file="../common/Copyright.jsp" %>
	</div>


</body>
</html>

















<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopupMain.jsp</title>
<style>
	/*
		레이어 팝업창을 다른 엘리먼트와 겹쳐서 배치하기 위해
		position 속성을 absolute로 부여해야한다.
	*/
	div#popup{
		position: absolute; top:100px; left:200px;
		width:300px; height:200px; color:yellow;
		border:0px solid gray; background-color:gray;
		
	}
	
	/*
	팝업창 하단의 닫기 버튼 있는 부분의 속성
	*/
	div#popup>div{
		position: relative; background-color:#ffffff; top:50px;
		border:1px solid gray; padding:10px; color:black;
	}



</style>


</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<% 
	for(int i=1; i<=10; i++){
	%>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	페이지를 방문하면 레이어 팝업이 뜨게 됩니다. <br>
	<%
	}
	%>


<% 
// 팝업 메인에서는 isPopup이 on이면 레이어 팝업창을 표시한다.
String isPopup = "on";
// 쿠키명이 PopupClose인 쿠키를 읽어온다.
String PopCloseVal = CookieManager.readCookie(request, "PopupClose");
// 읽어온 쿠키값이 있다면
if(!PopCloseVal.equals(""))
	// isPopup에 할당한다.
	isPopup = PopCloseVal;
System.out.println("팝업쿠키 : "+isPopup);
// 읽어온 쿠키값이 없다면 레이어 팝업창을 보여준다.
if(isPopup.equals("on")){
%>
	<script type="text/javascript">
	function popClose() {
		var popup = document.getElementById('popup');
		popup.style.display = "none"; //웹브라우저에서 숨김처리
		
		var frm = document.popFrm;
		
		// 오늘 하루 열지 않음을 체크한 경우 폼값을 전송(submit)한다.
		if(frm.isToday.checked == true){
			console.log("isToday check");
			frm.action = 'PopupCookie.jsp'; // 폼값을 전송할 경로
			frm.target = 'hiddenFrame'; // 폼값을 전송할 타겟(하단의 iframe으로 지정)
			frm.method = 'post'; // 전송 방식
			frm.submit(); 
		}
	}
	
	
	</script>

	<div id="popup">
		<h2>공지사항</h2>
		<p>
			팝업창입니다. <br />
			팝업창입니다. <br />
			팝업창입니다. <br />		
		</p>
		<div>
			<form name="popFrm">
				<input type="checkbox" name="isToday" value="1" />
				오늘 하루 열지 않음
				<input type="button" value="닫기" onclick="popClose();"/>
			
			</form>
		
		</div>
		
	</div>
	<!-- 폼 값은 여기로 전송된다. -->
	<iframe name="hiddenFrame" style="display:block; width:400px;"></iframe>



<%
}

%>
	



</body>
</html>

[표현언어(EL)]
- 값을 표현하는데 사용되는 스크립트 언어
	JSP의 기본 문법을 보완하는 역할
	즉, 값을 출력하는 용도
- 자바 코드를 사용해야 하는 모든 곳에서 사용가능
- null값을 갖는 변수에 대해 관대하고,
	데이터 형변환을 더 자동으로 해줌
	값이 존재하지 않을때 에러 발생 X
	그냥 아무 값도 출력하지 않음
- 객체의 값에 접근할때 자바빈 객체의 property 규칙에 따라 접근한다




[표현언어의 기능]
- JSP의 4가지 영역의 속성을 사용할 수 있다.
- 변수와 연산자 포함
- 자바 클래스에 정의된 메소드 호출 가능
- 표현 언어만의 객체를 제공





[표현언어의 구문]
*** 형식 ***
${표현식}

-자바코드에서 생성한 객체 변수에 직접 접근 불가
-JSTL을 이용해 변수 생성 후 간접적으로 접근해야함
-스크립트릿, 표현식, 선언부에서 사용 불가
-액션태그, JSTL등의 속성값으로 사용가능
	<c:set ~~~${}/>
	<jsp:include ~~~~${}/>
- HTML 문서 내에서도 값 출력 가능
<h>${sessionScope.member.id}</h>

- 즉, JSP의 스크립트 요소를 제외한 나머지에서는 사용가능



[EL에서 개체의 접근]
점. 이나 대괄호[]를 사용함
[]는 주로 배열의 값을 꺼낼때 사용가능
단, 특수문자가 포함된 속성은 점. 으로 접근 불가
----- 가능 
${param.name}
${param["name"]}
${header["user-agent"]}

------- 불가능
${header.user-agent}




[표현언어의 내장 객체]
***4가지 영역에 접근
- pageScope
	: pageContext 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map Collection
- requestScope
	: request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map Collection
- sessionScope
	: session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map Collection
- applicationScope
	: application 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map Collection

=> 각 영역에 저장된 값을 EL로 읽어 올 때 속성명이 동일하다면 EL의 
	내장객체 명 생략시 작은 영역부터 순차적으로 읽어온다




[파라미터 or 폼값 받기]
- Java코드로 요청 파라미터를 받는 경우 String 타입으로만 
	받을수 있기때문에 산술 연산을 위해서는 반드시 숫자형으로 형변환해야 한다.
- EL을 통해서 요청 파라미터를 받는 경우에는 산술 연산을 위한
	별도의 형변환이 필요 없다

*** param
	- <파라미터명, 값> 매핑을 저장한 Map Collection
	- 파라미터값 : String 타입
	- request.getParameter(파라미터명)과 동일하다
	
	[JAVA]
		String str = request.getParameter("num");
	[EL]
	${param.first}


*** paramValues
	- <파라미터명, 값 배열> 매핑을 저장한 Map Collection
	- 파라미터값 : String[]   => 배열타입
	- request.getParameterValues(파라미터명)과 동일

	[Java]
	String[] inters = request.getParameterValues("inter");
	
	[EL]
	${paramValues.inter}



[헤더값]
*** header
	- <헤더이름, 값> 매핑을 저장한 Map Collection
	- request.getHeader(헤더명)과 동일
	
	[EL]
	${header.헤더명}
	${header.host}
	${header.cookie}
	${header['user-agent']}


*** headerValues
	- <헤더이름, 값배열> 매핑을 저장한 Map Collection
	- request.getHeaders(헤더명)과 동일
	
	[EL]
	${headerValues.헤더명}
	
	

[쿠키]
*** cookie
	- <쿠키명, 값> 매핑을 저장한 Map Collection
	
	[EL]
	${cookie.쿠키명.value}
	


[컨텍스트 파라미터]
*** initParam
	- 초기화 파라미터의 application.getInitParameter(이름) 결과와 동일
	- web.xml에 설정한 정보를 얻어옴
	
	[Java]
	<%= application.getInitParameter("PAGE_SIZE")%>
	
	[EL]
	${initParam.PAGE_SIZE}



[pageContext 객체]
*** pageContext
	- JSP의 pageContext기본 객체와 동일
	- JSP에서 컨텍스트루트를 얻어올 때
		<%= request.getContextPath() %> 과 동일
	- request 객체를 얻어서 getRequest() 
					또는 getContextPath() 메소드 호출과 동일
	
	[JAVA]
	<%=request.getContextPath()%>
	
	[EL]
	${pageContext.request.contextPath}


[empty 연산자]
- null 이거나 ""(빈문자열)일때 true를 반환
- 배열인 경우에는 길이가 0일때 true를 반환
- 컬렉션인 경우에는 size가 0일때 true를 반환













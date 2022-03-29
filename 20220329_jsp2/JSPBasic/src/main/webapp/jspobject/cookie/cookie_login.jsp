<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인을 이미 한 사용자가 로그인창으로 다시 접근할 경우
	// login_ok.jsp로 강제로 이동시켜서 로그인창이 안 보이게 해 주세요.
	// 힌트 : login_id
	
	// 1. 쿠키 목록을 들고 와야 검사가 가능함
	Cookie[] cookies = request.getCookies();

	// 2. 반복문으로 해당 배열 내 쿠키의 이름을 순차적으로 검사
	if(cookies != null){
		for(Cookie cookie : cookies){
			String cookieName = cookie.getName();
			// 3. 만약 배열 내에 로그인으로 인해 발급된 쿠키 검출시 로그인 완료 페이지로 보내버림
			if((cookieName != null) && (cookieName.equals("login_id"))){
				response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/login_ok.jsp");
			}
		}
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- form을 이용해
	목적지 : cookie_login_check.jsp ,  메서드 : post 
	name:id, name:pw 를 submit 버튼을 통해 전달합니다.--%>
	<form action="http://localhost:8181/JSPBasic/jspobject/cookie/cookie_login_check.jsp" method="post">
		<input type="text" name="id" placeholder="아이디"><br/>	
		<input type="password" name="pw" placeholder="비밀번호"><br/>	
		<input type="submit" value="로그인">
	</form>
</body>
</html>
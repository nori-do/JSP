<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션삭제는 session.invalidate() 가 실행되면
	// 해당 서버에서 발급한 세션을 모두 파기하고
	// 로그인 여부는 해당 서버에서 발급한 세션 유무로 판단하므로
	// 세션을 삭제하는 행위 자체로 로그아웃이라고 볼 수 있습니다.(발급한 세션이 사라지면 서버는 로그인으로 판단하지 않음)
	
	// 1. 세션을 삭제해주세요.
	session.invalidate();
	// 2. 로그인창으로 리다이렉트시켜주세요.
	response.sendRedirect("session_login_form.jsp");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
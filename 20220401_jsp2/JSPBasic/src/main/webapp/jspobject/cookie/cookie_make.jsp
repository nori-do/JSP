<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// # 쿠키 생성 방법.
	// 1. 쿠키 객체를 생성 - 생성자의 매개값으로 쿠키의
	//    이름과 저장할 데이터를 입력.  // 이름(변수명)    // 데이터
	Cookie apple = new Cookie("apple_cookie", "사과맛쿠키");
	Cookie peanut = new Cookie("peanut_cookie", "땅콩맛쿠키");

	// 2. 쿠키클래스의 setter 메서드들을 이용해 쿠키의 속성을 설정
	apple.setMaxAge(3600);// 쿠키의 유효시간을 1시간(3600초) 로 설정, 기본은 30분(1800초)
	peanut.setMaxAge(20); // 20초로 설정
	
	// 3. http응답시 response 객체에 생성된 쿠키를 탑재하여
	//    클라이언트로 전송하기.(사용자 PC에 저장하기)
	response.addCookie(apple);
	response.addCookie(peanut);
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="cookie_check.jsp">쿠키 확인해 보기</a>
</body>
</html>
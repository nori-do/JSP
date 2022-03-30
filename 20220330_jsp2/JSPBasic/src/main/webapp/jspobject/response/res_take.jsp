<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strAge = request.getParameter("age");
	System.out.println(strAge);//콘솔에서 확인
	out.println(strAge);//브라우저에서 확인
	
	// 대소비교를 하기 위해 정수로 바꿔줍니다.
	int age = Integer.parseInt(strAge);// 숫자로 이루어진 문자를 정수로 변환
	if(age >= 20){
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/response/res_adult.jsp");// 네이버로 강제이동
	} else if(age < 20) {
		out.println("<h1>당신은 미성년자입니다.</h1>");
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/response/res_kids.jsp");// 다음으로 강제이동
	}
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
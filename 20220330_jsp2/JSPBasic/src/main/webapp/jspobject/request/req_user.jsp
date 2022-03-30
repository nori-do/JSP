<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uName = request.getParameter("uname");
	String uId = request.getParameter("uid");
	String uPw = request.getParameter("upw");
	
	String[] hobby = request.getParameterValues("hobby");// 체크박스는 같은 명칭으로 데이터가 여럿 넘어오므로 배열처리
	String blood = request.getParameter("blood");
	String region = request.getParameter("region");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%= uName %><br/>
아이디 : <%= uId %><br/>
비번 : <%= uPw %><br/>
취미 : <%= Arrays.toString(hobby) %><br/><%-- 배열의 경우 Arrays.toSting(출력배열)로 나열할수있다. --%>
혈액형 : <%= blood %><br/>
지역 : <%= region %>
</body>
</html>
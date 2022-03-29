<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String photoPick = request.getParameter("photo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
선택한 그림 : <%= photoPick %><git br/>
<%
	if(photoPick.equals("1번그림")){
		out.println("1번 그림을 선택하셨네요!<br/>");
		out.println("<img src='01.png'>");
	} else {
		out.println("2번 그림을 선택하셨네요!<br/>");
		out.println("<img width='30%' src='02.png'>");
	}
%>
</body>
</html>
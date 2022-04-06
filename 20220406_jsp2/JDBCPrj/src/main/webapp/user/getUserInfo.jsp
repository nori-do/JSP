<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. userId 라는 이름으로 전달되는 데이터를 받으면(request.get?????)
	String userId = request.getParameter("userId");
	// 스크립트릿 내부에 전체 회원정보를 가져오도록 코드를 작성해서
	// ResultSet 변수에 저장까지만 해 주세요.
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
	// 그래서 body태그에 출력해야하는 필수요소는 try 진입 전 선언해놔야함
	ResultSet rs = null;
	// 2. DB연동 후
	try {
		Class.forName(dbType);
	
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		// 3. 해당 아이디의 정보만 ResultSet에 받아와서
		// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
		String sql = "SELECT * FROM userinfo WHERE user_id = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		//?를 채워주세요.
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
	} catch(Exception e){
		e.printStackTrace();
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 4. body 내부에 XX 유저의 정보입니다 라는 문장과 함께 전체 정보가 나오도록 코드를 짜주세요.
	// 5. 폼에서 전달한 아이디를 처리할 수 있도록 getUserInfoForm.jsp를 추가해주세요.	
	if(rs.next()){
%>
	<h1><%= rs.getString(1) %>유저의 정보입니다</h1>	
	비번 : <%= rs.getString(2) %><br/>
	이름 : <%= rs.getString(3) %><br/>
	이메일 : <%= rs.getString(4) %><br/>
<% } else { %>
	<h3><%=userId %>계정은 존재하지 않습니다.</h3>
<%} %>		
</body>
</html>
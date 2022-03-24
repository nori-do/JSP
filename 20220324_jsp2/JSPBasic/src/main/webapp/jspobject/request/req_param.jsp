<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	* 요청 파라미터
	
	- 클라이언트 측에서 서버로 데이터를 요청할 때 전달되는 변수를
	  요청 파라미터라고 부릅니다.
	  
	- 요청 파라미터는 URL주소 뒤에 ?를 붙인 이후에 [파라미터변수명=값]을
	  통해 서버로 데이터를 전달할 수 있습니다.
	  
	- 요청 파라미터를 여러개 전달할때는 두 번째부터 &를 붙여서 나열합니다.
 --%>
 <%
 	// post방식 전달시 한글 깨지는걸 방지(제일 윗줄에 위치해야함)
 	request.setCharacterEncoding("utf-8");
 	// 클라이언트의 전송 데이터를 받아오는 방법
 	// 내장객체 request의 getParameter("변수명") 을 사용
 	String a =  request.getParameter("apple");
 	String b =  request.getParameter("banana");
 	// 임의로 받아올 수 있는 request.getParameter("변수명")을 작성해주시고 변수 c에 저장한후 body에서 출력해주세요.
 	String c = request.getParameter("papaya");
 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	apple로 전송된 데이터 : <%= a %><br/>
	banana로 전송된 데이터 : <%= b %><br/>
	papaya로 전송된 데이터 : <%= c %><br/>
	로그인시 사용한 아이디 : <%= id %><br/>
	로그인시 사용한 비번 : <%= pw %><br/>	
</body>
</html>




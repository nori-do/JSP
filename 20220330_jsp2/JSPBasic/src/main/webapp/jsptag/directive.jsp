<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 날짜를 표시할 때 자바의 Date 객체를 사용했는데 JSP페이지에서도 그대로 쓸 수 있습니다.
	// 단, import를 해야 활용가능합니다.(import java.util.Date) 
	// 직접 디렉티브 구문을 적어넣을수도 있지만, ctrl + space 자동완성을 통해 완성구문을 골라넣을수도 있습니다.
	Date date = new Date();

	// 자바 내부 라이브러리라면 뭐든 쓸 수 있고, 컬렉션도 쓸 수 있습니다. 
	List<String> names = new ArrayList<>();
	names.add("허준");
	names.add("홍길동");
	names.add("김철수");
	names.add("박영희");
	// 멤버를 인덱스 삭제 방식으로 임의로 1명, 내부요소명을 직접 적어 삭제하는 방식으로 임의로 한명 없애주세요.
	names.remove(2);
	names.remove("홍길동");
	names.clear();
	
	//out.println("멤버 목록 : " + names + "<br/>");
%>
	멤버 목록 : <%= names %><br/>
	현재 시간 정보 : <%= date.getHours() %>시 <%=date.getMinutes() %>분 <%=date.getSeconds() %>초
</body>
</html>
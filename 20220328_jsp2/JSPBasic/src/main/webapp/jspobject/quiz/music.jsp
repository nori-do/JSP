<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost:8181/JSPBasic/jspobject/quiz/music_result.jsp" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>가수명</th>
					<th>노래명</th>
					<th>선택하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>소코도모</th>
					<th>회전목마</th>
					<th><input type="radio" name="song" value="회전목마"></th>
				</tr>		
				<tr>
					<th>아이유</th>
					<th>금요일에 만나요</th>
					<th><input type="radio" name="song" value="금만나"></th>
				</tr>		
				<tr>
					<th>silver scrapes</th>
					<th>대니 매카시</th>
					<th><input type="radio" name="song" value="silver"></th>
				</tr>		
			</tbody>
		</table>
		<input type="submit" value="들으러 가기">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 반복해서 출력하려면 JSTL을 활용하는것이 일반적임 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 포워딩으로 먼저 넘어온 다음 리다이렉트를 이어서 실행하도록 해야
포워딩/리다이렉트 호출이 겹쳐서 에러가 나는걸 막을 수 있으므로
이 경우만 예외적으로 스크립트릿을 이용한 리다이렉트를 사용합니다. -->
세션값 : ${sessionScope.s_id }<br/>
<c:if test="${sessionScope.s_id eq null}">
	<!-- <script>location.href="http://localhost:8181/MyFirstWeb/"</script> -->
	<% //response.sendRedirect("http://localhost:8181/MyFirstWeb/"); %>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>/boardList 로 연결된 임시페이지입니다.</h1>
	<table border="1">
		<thead>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>글쓴이</td>
				<td>쓴날짜</td>
				<td>수정날짜</td>
				<td>조회수</td>
			</tr>
		</thead>
			<!-- JSTL c:forEach와 ${boardList}를 활용하면 됩니다.
			전체 글 정보를 테이블 형식으로 보여주세요. getAllBoardList.jsp 참고해주세요.-->
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNum}</td>
						<td><a href="http://localhost:8181/MyFirstWeb/boardDetail.do?board_num=${board.boardNum}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.bDate}</td>
						<td>${board.mDate}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
	${sessionScope.s_id ne null}<br/>
	<c:if test="${sessionScope.s_id ne null}">	
		<a href="http://localhost:8181/MyFirstWeb/boardInsertForm.do"><button>글쓰기</button></a>
	</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// cookie_login.jsp에서 보내준 id, pw를 받아주세요.
	// post방식임을 감안해주세요.
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 로그인 처리를 해보겠습니다.
	// 로그인 아이디는 "abc1234"인 경우만 허용
	// 비밀번호는 "1111"인 경우만 허용하겠습니다.(추후 DB데이터로 로그인처리하는법 배울것임)
	// 조건문을 이용해주시면 되는데
	// 로그인의 경우 크게 3가지로 나뉩니다.
	// 1. 아이디가 없는경우
	// 2. 아이디는 있으나 비번이 틀린경우
	// 3. 아이디와 비밀번호가 모두 일치하는경우.
	// 1의 경우 콘솔에 "아이디가 없습니다." -> login_id_fail.jsp
	// 2의 경우 콘솔에 "비밀번호가 틀렸습니다." -> login_pw_fail.jsp
	// 3의 경우 콘솔에 "로그인하셨습니다. 환영합니다." -> login_ok.jsp
	// 라고 찍히도록 조건문을 작성해보세요. -> 로 리다이렉트 시켜주시고 콘솔대신 body에 문장을 찍으세요.
	
	if(id.equals("abc1234")){// 아이디가 있는경우
		if(pw.equals("1111")){ // 비번도 맞는경우
			// 로그인 성공시 쿠키를 생성하고, 로그인 완료 페이지에서는 해당 쿠키를 확인하게 만들어서 로그인 여부를 감지합니다.
			// 쿠키 생성(쿠키 이름은 login_id, 값은 abc1234), 변수명은 자율
			Cookie loginId = new Cookie("login_id", "abc1234");// 1800초. setMaxAge로 수정 가능
			loginId.setMaxAge(1800);
			// 쿠키 발송
			response.addCookie(loginId);
			response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/login_ok.jsp");
		} else {// 비번은 틀린경우
			response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/login_pw_fail.jsp");
		}
	} else {// 아이디가 없는경우
		response.sendRedirect("http://localhost:8181/JSPBasic/jspobject/cookie/login_id_fail.jsp");
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
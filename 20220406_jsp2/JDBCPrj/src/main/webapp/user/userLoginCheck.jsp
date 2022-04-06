<%@page import="com.ict.domain.UserVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// userLoginForm.jsp에서 보내온 아이디 비번을 받아주세요.
	String formId = request.getParameter("formId");
	String formPw = request.getParameter("formPw");
	
	// 추후 DB에서 꺼낸 아이디와 패스워드를 저장할 변수 
	String dbId = null;
	String dbPw = null;

	// DB와 연동해서 formId에 해당하는 유저 전체 정보를 받아줍니다.(getUserInfo.jsp로직을 참조)
	String dbType = "com.mysql.cj.jdbc.Driver";
	String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
	String connectId = "root";
	String connectPw = "mysql";
	// try블럭이 닫히는 순간, 내부에서 최초로 선언된 변수들도 다 사라짐
	// 그래서 body태그에 출력해야하는 필수요소는 try 진입 전 선언해놔야함
	ResultSet rs = null;
	// ResultSet의 데이터를 자바 클래스로 교체할 수 있도록 UserVO를 생성
	UserVO user = new UserVO();
	
	// 2. DB연동 후
	try {
		Class.forName(dbType);
	
		Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
		// 3. 해당 아이디의 정보만 ResultSet에 받아와서
		// 쿼리문은 SELECT * FROM userinfo WHERE user_id = 유저아이디;
		String sql = "SELECT * FROM userinfo WHERE user_id = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		//?를 채워주세요.
		pstmt.setString(1, formId);
		rs = pstmt.executeQuery();// formId에 해당하는 계정정보(아이디, 패스워드, 이메일, 이름)
		if(rs.next()){//메모리회수를 위해 바로 조회 
			// 생성된 UserVO에 Setter를 이용해 변수명에 맞는 자료 입력
			user.setUserId(rs.getString(1));
			user.setUserPw(rs.getString(2));
			user.setUserName(rs.getString(3));
			user.setEmail(rs.getString(4));
			System.out.println("UserVO 내부 자료 조회");
			System.out.println(user.getUserId());
			System.out.println(user.getUserPw());
			System.out.println(user.getUserName());
			System.out.println(user.getEmail());
			System.out.println("------------------");
		} else {
			// rs.next() 가 false라는것은 DB에 해당 아이디가 존재하지 않는것이므로 아이디 없음 페이지
			response.sendRedirect("userIdFail.jsp");
		}
		rs.close();// ResultSet, Connection, PreparedStatement는 .close()로 닫을수있음.
	} catch(Exception e){
		e.printStackTrace();
	}
	// DB에 들어있던 id와 formId를 비교하고, DB에 들어있던 pw와 formPw를 비교해서
	// 적절한 처리를 해주세요.
	
		//dbId = rs.getString(1); 아이디는 DB데이터 조회 시점에 이미 유무 판단이 끝나 필요없음
		// UserVO의 getter를 이용해 비밀번호를 얻어옴.
		dbPw = user.getUserPw();
		// rs.next() 가 true가 나왔다는 자체로 해당 아이디가 DB에 존재함을 의미
		// id가 존재한다면 pw일치여부를 확인하면 됩니다.
		if(formPw.equals(dbPw)){
			// 아이디도 존재하고, 비밀번호까지 일치하므로 로그인 성공
			session.setAttribute("s_id", formId);
			response.sendRedirect("loginWelcome.jsp");
		} else {
			// 아이디는 있으나 비번이 일치하지 않으면 비밀번호가 틀린것
			response.sendRedirect("userPwFail.jsp");
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
package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class PreparedDelete {

	public static void main(String[] args) {
		// 특정 아이디를 Scanner로 입력받아 입력받은 아이디를 삭제하는 로직을 작성해주세요.
		// PreparedStatement 형식으로 작성해주세요.
		// DB종류, 주소, 아이디, 비밀번호는 간단하게 변수로 관리하는게 가독성이 더 좋습니다.
		// 변수로 상단에 미리 선언해놓고 쓰도록 합니다.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		//삭제할 아이디 입력받기
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 아이디를 입력해주세요.");
		String id = scan.nextLine();
		
		try {
			// 직접 적지 않고 변수명으로 관리하기 때문에 훨씬 가독성이 높아집니다.
			// 1. DB종류 지정
			Class.forName(dbType);
			// 2. DB연결
			Connection con = DriverManager.getConnection(connectUrl, connectId, connectPw);
			// 3. PreparedStatment 구문은 먼저 SQL쿼리문을 만들어놓고 ?를 채우는 식으로 작동하빈다.
			//    쿼리문 작성시 중간에 사용자가 입력하는 부분에 대해서만 ?로 대체해서 적습니다.
			//    따옴표 여부는 더이상 고려하지 않아도 됩니다.
			//    ?는 두 개 이상을 나열할수도 있습니다.
			String sql = "DELETE FROM userinfo WHERE user_id=?";// ? 가 사용자 입력 아이디가 들어갈 부분임
			
			// pstmt 변수를 만들어 세팅하면서 sql 구문을 같이 넣어줍니다.
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// ?에 들어갈 자료를 정의해줍니다.
			// DELETE FROM userinfo WHERE user_id=? =>DELETE FROM userinfo WHERE user_id='입력한아이디'
			pstmt.setString(1, id);// 왼쪽부터 1번째 ?에 id변수에 들어있는 사용자 입력 변수를 넣어준다는 의미
			
			// 4. 쿼리문 실행(DELETE문은 결과가 없습니다.)
			pstmt.executeUpdate();
			

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}

}

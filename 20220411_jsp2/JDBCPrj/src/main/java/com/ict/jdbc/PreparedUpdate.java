package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class PreparedUpdate {

	public static void main(String[] args) {
		// id, pw, name, email을 입력받아서
		// 특정 id인 계정의 pw, name, email을 입력받은 값으록 갱신하는
		// UPDATE 로직을 작성해주세요.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String connectUrl = "jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC";
		String connectId = "root";
		String connectPw = "mysql";
		
		//삭제할 아이디 입력받기
		Scanner scan = new Scanner(System.in);
		System.out.print("정보를 변경할 아이디를 입력해주세요.");
		String id = scan.nextLine();
		System.out.print("새 비번을 입력해주세요.");
		String pw = scan.nextLine();
		System.out.print("새 이름을 입력해주세요.");
		String name = scan.nextLine();
		System.out.print("새 이메일을 입력해주세요.");
		String email = scan.nextLine();
		
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
			String sql = "UPDATE userinfo SET user_pw=?, user_name=?, email=? WHERE user_id=?";
			
			// pstmt 변수를 만들어 세팅하면서 sql 구문을 같이 넣어줍니다.
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// ?에 들어갈 자료를 정의해줍니다.
			pstmt.setString(4, id);// ? 채울때 왼쪽부터 채워야 한다는 법은 없음.
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			
			// 4. 쿼리문 실행(DELETE문은 결과가 없습니다.)
			pstmt.executeUpdate();
			

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
		
	}

}

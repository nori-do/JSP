package com.ict.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// Scanner로 삭제할 아이디를 입력받으면
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 아이디를 입력해주세요.");
		String id = scan.nextLine();
		
		// DB에 삭제용 쿼리문을 날려주는 로직을 작성해주세요.
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac2?serverTimezone=UTC",
														"root",
														"1111");
			
			Statement stmt = con.createStatement();//java.sql의 요소를 사용합니다.
			// 사용 쿼리문 : DELETE FROM userinfo WHERE user_id='아이디'
			String sql = "DELETE FROM userinfo WHERE user_id='" + id + "'";
			System.out.println("실행될 쿼리문 : " + sql);
			
			// 삭제되었는지는 SELECT 코드나 혹은 Workbench를 이용해 확인해주세요.
			stmt.executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			scan.close();
		}
	}
}

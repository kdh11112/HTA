package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AttendenceVO;

public class AttendenceDAO {
	// 1.환경변수
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "userhj";
		String password = "user12";
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		StringBuffer sb = new StringBuffer();

		public AttendenceDAO() {
			// 2.드라이버 로딩
			try {
				Class.forName(driver);
				// 3.Connection
				conn = DriverManager.getConnection(url, user, password);
				System.out.println("conn : " + conn);
			} catch (SQLException e) {
				System.out.println("드라이버 로딩 실패");
			} catch (ClassNotFoundException e) {
				System.out.println("DB연결 실패");
				e.printStackTrace();
			}

		}// 기본생성자 end

		public void addOne(AttendenceVO vo) {
			
			sb.setLength(0);
			sb.append("INSERT INTO ATTENDANCE (attendanceNo,workingDate)" );
			sb.append("VALUES(ATTENDANCE_SEQ.nextval,sysdate)");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//addOne end
}

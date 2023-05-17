package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.AttendenceVO;
import vo.EmployeeVO;

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
		sb.append("INSERT INTO ATTENDANCE (attendance_No,working_Date,OFFICE_GOING_HOUR,E_NUMBER) ");
		sb.append("VALUES(ATTENDANCE_SEQ.nextval,sysdate,sysdate,?) ");// systemtimestamp -- 시간날짜 시간대까지
																						// 저장함.

		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			/* pstmt.setString(1, vo.getOfficeGoingHour() ); */
			pstmt.setInt(1, vo.getEnumber() );
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// addOne end
	public void endTimeAddOne(int id) {
		
		sb.setLength(0);
		sb.append("update ATTENDANCE ");
		sb.append("set  QUITTING_TIME = sysdate ");
		sb.append("where E_NUMBER = ? and to_char( office_going_hour ,'yyyy/mm/dd') = to_char(sysdate,'yyyy/mm/dd') ");
		// 저장함.
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// endTimeAddOne end


}

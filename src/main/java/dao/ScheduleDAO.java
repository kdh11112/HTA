package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ScheduleVO;

public class ScheduleDAO {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "userhj";
	String password = "user12";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet  rs;
	StringBuffer sb = new StringBuffer();
	
	public ScheduleDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<ScheduleVO> selectAll(int eNumber, String dName){
		ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
		sb.setLength(0); // 길이를 0으로
		sb.append("SELECT S.S_NUMBER, S.S_CONTENTS, S.S_START_DATE, S.S_END_DATE, S.E_NUMBER, S.S_TYPE, E.D_NAME  FROM SCHEDULE S LEFT JOIN EMPLOYEE E ON E.E_NUMBER = S.E_NUMBER WHERE E.E_NUMBER = ? AND E.D_NAME = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, eNumber);
			pstmt.setString(2, dName);	
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int sNumber = rs.getInt("s_number");
				String sContents = rs.getString("s_contents");
				String sStartDate = rs.getString("s_start_date");
				String sEndDate = rs.getString("s_end_date");
				String sType = rs.getString("s_type");
				
				
				ScheduleVO vo = new ScheduleVO(sNumber,sContents,sStartDate,sEndDate,eNumber,sType);
				
				list.add(vo);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ScheduleVO> personalLoadSchedule(int eNumber, String sType) {
	    ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
	    sb.setLength(0);
	    sb.append("SELECT * FROM SCHEDULE WHERE E_NUMBER = ? AND S_TYPE = ?	 " );

	    try {
	        pstmt = conn.prepareStatement(sb.toString());
	        pstmt.setInt(1, eNumber);
	        pstmt.setString(2, sType);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int sNumber = rs.getInt("s_number");
	            String sContents = rs.getString("s_contents");
	            String sStartDate = rs.getString("s_start_date");
	            String sEndDate = rs.getString("s_end_date");

	            ScheduleVO vo = new ScheduleVO(sNumber, sContents, sStartDate, sEndDate, eNumber, sType);

	            list.add(vo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public ArrayList<ScheduleVO> departmentLoadSchedule(String dName, String sType) {
	    ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
	    sb.setLength(0);
	    sb.append("SELECT S.S_NUMBER, S.S_CONTENTS, S.S_START_DATE, S.S_END_DATE, S.E_NUMBER, S.S_TYPE, E.D_NAME  FROM SCHEDULE S LEFT JOIN EMPLOYEE E ON E.E_NUMBER = S.E_NUMBER WHERE E.D_NAME = ? AND S.S_TYPE = ? " );

	    try {
	        pstmt = conn.prepareStatement(sb.toString());
	        pstmt.setString(1, dName);
	        pstmt.setString(2, sType);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int sNumber = rs.getInt("s_number");
	            String sContents = rs.getString("s_contents");
	            String sStartDate = rs.getString("s_start_date");
	            String sEndDate = rs.getString("s_end_date");
	            int eNumber = rs.getInt("e_number");

	            ScheduleVO vo = new ScheduleVO(sNumber, sContents, sStartDate, sEndDate, eNumber, sType);

	            list.add(vo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public void addSchedule(String contents, String start_date, String end_date, int eNumber, String sType ) {
	    sb.setLength(0);
	    sb.append("INSERT INTO SCHEDULE VALUES(SCHEDULE_SEQ.NEXTVAL, ?,TO_date(?,'yyyy-mm-dd:hh24:mi'), TO_date(?,'yyyy-mm-dd:hh24:mi'), ?, ?)" );
	    try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, contents );
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			pstmt.setInt(4, eNumber );
			pstmt.setString(5, sType );
			
	        pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addDepartmentSchedule(String contents, String start_date, String end_date, int eNumber, String sType) {
	    sb.setLength(0);
	    sb.append("INSERT INTO SCHEDULE VALUES(SCHEDULE_SEQ.NEXTVAL, ?, TO_DATE(?, 'yyyy-mm-dd:hh24:mi'), TO_DATE(?, 'yyyy-mm-dd:hh24:mi'),?, ? ) ");
	    
	    try {
	        pstmt = conn.prepareStatement(sb.toString());

	        pstmt.setString(1, contents);
	        pstmt.setString(2, start_date);
	        pstmt.setString(3, end_date);
	        pstmt.setInt(4, eNumber);
	        pstmt.setString(5, sType);

	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public void close() {
		// 자원반납
		try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

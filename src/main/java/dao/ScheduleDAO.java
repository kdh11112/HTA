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
	String user = "scott";
	String password = "tiger";
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
	
	public ArrayList<ScheduleVO> selectAll(){
		ArrayList<ScheduleVO> list = new ArrayList<ScheduleVO>();
		sb.setLength(0); // 길이를 0으로
		sb.append("SELECT * FROM SCHEDULE Left join EMPLOYEE on E_NUMBER = E_NUMBER ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int S_NUMBER = rs.getInt("S_NUMBER");
				String S_CONTENTS = rs.getString("S_CONTENTS");
				String S_START_DATE = rs.getString("S_START_DATE");
				String S_END_DATE = rs.getString("S_END_DATE");
				int E_NUMBER = rs.getInt("E_NUMBER");

				ScheduleVO vo = new ScheduleVO(S_NUMBER,S_CONTENTS,S_START_DATE,S_END_DATE,E_NUMBER);
				
				list.add(vo);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}

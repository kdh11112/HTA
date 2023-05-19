package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AttendenceVO;
import vo.BoardVO;
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
			

			sb.setLength(0);
			sb.append("INSERT INTO ATTENDANCE (attendanceNo,workingDate) " );
			sb.append("VALUES(ATTENDANCE_SEQ.nextval,sysdate)");

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

	
	public ArrayList<AttendenceVO> getDate(int enumber) {
		//사원별 출퇴근시간가져오기
		ArrayList<AttendenceVO> list = new ArrayList<AttendenceVO>();
		sb.setLength(0);
		sb.append("select OFFICE_GOING_HOUR,QUITTING_TIME,e_number ");
		sb.append("from attendance ");
		sb.append("where e_number=? ");

		
		AttendenceVO vo =null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, enumber);
		
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String startTime = rs.getString("office_Going_Hour");
				String endTime = rs.getString("quitting_Time");
				
				vo = new AttendenceVO();
				
				vo.setOfficeGoingHour(startTime);
				vo.setQuittingTime(endTime);
				list.add(vo);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	public AttendenceVO getStartTime(int enumber) {
		sb.setLength(0);
		sb.append("select ATTENDANCE_NO,to_char(OFFICE_GOING_HOUR,'HH24:MI:SS') OFFICE_GOING_HOUR  "  );
		sb.append("from ATTENDANCE "  );
		sb.append("WHERE E_NUMBER=? "  );
		sb.append("and to_char(office_going_hour,'yyyy/mm/dd') = to_char(sysdate,'yyyy/mm/dd') "  );
		AttendenceVO  vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, enumber);
			
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				String startTime = rs.getString("OFFICE_GOING_HOUR");
				vo = new AttendenceVO();
				vo.setOfficeGoingHour(startTime);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}
	
	public AttendenceVO getEndTime(int enumber) {
		sb.setLength(0);
		sb.append("select ATTENDANCE_NO,to_char(QUITTING_TIME,'HH24:MI:SS') QUITTING_TIME  "  );
		sb.append("from ATTENDANCE "  );
		sb.append("WHERE E_NUMBER=? "  );
		sb.append("and to_char(QUITTING_TIME,'yyyy/mm/dd') = to_char(sysdate,'yyyy/mm/dd') "  );
		AttendenceVO  vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, enumber);
			
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				String endTime = rs.getString("QUITTING_TIME");
				vo = new AttendenceVO();
				vo.setQuittingTime(endTime);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
	}
	
	
	public void lateTime(int id) {
		sb.setLength(0);
		sb.append("update attendance set attendance_status = '지각' WHERE office_going_hour > trunc(office_going_hour,'DD')+9/24 and to_char(office_going_hour,'YYYY/MM/DD') = to_char(sysdate,'YYYY/MM/DD') and e_number = ?;");
		
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



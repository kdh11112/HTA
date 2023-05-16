package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.ApprovalVO;

public class ApprovalDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "userhj";
	String password = "user12";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public ApprovalDAO() {
		
		try {
			//2.드라이버로딩
			Class.forName(driver);
			//3.Connection
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩실패");
		}catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	//전체 페이징 처리
	public int getTotalCount() {		
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM APPROVAL");
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<ApprovalVO> selectAll(){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM APPROVAL ORDER BY A_NUMBER DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int a_number = rs.getInt("a_number");
				String a_name = rs.getString("a_name");
				String a_department_name = rs.getString("a_department_name");
				Date a_start_date = rs.getDate("a_start_date");
				Date a_end_date = rs.getDate("a_end_date");
				String a_title = rs.getString("a_title");
				String a_content = rs.getString("a_content");
				String a_name_1st = rs.getString("a_name_1st");
				String a_name_2nd = rs.getString("a_name_2nd");
				String a_status = rs.getString("a_status");
				String a_save = rs.getString("a_save");
				String e_number = rs.getString("e_number");
				ApprovalVO vo = new ApprovalVO();
				vo.setA_number(a_number);
				vo.setA_name(a_name);
				vo.setA_department_name(a_department_name);
				vo.setA_start_date(a_start_date);
				vo.setA_end_date(a_end_date);
				vo.setA_title(a_title);
				vo.setA_content(a_content);
				vo.setA_name_1st(a_name_1st);
				vo.setA_name_2nd(a_name_2nd);
				vo.setA_status(a_status);
				vo.setA_save(a_save);
				vo.setE_number(e_number);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.EmployeeVO;
import vo.ProVO;

public class ProDAO {
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "userhj";
	String password = "user12";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet  rs;
	StringBuffer sb = new StringBuffer();
	
	public ProDAO() {
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
	
	public ArrayList<EmployeeVO> selectAll(){
		ArrayList<EmployeeVO> list = new ArrayList<>();
		sb.setLength(0); // 길이를 0으로
		sb.append("SELECT * FROM EMPLOYEE ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int empno = rs.getInt("e_number");
				String ename = rs.getString("e_name");
				String job = rs.getString("e_official_responsibilities");
				String dname = rs.getString("d_name");
				
				EmployeeVO vo = new EmployeeVO();
				vo.setE_number(empno);
				vo.setE_name(ename);
				vo.setE_official_responsibilities(job);
				vo.setD_name(dname);
	
				list.add(vo);
				
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	public EmployeeVO getOneName(String ename) {
		sb.append("SELECT * FROM EMPLOYEE WHERE E_NAME = ? ");
		EmployeeVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, ename);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				int empno = rs.getInt("e_number");
				String job = rs.getString("e_official_responsibilities");
				String dname = rs.getString("d_name");
				
				
				vo = new EmployeeVO();
				vo.setE_number(empno);
				vo.setE_name(ename);
				vo.setE_official_responsibilities(job);
				vo.setD_name(dname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	

	
	
}

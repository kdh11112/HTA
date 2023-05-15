package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.ProVO;

public class ProDAO {
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String password = "tiger";
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
	
	public ArrayList<ProVO> selectAll(){
		ArrayList<ProVO> list = new ArrayList<ProVO>();
		sb.setLength(0); // 길이를 0으로
		sb.append("SELECT * FROM pro ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String dname = rs.getString("dname");
				
				ProVO vo = new ProVO(empno,ename,job,dname);
				
				list.add(vo);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
	public ProVO getOneName(String ename) {
		sb.append("SELECT * FROM PRO WHERE ename = ? ");
		ProVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, ename);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				int empno = rs.getInt("empno");
				String job = rs.getString("job");
				String dname = rs.getString("dname");
				
				vo = new ProVO(empno,ename,job,dname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	

	
	
}

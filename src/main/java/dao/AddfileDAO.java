package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.AddfileVO;

public class AddfileDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "userhj";
	String password = "user12";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();


	public AddfileDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : " + conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
	}
	
	public int upload(int bNo, String fName, String fLoc) {
		sb.append(0);
		sb.append("INSERT INTO addfile VALUES (?,?,?) " );
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, bNo);
			pstmt.setString(2, fName);
			pstmt.setString(3, fLoc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<AddfileVO> selectAll(){
		ArrayList<AddfileVO> list = new ArrayList<AddfileVO>();
		
		sb.setLength(0);
		sb.append("SELECT * FROM addfile ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNo = rs.getInt("bNo");
				String fName = rs.getString("fName");
				String fLoc = rs.getString("fLoc");
				AddfileVO vo = new AddfileVO(bNo, fName, fLoc);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.ApprovalVO;
import vo.MailVO;

public class MailDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "userhj";
	String password = "user12";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public MailDAO() {
		
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
		sb.append("SELECT COUNT(*) FROM MAIL");
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
	
	public ArrayList<MailVO> selectAll(){
		ArrayList<MailVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM APPROVAL ORDER BY m_NUMBER DESC");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mNumber = rs.getInt("m_number");
				String mTitle = rs.getString("mTitle");
				String mContent = rs.getString("mContent");
				String mFile = rs.getString("mFile");					
				String mCc = rs.getString("mCc");					
				Date mRegdate = rs.getDate("mRegdate");
				String mBoard = rs.getString("mBoard");					
				
				int eNumber = rs.getInt("eNumber");
				int eNumber2 = rs.getInt("eNumber2");
				
				
				MailVO vo = new MailVO();
				vo.setMNumber(mNumber);
				vo.setMTitle(mTitle);
				vo.setMContent(mContent);
				vo.setMFile(mFile);
				vo.setMCc(mCc);
				vo.setMRegdate(mRegdate);
				vo.setMBoard(mBoard);
				vo.setENumber(eNumber);
				vo.setENumber(eNumber2);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}

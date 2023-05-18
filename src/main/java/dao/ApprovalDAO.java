package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import vo.ApprovalVO;
import vo.EmployeeVO;

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
	//전체 페이징 처리 하려면 조건이 없이
	//내것만 보려면 조건을 주면됨
	public int getTotalCount(int i) {		
		 sb.setLength(0);
		    sb.append("SELECT COUNT(*) FROM APPROVAL WHERE E_NUMBER = ?");
		    int count = 0;
		    try {
		        pstmt = conn.prepareStatement(sb.toString());
		        pstmt.setInt(1, i);
		        rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		            count = rs.getInt("COUNT(*)"); 
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return count;
	}
	
//	public ArrayList<ApprovalVO> selectAll(){
//		ArrayList<ApprovalVO> list = new ArrayList<>();
//		sb.setLength(0);
//		sb.append("SELECT * FROM APPROVAL ORDER BY A_NUMBER DESC");
//		
//		try {
//			pstmt = conn.prepareStatement(sb.toString());
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int a_number = rs.getInt("a_number");
//				String a_name = rs.getString("a_name");
//				String a_department_name = rs.getString("a_department_name");
//				Date a_start_date = rs.getDate("a_start_date");
//				Date a_end_date = rs.getDate("a_end_date");
//				String a_title = rs.getString("a_title");
//				String a_content = rs.getString("a_content");
//				String a_name_1st = rs.getString("a_name_1st");
//				String a_name_2nd = rs.getString("a_name_2nd");
//				String a_status = rs.getString("a_status");
//				String a_save = rs.getString("a_save");
//				String e_number = rs.getString("e_number");
//				ApprovalVO vo = new ApprovalVO();
//				vo.setaNumber(a_number);
//				vo.setaName(a_name);
//				vo.setaDepartmentName(a_department_name);
//				vo.setaStartDate(a_start_date);
//				vo.setaEndDate(a_end_date);
//				vo.setaTitle(a_title);
//				vo.setaContent(a_content);
//				vo.setaName1st(a_name_1st);
//				vo.setaName2nd(a_name_2nd);
//				vo.setaStatus(a_status);
//				vo.setaSave(a_save);
//				vo.seteNumber(e_number);
//				list.add(vo);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return list;
//	}
	
	public ArrayList<ApprovalVO> selectAll(int i, int j, int k){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM (SELECT ROWNUM AS RNUM, A_NUMBER,A_TITLE,A_NAME,A_START_DATE,A_STATUS,E_NUMBER FROM (SELECT * from APPROVAL ORDER BY A_NUMBER DESC) WHERE ROWNUM <=? ) WHERE RNUM >= ?  AND E_NUMBER = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, j);
			pstmt.setInt(2, i);
			pstmt.setInt(3, k);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int aNumber = rs.getInt("A_NUMBER");
				String aTitle = rs.getString("A_TITLE");
				String aName = rs.getString("A_NAME");
				Date aStartDate = rs.getDate("A_START_DATE");
				String aStatus = rs.getString("A_STATUS");
				int eNumber = rs.getInt("E_NUMBER");
				ApprovalVO vo = new ApprovalVO();
				vo.setaNumber(aNumber);
				vo.setaTitle(aTitle);
				vo.setaName(aName);
				vo.setaStartDate(aStartDate);
				vo.setaStatus(aStatus);
				vo.seteNumber(eNumber);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ApprovalVO selectOne(int i) {
		sb.setLength(0);
		sb.append("SELECT A_NAME,A_DEPARTMENT_NAME,A_TITLE,A_CONTENT,A_NAME_1ST ,A_NAME_2ND  FROM APPROVAL WHERE A_NUMBER = ?");
		ApprovalVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, i);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("A_NAME");
				String dname = rs.getString("A_DEPARTMENT_NAME");
				String title = rs.getString("A_TITLE");
				String contents = rs.getString("A_CONTENT");
				String name1st = rs.getString("A_NAME_1ST");
				String name2rd = rs.getString("A_NAME_2ND");
				vo = new ApprovalVO();
				vo.setaName(name);
				vo.setaDepartmentName(dname);
				vo.setaTitle(title);
				vo.setaContent(contents);
				vo.setaName1st(name1st);
				vo.setaName2nd(name2rd);
				vo.seteNumber(i);
				
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	
	public void addOne(ApprovalVO vo,EmployeeVO vo2) {
		sb.setLength(0);
		sb.append("INSERT INTO APPROVAL VALUES(APPROVAL_SEQ.NEXTVAL,?,?,SYSDATE,SYSDATE,?,?,?,?,'대기중',null,?)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1,vo2.geteName());
			pstmt.setString(2,vo2.geteOfficialResponsibilities());
			pstmt.setString(3,vo.getaTitle());
			pstmt.setString(4,vo.getaContent());
			pstmt.setString(5,vo.getaName1st());
			pstmt.setString(6,vo.getaName2nd());
			pstmt.setInt(7,vo2.geteNumber());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	}
	
	
		public void close() {
			
			try {
			if(rs != null)rs.close();
			if(conn != null)conn.close();
			if(pstmt != null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
}

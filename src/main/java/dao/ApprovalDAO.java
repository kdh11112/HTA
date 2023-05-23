package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
	
	public static HashMap<String,Object> map = new HashMap<>();
	
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
	
	public int getTotalCount(String s, int i) {		
	 	sb.setLength(0);
	 	//A_STATUS  :  2 대기중
	    sb.append("SELECT COUNT(*) FROM APPROVAL WHERE A_STATUS like '%'||?||'%' AND E_NUMBER = ?");
		    int count = 0;
		    try {
		        pstmt = conn.prepareStatement(sb.toString());
		        pstmt.setString(1, s);
		        pstmt.setInt(2, i);
		        rs = pstmt.executeQuery();
		        
		        while(rs.next()) {
		            count = rs.getInt("COUNT(*)"); 
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return count;
	}
	
	
	public ArrayList<ApprovalVO> select(int i){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT A_STATUS FROM APPROVAL WHERE E_NUMBER = ? ORDER BY A_NUMBER DESC");
        		
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String aStatus = rs.getString("A_STATUS");
					ApprovalVO vo = new ApprovalVO();
					vo.setaStatus(aStatus);
					list.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}
	//내문서
	public ArrayList<ApprovalVO> selectAll(int i, int j, int k){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM (SELECT ROWNUM AS RNUM, A_NUMBER,A_TITLE,A_NAME,A_START_DATE,A_STATUS,E_NUMBER FROM (SELECT * from APPROVAL WHERE E_NUMBER = ? ORDER BY A_NUMBER DESC) WHERE ROWNUM <=? ) WHERE RNUM >= ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, k);
			pstmt.setInt(2, j);
			pstmt.setInt(3, i);
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
	
	public ArrayList<ApprovalVO> selectTemp(int i, int j, int k){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM (SELECT ROWNUM AS RNUM, A_NUMBER,A_TITLE,A_NAME,A_START_DATE,A_STATUS,E_NUMBER FROM (SELECT * from APPROVAL WHERE E_NUMBER = ? AND A_STATUS ='임시' ORDER BY A_NUMBER DESC) WHERE ROWNUM <=? ) WHERE RNUM >= ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, k);
			pstmt.setInt(2, j);
			pstmt.setInt(3, i);
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
	public ArrayList<ApprovalVO> selectComple(int i, int j, int k){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM (SELECT ROWNUM AS RNUM, A_NUMBER,A_TITLE,A_NAME,A_START_DATE,A_STATUS,E_NUMBER FROM (SELECT * from APPROVAL WHERE E_NUMBER = ? AND A_STATUS ='결재완료' ORDER BY A_NUMBER DESC) WHERE ROWNUM <=? ) WHERE RNUM >= ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, k);
			pstmt.setInt(2, j);
			pstmt.setInt(3, i);
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
	

	//내결재
	public ArrayList<ApprovalVO> selectAll(int i, String s ,int j, int k){
		ArrayList<ApprovalVO> list = new ArrayList<>();
		sb.setLength(0);
		sb.append("SELECT * FROM (SELECT ROWNUM AS RNUM,A_NUMBER, A_TITLE, A_NAME, A_START_DATE, A_STATUS, en, A_NAME_1ST,ee, en2, A_NAME_2ND, ee2 from (SELECT a.A_NUMBER, a.A_TITLE, a.A_NAME, a.A_START_DATE, a.A_STATUS, e.E_NUMBER AS en, a.A_NAME_1ST, e.E_OFFICIAL_RESPONSIBILITIES AS ee, e2.E_NUMBER AS en2, a.A_NAME_2ND, e2.E_OFFICIAL_RESPONSIBILITIES AS ee2 FROM APPROVAL a LEFT JOIN EMPLOYEE e ON a.A_NAME_1ST = e.E_NAME LEFT JOIN EMPLOYEE e2  ON a.A_NAME_2ND = e2.E_NAME ORDER BY A_NUMBER DESC) WHERE ROWNUM <= ?) WHERE RNUM >= ? ");
		if(s.equals("과장")) {			
			sb.append("AND en = ? AND A_STATUS ='1차결재 대기중' ");
		}else if(s.equals("차장")) {
			sb.append("AND en2 = ? AND A_STATUS ='2차결재 대기중' ");
		}else {
			sb.append("AND en = ? ");
		}
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, k);
			pstmt.setInt(2, j);
			pstmt.setInt(3, i);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int aNumber = rs.getInt("A_NUMBER");
				String aTitle = rs.getString("A_TITLE");
				String aName = rs.getString("A_NAME");
				Date aStartDate = rs.getDate("A_START_DATE");
				String aStatus = rs.getString("A_STATUS");
				String aName1 = rs.getString("A_NAME_1ST");
				String eEO1 = rs.getString("ee");
				ApprovalVO vo = new ApprovalVO();
				vo.setaNumber(aNumber);
				vo.setaTitle(aTitle);
				vo.setaName(aName);
				vo.setaStartDate(aStartDate);
				vo.setaStatus(aStatus);
				vo.seteENumber1(i);
				vo.seteEname1(aName1);
				vo.seteEof1(eEO1);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	
	public ApprovalVO selectOne(int i) {
	    sb.setLength(0);

	    sb.append("SELECT a.A_NAME,a.A_DEPARTMENT_NAME,a.A_TITLE,a.A_CONTENT,a.A_NAME_1ST,e.E_OFFICIAL_RESPONSIBILITIES AS e1ST,a.A_NAME_2ND,e2.E_OFFICIAL_RESPONSIBILITIES AS e2RD,a.A_START_DATE,a.A_STAMP_SALF,a.A_STAMP_1ST,a.A_STAMP_2ND from APPROVAL a LEFT JOIN EMPLOYEE e ON a.A_NAME_1ST = e.E_NAME LEFT JOIN EMPLOYEE e2 ON a.A_NAME_2ND = e2.E_NAME WHERE a.A_NUMBER = ?");
	    ApprovalVO vo = null;
	    EmployeeVO vo2 = new EmployeeVO();
	    EmployeeVO vo3 = new EmployeeVO();
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
	            String of1st = rs.getString("e1ST");
	            String name2rd = rs.getString("A_NAME_2ND");
	            String of2rd = rs.getString("e2RD");
	            Date startDate = rs.getDate("A_START_DATE");
	            String stampSelf = rs.getString("A_STAMP_SALF");
	            String stamp1st = rs.getString("A_STAMP_1ST");
	            String stamp2nd = rs.getString("A_STAMP_2ND");
	            vo = new ApprovalVO();
	            vo.setaName(name);
	            vo.setaDepartmentName(dname);
	            vo.setaTitle(title);
	            vo.setaContent(contents);
	            vo.setaName1st(name1st);
	            vo.setaName2nd(name2rd);
	            vo.setaStartDate(startDate);
	            vo.seteNumber(i);
	            vo.seteStampSelf(stampSelf);
	            vo.seteStamp1(stamp1st);
	            vo.seteStamp2(stamp2nd);
	            
	            vo2.seteOfficialResponsibilities(of1st);
	            vo3.seteOfficialResponsibilities(of2rd);
	            
	            
	            map.put("of1st", vo2.geteOfficialResponsibilities());
	            map.put("of2rd", vo3.geteOfficialResponsibilities());
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    
	    return vo;
	}
	
	
	public void addOne(ApprovalVO vo,EmployeeVO vo2) {
		sb.setLength(0);
		sb.append("INSERT INTO APPROVAL VALUES(APPROVAL_SEQ.NEXTVAL,?,?,SYSDATE,SYSDATE,?,?,?,?,'1차결재 대기중',null,?,?,null,null)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1,vo2.geteName());
			pstmt.setString(2,vo2.geteOfficialResponsibilities());
			pstmt.setString(3,vo.getaTitle());
			pstmt.setString(4,vo.getaContent());
			pstmt.setString(5,vo.getaName1st());
			pstmt.setString(6,vo.getaName2nd());
			pstmt.setInt(7,vo2.geteNumber());
			pstmt.setString(8,vo2.getEstamp());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	}
	
	public void updateOne(ApprovalVO vo,EmployeeVO s) {
		sb.setLength(0);
		sb.append("UPDATE APPROVAL SET ");
		if(s.geteOfficialResponsibilities().equals("과장")) {
			sb.append("A_STATUS = '2차결재 대기중',A_STAMP_1ST = ? WHERE A_NUMBER = ?");
		}else if(s.geteOfficialResponsibilities().equals("차장") || s.geteOfficialResponsibilities().equals("부사장")) {
			sb.append("A_STATUS = '결재완료', A_STAMP_2ND = ? WHERE A_NUMBER = ?");
		}else {
			sb.append("WHERE A_NUMBER = ?");
		}
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(2, vo.getaNumber());
			pstmt.setString(1, s.getEstamp());
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateTemp(int i,String s) {
		sb.setLength(0);
		sb.append("UPDATE APPROVAL SET A_STATUS = '1차결재 대기중',A_STAMP_SALF = ? WHERE A_NUMBER = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, s);
			pstmt.setInt(2, i);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void addOne(EmployeeVO vo2,ApprovalVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO APPROVAL VALUES(APPROVAL_SEQ.NEXTVAL,?,?,SYSDATE,SYSDATE,?,?,?,?,'임시',null,?,null,null,null)");
		
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

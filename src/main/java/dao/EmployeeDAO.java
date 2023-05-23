package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.EmployeeVO;

public class EmployeeDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "userhj";
	String password = "user12";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();


	public EmployeeDAO() {
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
	
	//전체 조회
	public ArrayList<EmployeeVO> selectAll(){
		ArrayList<EmployeeVO> list = new ArrayList<EmployeeVO>();
		sb.setLength(0);
		sb.append("SELECT * FROM employee ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int eNumber = rs.getInt("e_number");
				String eName = rs.getString("e_name");
				String eId = rs.getString("e_id");
				String ePassword = rs.getString("e_password");
				String ePhonenumber = rs.getString("e_phone_number");
				int ePostalCode = rs.getInt("e_postal_code");
				String eAddress1 = rs.getString("e_address1");
				String eAddress2 = rs.getString("e_address2");
				String eBirth = rs.getString("e_birth");
				String eDateJoiningCompany = rs.getString("e_date_joining_company");
				String eRetirementDate = rs.getString("e_retirement_date");
				String eAccountInformation = rs.getString("e_account_information");
				String eGender = rs.getString("e_gender");
				String eOfficialResponsibilities = rs.getString("e_official_responsibilities");
				int eTotalVacation = rs.getInt("e_total_vacation");
				String eServing = rs.getString("e_serving");
				String dName = rs.getString("d_name");
				String eStamp = rs.getString("e_stamp");
				EmployeeVO vo = new EmployeeVO(eNumber, eName, eId, ePassword, ePhonenumber, ePostalCode, eAddress1, eAddress2, eBirth, eDateJoiningCompany, eRetirementDate, eAccountInformation, eGender, eOfficialResponsibilities, eTotalVacation, eServing, dName,eStamp);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list; 
	}//selectAll() 끝
	

	public void empRegister(EmployeeVO vo) {
	    sb.setLength(0);
	    sb.append("INSERT INTO employee (E_NUMBER, E_NAME, E_ID, E_PASSWORD, E_PHONE_NUMBER, E_POSTAL_CODE, E_ADDRESS1, E_ADDRESS2, E_BIRTH, E_GENDER, D_NAME) VALUES (EMPLOYEE_SEQ.nextval,?,?,?,?,?,?,?,?,?,?)" );

	    try {
	        pstmt = conn.prepareStatement(sb.toString());

	        pstmt.setString(1, vo.geteName());
	        pstmt.setString(2, vo.geteId());
	        pstmt.setString(3, vo.getePassword());
	        pstmt.setString(4, vo.getePhonenumber());
	        pstmt.setInt(5, vo.getePostalCode());
	        pstmt.setString(6, vo.geteAddress1());
	        pstmt.setString(7, vo.geteAddress2());
	        pstmt.setString(8, vo.geteBirth());
	        pstmt.setString(9, vo.geteGender());
	        pstmt.setString(10, "기획"); // 임시 값으로 "N/A" 설정

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }				
	}	//empRegister() 끝
	
	public void updateOne(EmployeeVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO employee VALUES (EMPLOYEE_SEQ.nextval,?,?,emp_dname,emp_dno,emp,?,emp_status,?,?,?,?,emp_hiredate,emp_accountnum,?,emp_position,emp_resignationdate,emp_annualvacation,emp_image" ) ;

	}
	
	//회원가입 시 아이디 중복체크
	public EmployeeVO getOne(String eId) {
		EmployeeVO vo = null;
		sb.append("SELECT * FROM employee WHERE e_id=?");
		
		try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1,eId);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int eNumber = rs.getInt("e_number");
			String eName = rs.getString("e_name");
			String ePassword = rs.getString("e_password");
			String ePhonenumber = rs.getString("e_phone_number");
			int ePostalCode = rs.getInt("e_postal_code");
			String eAddress1 = rs.getString("e_address1");
			String eAddress2 = rs.getString("e_address2");
			String eBirth = rs.getString("e_birth");
			String eDateJoiningCompany = rs.getString("e_date_joining_company");
			String eRetirementDate = rs.getString("e_retirement_date");
			String eAccountInformation = rs.getString("e_account_information");
			String eGender = rs.getString("e_gender");
			String eOfficialResponsibilities = rs.getString("e_official_responsibilities");
			int eTotalVacation = rs.getInt("e_total_vacation");
			String eServing = rs.getString("e_serving");
			String dName = rs.getString("d_name");
			String eStamp = rs.getString("e_stamp");
			vo= new EmployeeVO(eNumber, eName, eId, ePassword, ePhonenumber, ePostalCode, eAddress1, eAddress2, eBirth, eDateJoiningCompany, eRetirementDate, eAccountInformation, eGender, eOfficialResponsibilities, eTotalVacation, eServing, dName,eStamp);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return vo;
		
	}	//getOne() end
	
	
	//메일 작성자,수신자 구하기
		public EmployeeVO getOne(int number) {
			EmployeeVO vo = null;
			sb.setLength(0);
			sb.append("SELECT * FROM employee WHERE e_number=? ");
			
			try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1,number);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int eNumber = rs.getInt("e_number");
				String eName = rs.getString("e_name");
				String eId = rs.getString("e_id");
				String ePassword = rs.getString("e_password");
				String ePhonenumber = rs.getString("e_phone_number");
				int ePostalCode = rs.getInt("e_postal_code");
				String eAddress1 = rs.getString("e_address1");
				String eAddress2 = rs.getString("e_address2");
				String eBirth = rs.getString("e_birth");
				String eDateJoiningCompany = rs.getString("e_date_joining_company");
				String eRetirementDate = rs.getString("e_retirement_date");
				String eAccountInformation = rs.getString("e_account_information");
				String eGender = rs.getString("e_gender");
				String eOfficialResponsibilities = rs.getString("e_official_responsibilities");
				int eTotalVacation = rs.getInt("e_total_vacation");
				String eServing = rs.getString("e_serving");
				String dName = rs.getString("d_name");
				String eStamp = rs.getString("e_stamp");
				vo= new EmployeeVO(eNumber, eName, eId, ePassword, ePhonenumber, ePostalCode, eAddress1, eAddress2, eBirth, eDateJoiningCompany, eRetirementDate, eAccountInformation, eGender, eOfficialResponsibilities, eTotalVacation, eServing, dName,eStamp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return vo;
			
		}	
	
	
	
	// 로그인 시 IP와 PW 입력하면 vo 객체를 리턴
	public EmployeeVO getOne(String eId, String ePassword) {
		EmployeeVO vo = null;
		sb.setLength(0);
		sb.append("SELECT * FROM employee WHERE e_id=? and e_password=?");
		
		try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1,eId);
		pstmt.setString(2,ePassword);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int eNumber = rs.getInt("e_number");
			String eName = rs.getString("e_name");
			String ePhonenumber = rs.getString("e_phone_number");
			int ePostalCode = rs.getInt("e_postal_code");
			String eAddress1 = rs.getString("e_address1");
			String eAddress2 = rs.getString("e_address2");
			String eBirth = rs.getString("e_birth");
			String eDateJoiningCompany = rs.getString("e_date_joining_company");
			String eRetirementDate = rs.getString("e_retirement_date");
			String eAccountInformation = rs.getString("e_account_information");
			String eGender = rs.getString("e_gender");
			String eOfficialResponsibilities = rs.getString("e_official_responsibilities");
			int eTotalVacation = rs.getInt("e_total_vacation");
			String eServing = rs.getString("e_serving");
			String dName = rs.getString("d_name");
			String eStamp = rs.getString("e_stamp");
			vo= new EmployeeVO(eNumber, eName, eId, ePassword, ePhonenumber, ePostalCode, eAddress1, eAddress2, eBirth, eDateJoiningCompany, eRetirementDate, eAccountInformation, eGender, eOfficialResponsibilities, eTotalVacation, eServing, dName,eStamp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return vo;
			
		}	//getOne() end
		
	public String getEmployeeIdByUsername(String eName) {
        String eId = null;
        try {
            String query = "SELECT e_id FROM employee WHERE e_name = ? ";
            
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, eName);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                eId = rs.getString("E_ID");
            }
            
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
		/*
		 * sb.setLength(0); sb.append("SELECT e_id FROM employee WHERE e_name = ? ");
		 * 
		 * pstmt = conn.prepareStatement(sb.toString()); pstmt.setString(1, eName);
		 * 
		 * ResultSet rs = pstmt.executeQuery(); if (rs.next()) { eId =
		 * rs.getString("e_id"); }
		 * 
		 * rs.close();
		 * 
		 */
        return eId;
    }
	
	public void close() {
		if(rs!=null)
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}


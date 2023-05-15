package hj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
				int e_number = rs.getInt("e_number");
				String e_name = rs.getString("e_name");
				String e_id = rs.getString("e_id");
				String e_password = rs.getString("e_password");
				String e_phone_number = rs.getString("e_phone_number");
				int e_postal_code = rs.getInt("e_postal_code");
				String e_address1 = rs.getString("e_address1");
				String e_address2 = rs.getString("e_address2");
				String e_birth = rs.getString("e_birth");
				String e_date_joining_company = rs.getString("e_date_joining_company");
				String e_retirement_date = rs.getString("e_retirement_date");
				String e_account_information = rs.getString("e_account_information");
				String e_gender = rs.getString("e_gender");
				String e_official_responsibilities = rs.getString("e_official_responsibilities");
				int e_total_vacation = rs.getInt("e_total_vacation");
				String e_serving = rs.getString("e_serving");
				String d_name = rs.getString("d_name");
				EmployeeVO vo = new EmployeeVO(e_number, e_name, e_id, e_password, e_phone_number, e_postal_code, e_address1, e_address2, e_birth, e_date_joining_company, e_retirement_date, e_account_information, e_gender, e_official_responsibilities, e_total_vacation, e_serving, d_name);
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

	        pstmt.setString(1, vo.getE_name());
	        pstmt.setString(2, vo.getE_id());
	        pstmt.setString(3, vo.getE_password());
	        pstmt.setString(4, vo.getE_phone_number());
	        pstmt.setInt(5, vo.getE_postal_code());
	        pstmt.setString(6, vo.getE_address1());
	        pstmt.setString(7, vo.getE_address2());
	        pstmt.setString(8, vo.getE_birth());
	        pstmt.setString(9, vo.getE_gender());
	        pstmt.setString(10, "기획팀"); // 임시 값으로 "N/A" 설정

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }				
	}	//empRegister() 끝
	
	public void updateOne(EmployeeVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO employee VALUES (EMPLOYEE_SEQ.nextval,?,?,emp_dname,emp_dno,emp,?,emp_status,?,?,?,?,emp_hiredate,emp_accountnum,?,emp_position,emp_resignationdate,emp_annualvacation,emp_image" ) ;

	}
	
	//아이디 중복체크
	public EmployeeVO getOne(String id) {
		EmployeeVO vo = null;
		sb.append("SELECT * FROM employee WHERE e_id=?");
		
		try {
		pstmt = conn.prepareStatement(sb.toString());
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int e_number = rs.getInt("e_number");
			String e_name = rs.getString("e_name");
			String e_password = rs.getString("e_password");
			String e_phone_number = rs.getString("e_phone_number");
			int e_postal_code = rs.getInt("e_postal_code");
			String e_address1 = rs.getString("e_address1");
			String e_address2 = rs.getString("e_address2");
			String e_birth = rs.getString("e_birth");
			String e_date_joining_company = rs.getString("e_date_joining_company");
			String e_retirement_date = rs.getString("e_retirement_date");
			String e_account_information = rs.getString("e_account_information");
			String e_gender = rs.getString("e_gender");
			String e_official_responsibilities = rs.getString("e_official_responsibilities");
			int e_total_vacation = rs.getInt("e_total_vacation");
			String d_name = rs.getString("d_name");
			vo= new EmployeeVO(e_number, e_name, id, e_password, e_phone_number, e_postal_code, e_address1, e_address2, e_birth, e_date_joining_company, e_retirement_date, e_account_information, e_gender, e_official_responsibilities, e_total_vacation, e_official_responsibilities, d_name);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return vo;
		
	}	//getOne() end
	
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


package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import vo.BoardVO;

public class BoardDAO {
	//기본생성자 1~3
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "userhj";
	String password = "user12";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();
	
	public BoardDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("conn : "+conn);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}
		
	}	//기본생성자 end

	public ArrayList<BoardVO> selectAll(){
		//최근 데이터 20개만 가져오기
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		sb.append("SELECT RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT ROWNUM RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number  ");
		sb.append("FROM BOARD ");
		sb.append("ORDER BY B_NO DESC) ");
		sb.append("WHERE ROWNUM <=30) ");
		sb.append("WHERE RN >= 21 ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNo = rs.getInt("b_no");
				String bTitle = rs.getString("b_title");
				String bContent = rs.getString("b_content");
				String bWriter = rs.getString("b_writer");
				String bRegdate = rs.getString("b_regdate");
				int bView = rs.getInt("b_view");
				int eNumber = rs.getInt("e_number");
				BoardVO vo = new BoardVO(bNo, bTitle, bContent, bWriter, bRegdate, bView, eNumber);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;			
	}//selectAll() 끝
	
	public ArrayList<BoardVO> selectAll(int startNo, int endNo){
		//최근 데이터 20개만 가져오기
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		sb.setLength(0);
		/* sb.append("SELECT * FROM BOARD ORDER BY B_NO DESC LIMIT ?,? "); */
		sb.append("SELECT RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT ROWNUM RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM BOARD ");
		sb.append("ORDER BY B_NO DESC) ");
		sb.append("WHERE ROWNUM <=?) ");
		sb.append("WHERE RN >= ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
	        pstmt.setInt(2, startNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bNo = rs.getInt("b_no");
				String bTitle = rs.getString("b_title");
				String bContent = rs.getString("b_content");
				String bWriter = rs.getString("b_writer");
				String bRegdate = rs.getString("b_regdate");
				int bView = rs.getInt("b_view");
				int eNumber = rs.getInt("e_number");
				BoardVO vo = new BoardVO(bNo, bTitle, bContent, bWriter, bRegdate, bView, eNumber);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;			
	}//selectAll() 끝

	public void addOne(BoardVO vo) { 
		sb.setLength(0);
		sb.append("INSERT INTO board VALUES (?, ?,?,?,sysdate,0,?) "); 
		try { 
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setInt(1, vo.getbNo()); 
			pstmt.setString(2, vo.getbTitle()); 
			pstmt.setString(3, vo.getbContent());
			pstmt.setString(4, vo.getbWriter()); 
			pstmt.setInt(5, vo.geteNumber()); //로그인한 사원의 사원번호 전달
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) { 
			e.printStackTrace(); 
		} 
	}
	

	//addOne() 끝
		/*sb.append("INSERT INTO board VALUES (board_seq.nextval, ?,?,?,sysdate,0,?) "); 
		try { 
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getbTitle()); 
			pstmt.setString(2, vo.getbContent());
			pstmt.setString(3, vo.getbWriter()); 
			pstmt.setInt(4, vo.geteNumber()); //로그인한 사원의 사원번호 전달
			
			pstmt.executeUpdate();
	
		} catch (SQLException e) { 
			e.printStackTrace(); 
			} 
		}//addOne() 끝*/
	
	public BoardVO selectOne(int b_no) {
		BoardVO vo = null; //vo초기화
		sb.setLength(0);
		sb.append("SELECT * FROM board WHERE b_no = ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1, b_no);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				String bTitle = rs.getString("b_title");
				String bContent = rs.getString("b_content");
				String bWriter = rs.getString("b_writer");
				String bRegdate = rs.getString("b_regdate");
				int bView = rs.getInt("b_view");
				int eNumber = rs.getInt("e_number");
				/* bView++; */
				vo = new BoardVO(b_no, bTitle, bContent, bWriter, bRegdate, bView, eNumber);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	
	}
	
	/*
	 * //게시글 조회수 public BoardVO getBoardOne(int b_no) { BoardVO vo = null; //vo초기화
	 * sb.setLength(0); sb.append("SELECT * FROM board WHERE b_no = ? ");
	 * 
	 * try { pstmt= conn.prepareStatement(sb.toString()); pstmt.setInt(1, b_no);
	 * 
	 * rs= pstmt.executeQuery();
	 * 
	 * while(rs.next()) { String bTitle = rs.getString("b_title"); String bContent =
	 * rs.getString("b_content"); String bWriter = rs.getString("b_writer"); String
	 * bRegdate = rs.getString("b_regdate"); int bView = rs.getInt("b_view"); int
	 * eNumber = rs.getInt("e_number"); bView++; countUpdate(bView,b_no); vo = new
	 * BoardVO(b_no, bTitle, bContent, bWriter, bRegdate, bView, eNumber); } } catch
	 * (SQLException e) { e.printStackTrace(); } return vo; }
	 */
	
	public void countUpdate(BoardVO vo) {
		sb.setLength(0);
		sb.append("UPDATE board SET b_view = b_view+1 WHERE b_no = ? " );
		try {
			pstmt = conn.prepareStatement(sb.toString());
			/*pstmt.setInt(1, bView);//물음표의 순서*/			
			pstmt.setInt(1, vo.getbNo());
			
			pstmt.executeUpdate();//insert,delete,update			
		} catch(Exception e) {
			e.printStackTrace();
		} 
		//return -1;//데이터베이스 오류
	}
	
	//게시글 수정
	public void updateOne(BoardVO vo) {
		sb.setLength(0);
		sb.append("UPDATE board SET b_title = ? , b_content=? , b_regdate=sysdate where b_no = ? ");
	
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getbTitle());
			pstmt.setString(2, vo.getbContent());
			pstmt.setInt(3, vo.getbNo());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//게시글 삭제
	public void deleteOne(int bNo) {
		sb.setLength(0);
		sb.append("DELETE FROM board WHERE b_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bNo);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//총 갯수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) FROM board ");
		int count = 0;
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt("count(*)");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//글번호 얻어오기?
	public int getBseq() {
		int result = -1;
		sb.setLength(0);
		sb.append("SELECT board_seq.nextval FROM dual " );
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			rs= pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//자원반납
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

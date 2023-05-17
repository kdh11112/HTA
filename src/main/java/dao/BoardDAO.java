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
	String url = "jdbc:oracle:thin:@192.168.0.3:1521:orcl";
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
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("b_writer");
				String b_regdate = rs.getString("b_regdate");
				int b_view = rs.getInt("b_view");
				int e_number = rs.getInt("e_number");
				BoardVO vo = new BoardVO(b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number);
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
		sb.append("SELECT RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT ROWNUM RN, b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number ");
		sb.append("FROM(SELECT b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number  )");
		sb.append("FROM BOARD ");
		sb.append("ORDER BY BNO DESC) ");
		sb.append("WHERE ROWNUM <=?) ");
		sb.append("WHERE RN >= ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1,endNo);
			pstmt.setInt(2,startNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("b_writer");
				String b_regdate = rs.getString("b_regdate");
				int b_view = rs.getInt("b_view");
				int e_number = rs.getInt("e_number");
				BoardVO vo = new BoardVO(b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;			
	}//selectAll() 끝
	
	//게시판 글 작성
	public void addOne(BoardVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO board VALUES (board_seq.nextval, ?,?,?,sysdate,0,0) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, vo.getB_title());
			pstmt.setString(2, vo.getB_content());
			pstmt.setString(3, vo.getB_writer());
			//현재시간
			//pstmt.setString(4, vo.getRegdate());
			
			//입력하면 처음엔 조회수 무조건 0이니까 
			//pstmt.setInt(5, vo.getHits());
			
			//pstmt.setString(4, vo.getIp());
			//상태정보 : 1정상글 2블라인드처리 3경찰요청 ~~~이라고 설정
			//pstmt.setInt(7, vo.getStatus());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//addOne() 끝
	
	public BoardVO selectOne(int b_no) {
		BoardVO vo = null; //vo초기화
		sb.setLength(0);
		sb.append("SELECT * FROM board WHERE b_no = ? ");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setInt(1, b_no);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("b_writer");
				String b_regdate = rs.getString("b_regdate");
				int b_view = rs.getInt("b_view");
				int e_number = rs.getInt("e_number");
				vo = new BoardVO(b_no, b_title, b_content, b_writer, b_regdate, b_view, e_number);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	
	}
	
	//게시글 수정
	public void updateOne(BoardVO vo) {
		sb.setLength(0);
		sb.append("UPDATE board SET title = ? , contents=? , regdate=sysdate where bno = ? ");
	
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getB_title());
			pstmt.setString(2, vo.getB_content());
			pstmt.setInt(3, vo.getB_no());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//게시글 삭제
	public void deleteOne(int b_no) {
		sb.setLength(0);
		sb.append("DELETE FROM board WHERE b_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, b_no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//총 갯수
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("SELECT COUNT(*) cnt FROM board ");
		int cnt = 0;
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
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

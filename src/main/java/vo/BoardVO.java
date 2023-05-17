package vo;

public class BoardVO {
	
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private String b_regdate;
	private int b_view;
	private int e_number;
	
	public BoardVO() {
		
	}
	public BoardVO(int b_no, String b_title, String b_content, String b_writer, String b_regdate, int b_view,
			int e_number) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writer = b_writer;
		this.b_regdate = b_regdate;
		this.b_view = b_view;
		this.e_number = e_number;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(String b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public int getE_number() {
		return e_number;
	}
	public void setE_number(int e_number) {
		this.e_number = e_number;
	}
	
}

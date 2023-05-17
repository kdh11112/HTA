package vo;

public class BoardVO {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bRegdate;
	private int bView;
	private int eNumber;
	
	public BoardVO() {
		
	}

	public BoardVO(int bNo, String bTitle, String bContent, String bWriter, String bRegdate, int bView, int eNumber) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bRegdate = bRegdate;
		this.bView = bView;
		this.eNumber = eNumber;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbRegdate() {
		return bRegdate;
	}

	public void setbRegdate(String bRegdate) {
		this.bRegdate = bRegdate;
	}

	public int getbView() {
		return bView;
	}

	public void setbView(int bView) {
		this.bView = bView;
	}

	public int geteNumber() {
		return eNumber;
	}

	public void seteNumber(int eNumber) {
		this.eNumber = eNumber;
	}
	
	
}

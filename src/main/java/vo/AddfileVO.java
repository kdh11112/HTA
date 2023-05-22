package vo;

public class AddfileVO {
	
	private int bNo;
	private String fName;
	private String fLoc;
	
	
	public AddfileVO() {
		
	}

	public AddfileVO(int bNo, String fName, String fLoc) {
		super();
		this.bNo = bNo;
		this.fName = fName;
		this.fLoc = fLoc;
	}

	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public String getfName() {
		return fName;
	}


	public void setfName(String fName) {
		this.fName = fName;
	}


	public String getfLoc() {
		return fLoc;
	}


	public void setfLoc(String fLoc) {
		this.fLoc = fLoc;
	}
	
	
	
	}
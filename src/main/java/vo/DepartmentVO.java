package vo;

public class DepartmentVO {
	String dName;
	int dNumber;
	String dLoc;
	
	public DepartmentVO() {}
	
	public DepartmentVO(String dName, int dNumber, String dLoc) {
		super();
		this.dName = dName;
		this.dNumber = dNumber;
		this.dLoc = dLoc;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public int getdNumber() {
		return dNumber;
	}
	public void setdNumber(int dNumber) {
		this.dNumber = dNumber;
	}
	public String getdLoc() {
		return dLoc;
	}
	public void setdLoc(String dLoc) {
		this.dLoc = dLoc;
	}
	
	
}

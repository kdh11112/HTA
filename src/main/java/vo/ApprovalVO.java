package vo;

import java.util.Date;

public class ApprovalVO {
	
	private int aNumber;
	private String aName;
	private String aDepartmentName;
	private Date aStartDate;
	private Date aEndDate;
	private String aTitle;
	private String aContent;
	private String aName1st;
	private String aName2nd;
	private String aStatus;
	private String aSave;
	private int eNumber;
	
	
	
	
	public ApprovalVO() {}




	public ApprovalVO(int aNumber, String aName, String aDepartmentName, Date aStartDate, Date aEndDate, String aTitle,
			String aContent, String aName1st, String aName2nd, String aStatus, String aSave, int eNumber) {
		super();
		this.aNumber = aNumber;
		this.aName = aName;
		this.aDepartmentName = aDepartmentName;
		this.aStartDate = aStartDate;
		this.aEndDate = aEndDate;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aName1st = aName1st;
		this.aName2nd = aName2nd;
		this.aStatus = aStatus;
		this.aSave = aSave;
		this.eNumber = eNumber;
	}




	public int getaNumber() {
		return aNumber;
	}




	public void setaNumber(int aNumber) {
		this.aNumber = aNumber;
	}




	public String getaName() {
		return aName;
	}




	public void setaName(String aName) {
		this.aName = aName;
	}




	public String getaDepartmentName() {
		return aDepartmentName;
	}




	public void setaDepartmentName(String aDepartmentName) {
		this.aDepartmentName = aDepartmentName;
	}




	public Date getaStartDate() {
		return aStartDate;
	}




	public void setaStartDate(Date aStartDate) {
		this.aStartDate = aStartDate;
	}




	public Date getaEndDate() {
		return aEndDate;
	}




	public void setaEndDate(Date aEndDate) {
		this.aEndDate = aEndDate;
	}




	public String getaTitle() {
		return aTitle;
	}




	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}




	public String getaContent() {
		return aContent;
	}




	public void setaContent(String aContent) {
		this.aContent = aContent;
	}




	public String getaName1st() {
		return aName1st;
	}




	public void setaName1st(String aName1st) {
		this.aName1st = aName1st;
	}




	public String getaName2nd() {
		return aName2nd;
	}




	public void setaName2nd(String aName2nd) {
		this.aName2nd = aName2nd;
	}




	public String getaStatus() {
		return aStatus;
	}




	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
	}




	public String getaSave() {
		return aSave;
	}




	public void setaSave(String aSave) {
		this.aSave = aSave;
	}




	public int geteNumber() {
		return eNumber;
	}




	public void seteNumber(int eNumber) {
		this.eNumber = eNumber;
	}




	@Override
	public String toString() {
		return "ApprovalVO [aNumber=" + aNumber + ", aName=" + aName + ", aDepartmentName=" + aDepartmentName
				+ ", aStartDate=" + aStartDate + ", aEndDate=" + aEndDate + ", aTitle=" + aTitle + ", aContent="
				+ aContent + ", aName1st=" + aName1st + ", aName2nd=" + aName2nd + ", aStatus=" + aStatus + ", aSave="
				+ aSave + ", eNumber=" + eNumber + "]";
	}

	
}

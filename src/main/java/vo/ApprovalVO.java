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
	
	private int eENumber1;
	private int eEnumber2;
	private String eEname1;
	private String eEname2;
	private String eEof1;
	private String eEof2;
	private String eStampSelf;
	private String eStamp1;
	private String eStamp2;
	
	
	
	public ApprovalVO() {}


	




	public ApprovalVO(int aNumber, String aName, String aDepartmentName, Date aStartDate, Date aEndDate, String aTitle,
			String aContent, String aName1st, String aName2nd, String aStatus, String aSave, int eNumber, int eENumber1,
			int eEnumber2, String eEname1, String eEname2, String eEof1, String eEof2, String eStampSelf,
			String eStamp1, String eStamp2) {
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
		this.eENumber1 = eENumber1;
		this.eEnumber2 = eEnumber2;
		this.eEname1 = eEname1;
		this.eEname2 = eEname2;
		this.eEof1 = eEof1;
		this.eEof2 = eEof2;
		this.eStampSelf = eStampSelf;
		this.eStamp1 = eStamp1;
		this.eStamp2 = eStamp2;
	}







	public int geteENumber1() {
		return eENumber1;
	}


	public void seteENumber1(int eENumber1) {
		this.eENumber1 = eENumber1;
	}


	public int geteEnumber2() {
		return eEnumber2;
	}


	public void seteEnumber2(int eEnumber2) {
		this.eEnumber2 = eEnumber2;
	}


	public String geteEname1() {
		return eEname1;
	}


	public void seteEname1(String eEname1) {
		this.eEname1 = eEname1;
	}


	public String geteEname2() {
		return eEname2;
	}


	public void seteEname2(String eEname2) {
		this.eEname2 = eEname2;
	}


	public String geteEof1() {
		return eEof1;
	}


	public void seteEof1(String eEof1) {
		this.eEof1 = eEof1;
	}


	public String geteEof2() {
		return eEof2;
	}


	public void seteEof2(String eEof2) {
		this.eEof2 = eEof2;
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







	public String geteStampSelf() {
		return eStampSelf;
	}







	public void seteStampSelf(String eStampSelf) {
		this.eStampSelf = eStampSelf;
	}







	public String geteStamp1() {
		return eStamp1;
	}







	public void seteStamp1(String eStamp1) {
		this.eStamp1 = eStamp1;
	}







	public String geteStamp2() {
		return eStamp2;
	}







	public void seteStamp2(String eStamp2) {
		this.eStamp2 = eStamp2;
	}


	
}

package vo;

public class EmployeeVO {
	private int eNumber;
	private String eName;
	private String eId;
	private String ePassword;
	private String ePhonenumber;
	private int ePostalCode;
	private String eAddress1;
	private String eAddress2;
	private String eBirth;
	private String eDateJoiningCompany;
	private String eRetirementDate;
	private String eAccountInformation;
	private String eGender;
	private String eOfficialResponsibilities;
	private int eTotalVacation;
	private String eServing;
	private String dName;
	private String estamp;
	
	public EmployeeVO() {
		
	}
	
	

	public EmployeeVO(int eNumber, String eName, String eId, String ePassword, String ePhonenumber, int ePostalCode,
			String eAddress1, String eAddress2, String eBirth, String eDateJoiningCompany, String eRetirementDate,
			String eAccountInformation, String eGender, String eOfficialResponsibilities, int eTotalVacation,
			String eServing, String dName, String estamp) {
		super();
		this.eNumber = eNumber;
		this.eName = eName;
		this.eId = eId;
		this.ePassword = ePassword;
		this.ePhonenumber = ePhonenumber;
		this.ePostalCode = ePostalCode;
		this.eAddress1 = eAddress1;
		this.eAddress2 = eAddress2;
		this.eBirth = eBirth;
		this.eDateJoiningCompany = eDateJoiningCompany;
		this.eRetirementDate = eRetirementDate;
		this.eAccountInformation = eAccountInformation;
		this.eGender = eGender;
		this.eOfficialResponsibilities = eOfficialResponsibilities;
		this.eTotalVacation = eTotalVacation;
		this.eServing = eServing;
		this.dName = dName;
		this.estamp = estamp;
	}



	public int geteNumber() {
		return eNumber;
	}

	public void seteNumber(int eNumber) {
		this.eNumber = eNumber;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getePassword() {
		return ePassword;
	}

	public void setePassword(String ePassword) {
		this.ePassword = ePassword;
	}

	public String getePhonenumber() {
		return ePhonenumber;
	}

	public void setePhonenumber(String ePhonenumber) {
		this.ePhonenumber = ePhonenumber;
	}

	public int getePostalCode() {
		return ePostalCode;
	}

	public void setePostalCode(int ePostalCode) {
		this.ePostalCode = ePostalCode;
	}

	public String geteAddress1() {
		return eAddress1;
	}

	public void seteAddress1(String eAddress1) {
		this.eAddress1 = eAddress1;
	}

	public String geteAddress2() {
		return eAddress2;
	}

	public void seteAddress2(String eAddress2) {
		this.eAddress2 = eAddress2;
	}

	public String geteBirth() {
		return eBirth;
	}

	public void seteBirth(String eBirth) {
		this.eBirth = eBirth;
	}

	public String geteDateJoiningCompany() {
		return eDateJoiningCompany;
	}

	public void seteDateJoiningCompany(String eDateJoiningCompany) {
		this.eDateJoiningCompany = eDateJoiningCompany;
	}

	public String geteRetirementDate() {
		return eRetirementDate;
	}

	public void seteRetirementDate(String eRetirementDate) {
		this.eRetirementDate = eRetirementDate;
	}

	public String geteAccountInformation() {
		return eAccountInformation;
	}

	public void seteAccountInformation(String eAccountInformation) {
		this.eAccountInformation = eAccountInformation;
	}

	public String geteGender() {
		return eGender;
	}

	public void seteGender(String eGender) {
		this.eGender = eGender;
	}

	public String geteOfficialResponsibilities() {
		return eOfficialResponsibilities;
	}

	public void seteOfficialResponsibilities(String eOfficialResponsibilities) {
		this.eOfficialResponsibilities = eOfficialResponsibilities;
	}

	public int geteTotalVacation() {
		return eTotalVacation;
	}

	public void seteTotalVacation(int eTotalVacation) {
		this.eTotalVacation = eTotalVacation;
	}

	public String geteServing() {
		return eServing;
	}

	public void seteServing(String eServing) {
		this.eServing = eServing;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}



	public String getEstamp() {
		return estamp;
	}


	public void setEstamp(String estamp) {
		this.estamp = estamp;
	}

}
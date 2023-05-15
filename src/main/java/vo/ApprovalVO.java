package vo;

import java.util.Date;

public class ApprovalVO {
	
	private int a_number;
	private String a_name;
	private String a_department_name;
	private Date a_start_date;
	private Date a_end_date;
	private String a_title;
	private String a_content;
	private String a_name_1st;
	private String a_name_2nd;
	private String a_status;
	private String a_save;
	private String e_number;
	
	
	
	
	public ApprovalVO() {}




	public ApprovalVO(int a_number, String a_name, String a_department_name, Date a_start_date, Date a_end_date,
			String a_title, String a_content, String a_name_1st, String a_name_2nd, String a_status, String a_save,
			String e_number) {
		super();
		this.a_number = a_number;
		this.a_name = a_name;
		this.a_department_name = a_department_name;
		this.a_start_date = a_start_date;
		this.a_end_date = a_end_date;
		this.a_title = a_title;
		this.a_content = a_content;
		this.a_name_1st = a_name_1st;
		this.a_name_2nd = a_name_2nd;
		this.a_status = a_status;
		this.a_save = a_save;
		this.e_number = e_number;
	}




	public int getA_number() {
		return a_number;
	}




	public void setA_number(int a_number) {
		this.a_number = a_number;
	}




	public String getA_name() {
		return a_name;
	}




	public void setA_name(String a_name) {
		this.a_name = a_name;
	}




	public String getA_department_name() {
		return a_department_name;
	}




	public void setA_department_name(String a_department_name) {
		this.a_department_name = a_department_name;
	}




	public Date getA_start_date() {
		return a_start_date;
	}




	public void setA_start_date(Date a_start_date) {
		this.a_start_date = a_start_date;
	}




	public Date getA_end_date() {
		return a_end_date;
	}




	public void setA_end_date(Date a_end_date) {
		this.a_end_date = a_end_date;
	}




	public String getA_title() {
		return a_title;
	}




	public void setA_title(String a_title) {
		this.a_title = a_title;
	}




	public String getA_content() {
		return a_content;
	}




	public void setA_content(String a_content) {
		this.a_content = a_content;
	}




	public String getA_name_1st() {
		return a_name_1st;
	}




	public void setA_name_1st(String a_name_1st) {
		this.a_name_1st = a_name_1st;
	}




	public String getA_name_2nd() {
		return a_name_2nd;
	}




	public void setA_name_2nd(String a_name_2nd) {
		this.a_name_2nd = a_name_2nd;
	}




	public String getA_status() {
		return a_status;
	}




	public void setA_status(String a_status) {
		this.a_status = a_status;
	}




	public String getA_save() {
		return a_save;
	}




	public void setA_save(String a_save) {
		this.a_save = a_save;
	}




	public String getE_number() {
		return e_number;
	}




	public void setE_number(String e_number) {
		this.e_number = e_number;
	}




	@Override
	public String toString() {
		return "ApprovalVO [a_number=" + a_number + ", a_name=" + a_name + ", a_department_name=" + a_department_name
				+ ", a_start_date=" + a_start_date + ", a_end_date=" + a_end_date + ", a_title=" + a_title
				+ ", a_content=" + a_content + ", a_name_1st=" + a_name_1st + ", a_name_2nd=" + a_name_2nd
				+ ", a_status=" + a_status + ", a_save=" + a_save + ", e_number=" + e_number + "]";
	}
	
	
}

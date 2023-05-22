package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailVO {

	public int mNumber;
	public String mTitle;
	public String mContent;
	public String mFile;
	public String mCc;
	public Date mRegdate;
	public int mWType = 1;
	public int mRType = 1;
	
	
	public int eNumber;
	public int eNumber2;
	

	
	
}

package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailVO {

	int mNumber;
	String mTitle;
	String mContent;
	String mFile;
	String mCc;
	Date mRegdate;
	String mBoard;
	
	int eNumber;
	int eNumber2;
	

	
	
}

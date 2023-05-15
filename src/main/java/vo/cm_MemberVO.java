package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// value Object(vo), java bean, POJO(plain old java object)
@NoArgsConstructor
@AllArgsConstructor
@Data
public class cm_MemberVO {
//	멤버변수 : 컬럼명
	int no;
	String id, pw, name, gender, motive;
	
//	@Override
//	public String toString() {
//		String msg = "MemberVO( id = " + this.id +  
//				", pw = "+ this.pw +
//				", name = " + this.name + 
//				", gender = " + this.gender + 
//				", motive = " + this.motive + " )";
//		return msg;
//		
//	}
}

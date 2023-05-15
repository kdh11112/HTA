package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {
	int S_NUMBER;
	String S_CONTENTS;
	String S_START_DATE;
	String S_END_DATE;
	int E_NUMBER;
	
} 

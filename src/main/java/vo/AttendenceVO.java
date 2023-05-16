package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendenceVO {
	int attendanceNo;
	String workingDate;
	String officeGoingHour;
	String QuittingTime;
	String attendanceStatus;
}

//ATTENDANCE_SEQ -- 시퀀스
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
	String quittingTime;
	String attendanceStatus;
}

//ATTENDANCE_SEQ -- 시퀀스
package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendenceVO {
int ATTENDANCE_NO;
String WORKING_DATE;
String OFFICE_GOING_HOUR;
String QUITTING_TIME;
String ATTENDANCE_STATUS;
}


//ATTENDANCE_SEQ -- 시퀀스
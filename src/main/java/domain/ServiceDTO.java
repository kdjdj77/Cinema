package domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class ServiceDTO {
	private int id;
	private UserDTO user;
	private String title;
	private String content;
	private int viewCnt;
	private LocalDateTime regDate;
	
	private int cmtCheck;
	
	public String getRegDateTime() {
		if(this.regDate == null) return "";		
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	
}

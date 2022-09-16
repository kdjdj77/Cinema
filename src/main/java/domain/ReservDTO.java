package domain;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReservDTO {
    private int id;
    private UserDTO user;
	private MovieDTO movie;
    private String seat;
    private String fileName;
    private int seatTotal;
	/*
	 * private LocalDateTime regDate;
	 * 
	 * // String 으로 리턴하는 getter public String getRegDateTime() { if(this.regDate ==
	 * null) return ""; return
	 * this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")); }
	 */
    
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	@JsonProperty("regdate")
	private LocalDateTime regDate;




} // end DTO



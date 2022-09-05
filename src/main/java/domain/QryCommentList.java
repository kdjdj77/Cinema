package domain;


import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QryCommentList extends QryResult{
	// data라는 이름으로 list 전달
	@JsonProperty("data")	// JSON 으로 매핑될 property name
	List<SCommentDTO> list;	// 목록데이터
	
}

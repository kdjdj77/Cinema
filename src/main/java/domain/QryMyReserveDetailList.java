//댓글의 목록을 담기 위한 용도
package domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QryMyReserveDetailList extends QryResult{
	@JsonProperty("data")
	List<ReservDTO> list; //목록데이터
}

package domain;

import java.sql.SQLException;
import java.util.List;

public interface ReservDAO {
	// 영화 id값으로 예매된 좌석 불러오기
	public abstract List<String> seatCheck(int id) throws SQLException;
	
	// 예매하기
	public abstract int insert(ReservDTO dto) throws SQLException;

}

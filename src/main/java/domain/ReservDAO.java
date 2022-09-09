package domain;

import java.sql.SQLException;
import java.util.List;

public interface ReservDAO {
	// 영화 id값으로 예매된 좌석 불러오기
	public abstract List<String> seatCheck(int id) throws SQLException;
	
	// 예매하기
	public abstract int insert(ReservDTO dto) throws SQLException;

	// 예매 취소소
	public abstract int delete(int id) throws SQLException;

	// 최근 5개
	List<ReservDTO> recentMyReserve(int user_id) throws SQLException;
	
	// 전체
	List<ReservDTO> myReserve(int user_id) throws SQLException;
	
	// 특정 예매 확인
	List<ReservDTO> selectById(int id) throws SQLException;
}

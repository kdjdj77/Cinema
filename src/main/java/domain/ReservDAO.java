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
	public abstract List<ReservDTO> mypageTicketList(int user_id) throws SQLException;
	
	// 특정 예매 확인
	List<ReservDTO> selectById(int id) throws SQLException;
	
	public abstract int selectByMovieId(int movie_id) throws SQLException;
	
	
	public abstract int selectByUserId(int user_id) throws SQLException;
	
	
	/*
	 * // 페이징 // 몇번째(from) 부터 몇개(rows) 를 SELECT public List<ReservDTO>
	 * selectFromRow(int user_id ,int from, int rows) throws SQLException;
	 * 
	 * // 전체 글의 개수 public int countAll(int user_id) throws SQLException;
	 */
}

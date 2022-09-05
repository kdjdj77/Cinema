package service.movie;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.MovieDAO;
import domain.MovieDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		SqlSession sqlSession = null;
		MovieDAO dao = null;		
		List<MovieDTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(MovieDAO.class);
			
			list = dao.select();			
			for(MovieDTO m : list) {
				m.setStar(
					getMean(dao.selectStars(m.getId()))
				);
			}

			sqlSession.commit();
		} catch (SQLException e) {  
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		request.setAttribute("dtolist", list);
	}
	public float getMean(int[] list) {
		int sum = 0;
		int len = list.length;
		
		for (int i : list) sum += i;
		
		return (int)(((float)sum / len) * 10) / (float)10;
	}
}

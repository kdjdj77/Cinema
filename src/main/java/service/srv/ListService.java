package service.srv;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import domain.ServiceDAO;
import domain.ServiceDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		SqlSession sqlSession = null;
		ServiceDAO dao = null;

		List<ServiceDTO> list = null;

		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(ServiceDAO.class);
			
			list = dao.select();
			for(ServiceDTO s : list) {
				s.setCmtCheck(dao.checkCmt(s.getId()).length);
			}
			
			
			// "list" 란 name 으로 request 에 list 저장
			// 즉, request 에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", list);
			
			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}

	} // end execute()

}

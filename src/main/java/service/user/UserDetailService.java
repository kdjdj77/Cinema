package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.UserDAO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class UserDetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		SqlSession sqlSession = null;
		UserDAO dao = null;

		
		List<UserDTO> list = null;

		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);

			// 읽기
			list = dao.selectById(id);

			UserDTO loggedUser = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
			UserDTO realUser = list.get(0);
			if(loggedUser.getId() != realUser.getId()) {
				response.sendRedirect(request.getContextPath() + "/user/rejectAuth");
				return;
			}
			
			

			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		request.setAttribute("list", list);
	}


}

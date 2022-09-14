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

public class UserInfoService implements Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		SqlSession sqlSession = null;
		UserDAO dao = null;
		
		List<UserDTO> list = null;

		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);
			
			list = dao.selectById(id);
			for(UserDTO u : list) {
				u.setViewCnt(dao.myViewcnt(u.getId()));
			}
			
			
			int loggedUser = ((UserDTO) request.getSession().getAttribute(C.PRINCIPAL)).getId();
		
			if(loggedUser != id) {
				response.sendRedirect(request.getContextPath() + "/user/rejectAuth");
				return;
			}	
			
			request.setAttribute("list", list);

			sqlSession.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		
	}


}

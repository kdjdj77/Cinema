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
		SqlSession sqlSession = null;
		UserDAO dao = null;
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(UserDAO.class);

			// 읽기
			UserDTO user = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
			
			request.setAttribute("list", user);

			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		
	}


}

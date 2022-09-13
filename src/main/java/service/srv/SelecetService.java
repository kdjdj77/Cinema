package service.srv;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.ServiceDAO;
import domain.ServiceDTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class SelecetService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		// 페이징 관련
	    HttpSession session = request.getSession();
	    Integer page = (Integer)session.getAttribute("page");
	    if(page == null) page = 1;
	    request.setAttribute("page", page);
		
		
		
		SqlSession sqlSession = null;
		ServiceDAO dao = null;	
		
		List<ServiceDTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(ServiceDAO.class);
			
			// 읽기 only
			list = dao.selectById(id);
			
			// 로그인한 사용자가 아니면 여기서 redirect 해야 한다
			UserDTO loggedUser = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
			UserDTO writeUser = list.get(0).getUser();
			if(loggedUser.getId() != writeUser.getId()) {
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

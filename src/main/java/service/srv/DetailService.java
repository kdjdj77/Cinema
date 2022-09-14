package service.srv;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import domain.ServiceDAO;
import domain.ServiceDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class DetailService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		// ※ 이 단계에서 parameter 검증 해야 한다.
		
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
			
			// 조회수 증가 + 글 읽기
			dao.incViewCnt(id);
			list = dao.selectById(id);			
			
			sqlSession.commit();
		} catch (SQLException e) {  
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}		

		request.setAttribute("list", list);
	}


	}



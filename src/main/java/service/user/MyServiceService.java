package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;


import domain.QryMyServiceList;
import domain.ServiceDAO;
import domain.ServiceDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class MyServiceService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
			    
		QryMyServiceList obj = new QryMyServiceList(); // reponse 할 자바 객체
		ObjectMapper mapper = new ObjectMapper(); // Json 으로 매핑할 Mapper 객체

		SqlSession sqlSession = null;
		ServiceDAO sdao = null;
		
		List<ServiceDTO> mslist = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			sdao = sqlSession.getMapper(ServiceDAO.class);
			
			
			mslist = sdao.myService(id);
			obj.setList(mslist);
			obj.setCount(mslist.size());
			obj.setStatus("OK");


			for (ServiceDTO s : mslist){
				s.setCmtCheck(sdao.checkCmt(s.getId()).length);
			}


			sqlSession.commit();
		}catch (SQLException e) {
            e.printStackTrace();
			obj.setStatus("내가 예매한 목록 ERROR: " + e.getMessage());
        } finally {
            if (sqlSession != null) sqlSession.close();
        }

		String output = mapper.registerModule(new JavaTimeModule()).writeValueAsString(obj);
		response.setContentType("application/json; charset=utf-8"); // MIME 설정
		response.getWriter().write(output); // reponse에 보내기
    }
}
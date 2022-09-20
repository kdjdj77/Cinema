package service.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import common.C;
import domain.MovieDAO;
import domain.MovieDTO;
import domain.QryMyReserveList;
import domain.ReservDAO;
import domain.ReservDTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class RecentMyReserveService implements Service{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	UserDTO user = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
		int id = user.getId();
		int page = Integer.parseInt(request.getParameter("page"));
		
        QryMyReserveList obj = new QryMyReserveList();
        ObjectMapper mapper = new ObjectMapper();

        SqlSession sqlSession = null;
        ReservDAO rdao = null;


        List<ReservDTO> mrlist = null;
        
        try{
            sqlSession = SqlSessionManager.getInstance().openSession();
            rdao = sqlSession.getMapper(ReservDAO.class);
            
            mrlist = rdao.recentMyReserve(id, page *3);
            obj.setList(mrlist);
            obj.setCount(mrlist.size());
            obj.setStatus("OK");

            sqlSession.commit();
        }catch (SQLException e) {
            e.printStackTrace();
            obj.setStatus("내가 작성한 글 목록 ERROR: " + e.getMessage());
        } finally {
            if (sqlSession != null) sqlSession.close();
        }

        String output = mapper.registerModule(new JavaTimeModule()).writeValueAsString(obj);
        response.setContentType("application/json; charset=utf-8"); // MIME 설정
        response.getWriter().write(output); // reponse에 보내기
    }
    
}

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
import domain.QryMyReserveDetailList;
import domain.ReservDAO;
import domain.ReservDTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ReserveBySeatService implements Service{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int id = Integer.parseInt(request.getParameter("id"));
    	UserDTO user = (UserDTO)request.getSession().getAttribute(C.PRINCIPAL);
		int uid = user.getId();
		int page = Integer.parseInt(request.getParameter("page"));
		
        QryMyReserveDetailList obj = new QryMyReserveDetailList();
        ObjectMapper mapper = new ObjectMapper();

        SqlSession sqlSession = null;
        ReservDAO rdao = null;


        List<ReservDTO> list = null;
        
        try{
            sqlSession = SqlSessionManager.getInstance().openSession();
            rdao = sqlSession.getMapper(ReservDAO.class);
            
            list = rdao.mypageTicketList(uid, id, page * 5);
            obj.setList(list);
            obj.setCount(list.size());
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

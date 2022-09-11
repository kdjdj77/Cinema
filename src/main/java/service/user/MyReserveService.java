package service.user;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import domain.FileDAO;
import domain.FileDTO;
import domain.MovieDAO;
import domain.MovieDTO;
import domain.ReservDAO;
import domain.ReservDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class MyReserveService implements Service{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        SqlSession sqlSession = null;
		ReservDAO dao = null;
		List<ReservDTO> list = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(ReservDAO.class);
			
			list = dao.mypageTicketList(id);

			request.setAttribute("list", list);
			sqlSession.commit();
		} catch (SQLException e) {  
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}

	}

}
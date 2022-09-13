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

import common.C;
import domain.FileDAO;
import domain.FileDTO;
import domain.MovieDAO;
import domain.MovieDTO;
import domain.ReservDAO;
import domain.ReservDTO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class MyReserveService implements Service{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
		/*
		 * int page = 1; String pageParam = request.getParameter("page"); if(pageParam
		 * != null && !pageParam.trim().equals("")) { try { page =
		 * Integer.parseInt(pageParam); } catch(NumberFormatException e) { // page
		 * parameter 오류는 별도의 예외 처리 안함. } } // end if
		 * 
		 * // 페이징 // writePages: 한 [페이징] 당 몇개의 페이지가 표시되나 // pageRows: 한 '페이지'에 몇개의 글을
		 * 리스트 할것인가? HttpSession session = request.getSession(); Integer myReservePages
		 * = (Integer)session.getAttribute("myReservePages"); if(myReservePages == null)
		 * myReservePages = C.MY_PAGES; // session 에 없으면 기본값으로 Integer pageRows = 10;
		 * 
		 * int cnt = 0; // 글 목록 전체의 개수 int totalPage = 0; // 총 몇 '페이지' 분량인가?
		 */
        SqlSession sqlSession = null;
		ReservDAO dao = null;
		List<ReservDTO> list = null;
		
		int startPage = 1;
		int endPage = 10;
		
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(ReservDAO.class);
			/*
			 * cnt = dao.countAll(id); totalPage = (int)Math.ceil(cnt / (double)pageRows);
			 */
			
			/*
			 * // 로그인한 사용자가 아니면 여기서 redirect 해야 한다 UserDTO loggedUser =
			 * (UserDTO)request.getSession().getAttribute(C.PRINCIPAL); // 현재로그인한 사용자 정보가
			 * 담겨있따 List<ReservDTO> list1 = dao.mypageTicketList(id); UserDTO reserveUser =
			 * list1.get(0).getUser(); // 읽어온 글의 작성자 if(loggedUser.getId() !=
			 * reserveUser.getId()) { response.sendRedirect(request.getContextPath() +
			 * "/user/rejectAuth"); return; }
			 */
						
			/*
			 * if(page<1)page =1; if(page>totalPage) page = totalPage;
			 * 
			 * int fromRow = (page -1) * pageRows;
			 */
			list = dao.mypageTicketList(id);
			/*
			 * list = dao.selectFromRow(id, fromRow, pageRows);
			 * 
			 * // [페이징] 에 표시할 '시작페이지' 와 '마지막페이지' 계산 startPage = ((int)((page - 1) /
			 * myReservePages) * myReservePages) + 1; endPage = startPage + myReservePages -
			 * 1; if (endPage >= totalPage) endPage = totalPage;
			 */

			request.setAttribute("list", list);
			sqlSession.commit();
		} catch (SQLException e) {  
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		
		/*
		 * request.setAttribute("list", list);
		 * 
		 * request.setAttribute("cnt", cnt); // 전체 글 개수
		 * request.setAttribute("myReservePages", myReservePages); // [페이징] 에 표시할 숫자 개수
		 * request.setAttribute("pageRows", pageRows); // 한 '페이지' 에 표시할 글 개수
		 * session.setAttribute("page", page); // 현재 페이지 (세션에 저장해두자)
		 * request.setAttribute("startPage", startPage); // [페이징] 에 표시할 시작 페이지
		 * request.setAttribute("endPage", endPage); // [페이징] 에 표시할 마지막 페이지
		 * request.setAttribute("totalPage", totalPage); // 총 페이지 개수
		 * request.setAttribute("url", request.getRequestURI()); // 목록 url
		 */
	}

}
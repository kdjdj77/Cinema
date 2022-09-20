package service.srv;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.ServiceDAO;
import domain.ServiceDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class ListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String search = "";
		
		if(request.getParameter("search") != null) {
		search = request.getParameter("search");
		}
		
		// 파라미터 받기 (현재 page)
		int page = 1;   // 디폴트 페이지 1
		String pageParam = request.getParameter("page");
		if(pageParam != null && !pageParam.trim().equals("")) {
			try {				
				page = Integer.parseInt(pageParam);
			} catch(NumberFormatException e) {
				// page parameter 오류는 별도의 예외 처리 안함.
			}
		} // end if
		
	    // 페이징
	    // writePages: 한 [페이징] 당 몇개의 페이지가 표시되나
	    // pageRows: 한 '페이지'에 몇개의 글을 리스트 할것인가?
	    HttpSession session = request.getSession();
	    Integer writePages = (Integer)session.getAttribute("writePages");	// writePages 라는 이름으로 꺼내오겠다
	    if(writePages == null) writePages = C.WRITE_PAGES;   // session 에 없으면 기본값으로 (기본값 = 10)
	    Integer pageRows = (Integer)session.getAttribute("pageRows");
	    if(pageRows == null) pageRows = C.PAGE_ROWS;     // session 에 없으면 기본값으로 (기본값 = 10)
	    
	    int cnt = 0;  // 글 목록 전체의 개수
	    int totalPage = 0;  // 총 몇 '페이지' 분량인가?
		
		
		SqlSession sqlSession = null;
		ServiceDAO dao = null;

		
		List<ServiceDTO> list = null;
		HashMap<String, Object> hmap = new HashMap<>();
		
		
		int startPage = 1;
		int endPage = 10;
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			dao = sqlSession.getMapper(ServiceDAO.class);
			
			cnt = dao.countAll();  // 글 목록 전체 개수
			totalPage = (int)Math.ceil(cnt / (double)pageRows);   // 총 몇 페이지 분량?
			
			// 현재 페이지 값 보정 (범위를 벗어난 경우)
			if(page < 1) page = 1;
			if(page > totalPage) page = totalPage;
			
			// 페이지 글 목록 가져오기
			int fromRow = (page - 1) * pageRows;
			
			hmap.put("from", fromRow);
			hmap.put("row", pageRows);
			hmap.put("search", search);
			System.out.println(hmap);
			list = dao.selectFromRow(hmap);
			
			
			
			
			// [페이징] 에 표시할 '시작페이지' 와 '마지막페이지' 계산
	        startPage = ((int)((page - 1) / writePages) * writePages) + 1;
	        endPage = startPage + writePages - 1;
	        if (endPage >= totalPage) endPage = totalPage;     
			
	        for(ServiceDTO s : list) s.setCmtCheck(dao.checkCmt(s.getId()).length);
	        
			sqlSession.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null)
				sqlSession.close();
		}
		
		// "list" 란 name 으로 request 에 list 저장
		// 즉, request 에 담아서 컨트롤러에 전달되는 셈.
		request.setAttribute("list", list);
		
        request.setAttribute("cnt", cnt);  // 전체 글 개수
        request.setAttribute("writePages", writePages); // [페이징] 에 표시할 숫자 개수
        request.setAttribute("pageRows", pageRows);  // 한 '페이지' 에 표시할 글 개수
        session.setAttribute("page", page);  // 현재 페이지 (세션에 저장해두자)
        request.setAttribute("startPage", startPage);  // [페이징] 에 표시할 시작 페이지
        request.setAttribute("endPage", endPage);   // [페이징] 에 표시할 마지막 페이지
        request.setAttribute("totalPage", totalPage); // 총 페이지 개수
        request.setAttribute("url", request.getRequestURI());  // 목록 url


	} // end execute()

}

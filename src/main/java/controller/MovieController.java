package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.C;
import service.Service;
import service.movie.DetailService;
import service.movie.ListService;
import service.movie.ReservOKService;
import service.movie.ReservService;

@WebServlet("/movie/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MovieController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 인코딩
		action(request, response);
	}
	protected void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n>> " + getClass().getName() + ".action() 호출");
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		// request method
		String method = request.getMethod();   // GET, POST, PUT, PATCH, DELETE ...

		// 매 request 마다 출력 (테스트)
		System.out.println("request: " + uri + " (" + method + ")");  
		System.out.println("conPath: " + conPath);  
		System.out.println("command: " + command);
		
		
		// 컨트롤러는 
		// 1. 커맨드에 따라, 해당 Service 로직을 수행을 하고
		// 2. 결과를 내보낼 view를 결정한다
		Service service = null;	// 어떠한 Service 로직을 수행할지
		String viewPage = null; // 어떠한 페이지(view)를 보여줄지
		
		switch(command) {
			case "/movie/home":
				service = new ListService();
				service.execute(request, response);
				viewPage = "home.jsp";
				break;
			case "/movie/detail": // 로그인한 사람만 접근 가능
				service = new DetailService();
				service.execute(request, response);
				viewPage = "detail.jsp";
				break;
			case "/movie/reserv":
				if(C.securityCheck(request, response, new String[] {"ROLE_MEMBER"})) {
					service = new ReservService();
					service.execute(request, response);
					viewPage = "reserv.jsp";
				}
				break;
			case "/movie/reservOK":
				if(C.securityCheck(request, response, new String[] {"ROLE_MEMBER"})) {
					service = new ReservOKService();
					service.execute(request, response);
					viewPage = "reservOK.jsp";
				}
				break;
				
			
		}
		//위에서 결정된 뷰 페이지(viewPage)로 forward 해줌
		if (viewPage != null) {
			RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/WEB-INF/views/movie/" + viewPage);
			dispatcher.forward(request, response);
		}
	}
}

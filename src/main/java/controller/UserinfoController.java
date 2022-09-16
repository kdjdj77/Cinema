package controller;

import java.io.IOException;
import java.net.URI;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.C;
import service.Service;
import service.user.UserDetailService;
import service.user.UserInfoService;
import service.user.totalSeatService;
import service.user.ReserveDetailService;
import service.user.ModifyService;
import service.user.MyReserveService;
import service.user.ReserveDeleteService;

@WebServlet("/userinfo/*")
public class UserinfoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserinfoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        action(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        action(request, response);
    }

    protected void action(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("\n>> " + getClass().getName() + ".action() 호출");

        // URL로부터 URI, ContextPath, Command 분리
        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String command = uri.substring(conPath.length());

        // request method
        String method = request.getMethod(); // GET, POST, PUT, PATCH, DELETE ...

        // 매 request 마다 출력 (테스트)
        System.out.println("request: " + uri + " (" + method + ")");
        System.out.println("conPath: " + conPath);
        System.out.println("command: " + command);

        // 컨트롤러는
        // 1. 커맨드에 따라, 해당 Service 로직을 수행을 하고
        // 2. 결과를 내보낼 view를 결정한다
        Service service = null; // 어떠한 Service 로직을 수행할지
        String viewPage = null; // 어떠한 페이지(view)를 보여줄지

        switch (command) {
            case "/userinfo/main":
                if (C.securityCheck(request, response, new String[]{"ROLE_MEMBER"})) {

                    service = new UserInfoService();
                    service.execute(request, response);
                    viewPage = "userinfo.jsp";
                    break;
                }
                break;

            case "/userinfo/modify":
                if (C.securityCheck(request, response, new String[]{"ROLE_MEMBER"})) {
                    switch (method) {
                        case "GET":
                            service = new UserDetailService();
                            service.execute(request, response);
                            if (!response.isCommitted()) {
                                viewPage = "modify.jsp";
                            }
                            break;
                        case "POST":
                            service = new ModifyService();
                            service.execute(request, response);
                            viewPage = "modifyOk.jsp";
                            break;
                    }
                }
                break;

            case "/userinfo/reserve":
            	if (C.securityCheck(request, response, new String[]{"ROLE_MEMBER"})) {
                service = new totalSeatService();
                service.execute(request, response);
                viewPage = "totalSeatList.jsp";
                break;
            	 }
                break;


            case "/userinfo/dreserve":
            	if (C.securityCheck(request, response, new String[]{"ROLE_MEMBER"})) {
                service = new MyReserveService();
                service.execute(request, response);
                viewPage = "myReserveList.jsp";
                break;
        }
        break;

            case "/userinfo/resdetail":
                if (C.securityCheck(request, response, null)) {
                    service = new ReserveDetailService();
                    service.execute(request, response);
                    viewPage = "myReserveDetail.jsp";
                }
                break;

            case "/userinfo/delete":
                if (C.securityCheck(request, response, new String[]{"ROLE_MEMBER"})) { // 권한 체크
                    switch (method) {
                        case "POST":
                            service = new ReserveDeleteService(); // 작성자가 아닌 경우 Service 안에서 redirect 발생
                            service.execute(request, response);
                            if (!response.isCommitted()) {
                                viewPage = "reserveDeleteOK.jsp";
                            }
                            break;
                    }
                }
                break;

            /*
             * // 페이징 // pageRows 변경시 동작 case "/userinfo/pageRows": int page =
             * Integer.parseInt(request.getParameter("page")); Integer pageRows = 10;
             * request.getSession().setAttribute("pageRows", pageRows);
             * response.sendRedirect(request.getContextPath() + "/list?page=" + page);
             * break;
             */
        } // end switch

        // 위에서 결정된 뷰로 forward 함
        if (viewPage != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/" + viewPage);
            dispatcher.forward(request, response);
        }
    }
}
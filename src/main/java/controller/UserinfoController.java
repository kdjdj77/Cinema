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
import service.user.UserDetailService;
import service.user.UpdateService;


@WebServlet("/userinfo/*")
public class UserinfoController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserinfoController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
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
        Service service = null;    // 어떠한 Service 로직을 수행할지
        String viewPage = null; // 어떠한 페이지(view)를 보여줄지

        switch (command) {
            case "/userinfo/main":
                viewPage = "userinfo.jsp";
                break;

            case "/userinfo/modi":
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
                            service = new UpdateService();
                            service.execute(request, response);
                            if(!response.isCommitted())
                                viewPage = "modifyOK.jsp";
                            break;
                    }
                }
                break;


        }
        // 위에서 결정된 뷰로 forward 함
        if (viewPage != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/user/" + viewPage);
            dispatcher.forward(request, response);
        }
    }
}
package service.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import common.C;
import domain.UserDAO;
import domain.UserDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class UpdateService implements Service {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        // 입력한 값 (parameter) 받아오기
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");

        password = password.trim();
        re_password = re_password.trim();

        String conPath = request.getContextPath();
        // ※ 이 단계에서 parameter 검증 해야 한다.

        // password와 re-password는 같아야 한다
        if (!password.equals(re_password)) {
            // redirect 에 전달할 값들
            C.addRedirectAttribute(request, "error", "비밀번호와 비밀번호확인 입력값은 같아야 합니다");

            response.sendRedirect(conPath + "/main");
            return;
        }

        SqlSession sqlSession = null;
        UserDAO dao = null;

        int cnt = 0;
        UserDTO dto = UserDTO.builder()
                .id(id)
                .password(password)
                .build();

        try {
            sqlSession = SqlSessionManager.getInstance().openSession();
            dao = sqlSession.getMapper(UserDAO.class);

            // update
            cnt = dao.update(dto);

            sqlSession.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) sqlSession.close();
        }
        request.setAttribute("result", cnt);
        request.setAttribute("dto", dto);
        // ↑ auto-generated key(id)도 담겨 있음


    }

}
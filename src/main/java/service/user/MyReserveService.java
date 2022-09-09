package service.user;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.ibatis.session.SqlSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import domain.FileDAO;
import domain.FileDTO;
import domain.MovieDAO;
import domain.MovieDTO;
import domain.QryMyReserveList;
import domain.ReservDAO;
import domain.ReservDTO;
import service.Service;
import sqlmapper.SqlSessionManager;

public class MyReserveService implements Service{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int mid = Integer.parseInt(request.getParameter("movie_id"));

        SqlSession sqlSession = null;
		MovieDAO mdao = null;
		ReservDAO rdao = null;
		List<MovieDTO> movielist = null;
		List<ReservDTO> reservelist = null;
		FileDAO fileDao = null;
		
		try {
			sqlSession = SqlSessionManager.getInstance().openSession();
			mdao = sqlSession.getMapper(MovieDAO.class);
			rdao = sqlSession.getMapper(ReservDAO.class);
			fileDao = sqlSession.getMapper(FileDAO.class);
			
			movielist = mdao.select();			
			for(MovieDTO m : movielist) {
				//평균 평점 설정
				m.setStar(
					getMean(mdao.selectStars(m.getId()))
				);
				
				//특정 글 1개(id)에 대한 첨부파일 목록 가져오기
				List<FileDTO> fileList = fileDao.selectByMovieId(mid);
				reservelist = rdao.myReserve(id);
				
				//이미지 파일 여부 세팅
				String realPath = request.getServletContext().getRealPath("upload");
				
				for(FileDTO fileDto : fileList) {
					//첨부파일에 대한 File 객체
					File f = new File(realPath, fileDto.getFile());
					BufferedImage imgData = null;
					
					try {
						imgData = ImageIO.read(f);
                        // 파일이 존재 하지 않으면 IOExcepion
                        // 이미지가 아닌 경우는 return null
					} catch (IOException e) {
						System.out.println("이미지 없음: " + f.getAbsolutePath() + " [" + e.getMessage() + "]");
					}
					
					if (imgData != null) {
						fileDto.setImage(true);
						m.setFileName(fileDto.getFile());
					} //이미지 여부 true
				}
			}

			sqlSession.commit();
		} catch (SQLException e) {  
			e.printStackTrace();
		} finally {
			if(sqlSession!= null) sqlSession.close();
		}
		request.setAttribute("movielist", movielist);
		request.setAttribute("reservelist", reservelist);
	}
	public float getMean(int[] list) {
		int sum = 0;
		int len = list.length;
		
		for (int i : list) sum += i;
		
		return (int)(((float)sum / len) * 10) / (float)10;
	}
}
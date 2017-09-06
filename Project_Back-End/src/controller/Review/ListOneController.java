package controller.Review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.review.ReviewDAO;
import model.review.ReviewDTO;

public class ListOneController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//3]요청분석
		String no = req.getParameter("no");
		String review_no = req.getParameter("review_no");
		
		//4]모델 호출 및 결과값 받기
		ReviewDAO dao = new ReviewDAO(req.getServletContext());
		ReviewDTO dto = dao.selectOne(no);
		//줄바꿈 처리
		dto.setList_content(dto.getList_content().replace("\r\n", "<br/>"));
		
		dao.close();
		
		//5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		//6]뷰 선택후 포워딩
		req.getRequestDispatcher("/admin/bootstrap/datasearch/ReviewofnowweekOk.jsp").forward(req, resp);
		
	}//service
	
	
	
}

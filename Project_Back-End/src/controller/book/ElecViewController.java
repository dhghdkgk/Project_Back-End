package controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.book.BookDAO;
import model.book.BookDTO;

public class ElecViewController extends HttpServlet {
	
	//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 3]요청분석
		String no = req.getParameter("no");

		// 4]모델 호출 및 결과값 받기
		BookDAO dao = new BookDAO(req.getServletContext());
		BookDTO dto = dao.selectOne(no);
		// 줄바꿈 처리

		dao.close();

		// 5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		// 6]뷰 선택후 포워딩
		req.getRequestDispatcher("/admin/bootstrap/datasearch/ElectronicLibView.jsp").forward(req, resp);
	}

	

}

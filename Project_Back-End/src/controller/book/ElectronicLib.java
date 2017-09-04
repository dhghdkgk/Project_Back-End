package controller.book;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.book.BookDAO;
import model.book.BookDTO;

public class ElectronicLib extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BookDAO dao = new BookDAO(req.getServletContext());
		BookDTO dto = new BookDTO();
		String mode = req.getParameter("mode");
		
		if(req.getMethod().equalsIgnoreCase("POST")) {
			if(mode.equalsIgnoreCase("insert")) {
				dto.setBook_title(req.getParameter("title"));
				dto.setBook_writer(req.getParameter("write"));
				dto.setBook_shape(req.getParameter("shape"));
				dto.setBook_trans(req.getParameter("trans"));
				dto.setBook_isbn(req.getParameter("isbn"));
				dto.setBook_pubplace(req.getParameter("pubplace"));
				dto.setBook_pubdate(req.getParameter("pubdate"));
				dto.setBook_type(req.getParameter("type"));
				dto.setBook_mark(req.getParameter("mark"));
				dto.setBook_pubmatter(req.getParameter("pubmatter"));
				dto.setBook_abstract(req.getParameter("abstract"));
				dao.insert(dto);
			}
		}
		super.service(req, resp);
	}
	
}

package controller.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.FileUtils;
import model.PagingUtil;
import model.book.BookDAO;
import model.book.BookDTO;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;

public class ElecEditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mode = req.getParameter("mode");
		if (req.getMethod().equalsIgnoreCase("POST")) {

			req.setCharacterEncoding("UTF-8");

			int no = 0;
			String title;
			String writer;
			String shape;
			String trans;
			String isbn;
			String pubplace;
			String pubdate;
			String type;
			String mark;
			String pubmatter;
			String book_abstract;
			String book_img;
			
			MultipartRequest mr = FileUtils.upload(req, req.getServletContext().getRealPath("/Upload/Book"));

			int sucorfail;// DB입력 성공시에는 1, 실패시0, 파일용량 초과시에는 -1

			if (mr != null) {// 파일 업로드 성공시 데이터 입력처리
				// 기타 파라미터 받아서 테이블에 입력처리

				BookDAO dao = new BookDAO(req.getServletContext());
				BookDTO dto = new BookDTO();
				no = Integer.parseInt(mr.getParameter("no"));
				title = mr.getParameter("title");
				writer = mr.getParameter("writer");
				shape = mr.getParameter("shape");
				trans = mr.getParameter("trans");
				isbn = mr.getParameter("isbn");
				pubplace = mr.getParameter("pubplace");
				pubdate = mr.getParameter("pubdate");
				type = mr.getParameter("type");
				mark = mr.getParameter("mark");
				pubmatter = mr.getParameter("pubmatter");
				book_abstract = mr.getParameter("abstract");
				book_img = mr.getFilesystemName("book_img");
				
				if(book_img == null){//파일 미교체
					book_img = mr.getParameter("book_orgimg");
				}//if

				// 데이터베이스 CRUD작업과 관련된 모델 호출
				dto.setBook_no(no);
				dto.setBook_title(title);
				dto.setBook_writer(writer);
				dto.setBook_shape(shape);
				dto.setBook_trans(trans);
				dto.setBook_isbn(isbn);
				dto.setBook_pubplace(pubplace);
				dto.setBook_pubdate(pubdate);
				dto.setBook_type(type);
				dto.setBook_mark(mark);
				dto.setBook_pubmatter(pubmatter);
				dto.setBook_abstract(book_abstract);
				dto.setBook_img(book_img);

				req.setAttribute("dto", dto);
				sucorfail = dao.update(dto);
				dao.close();
			} // if
			else {
				sucorfail = -1;
			} // else

			// 5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			// 5-1]DB입력 성공 여부 및 파일용량 초과 판단용 속성 저장
			req.setAttribute("SUC_FAIL", sucorfail);

			// 5-2]컨트롤러 구분용-입력:INS, 수정:EDT, 삭제:DEL
			req.setAttribute("WHERE", "EDT");

			if (sucorfail == 1) {// 입력성공
				// ※입력후 바로 목록으로 이동]-반드시 List.jsp가 아닌 List.do로 이동
				//req.getRequestDispatcher("/DATAROOM/List.do").forward(req, resp);
				req.getRequestDispatcher("/ElectronicLib/View.do?no="+no).forward(req, resp);
			} // if
			else {// 입력실패 혹은 파일용량 초과
				req.setAttribute("errorMessage", sucorfail == 0 ? "입력 실패" : "파일용량 초과");

				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('" + (sucorfail == 0 ? "입력실패" : "파일용량초과") + "')");
				out.println("history.back();");
				out.println("</script>");

			} // else

			// 메시지를 자스로 뿌려주는 페이지로 포워딩
			// req.getRequestDispatcher("/DATAROOM_13/Message.jsp").forward(req, resp);
			//req.getRequestDispatcher("/DATAROOM_13/Message.jsp").forward(req, resp);
		} else {
			// 3]요청분석
			String no = req.getParameter("no");

			// 4]모델 호출 및 결과값 받기
			BookDAO dao = new BookDAO(req.getServletContext());
			BookDTO dto = dao.selectOne(no);
			// 줄바꿈 처리

			dao.close();

			// 5]필요한 값 리퀘스트 영역에 저장
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/admin/bootstrap/datasearch/ElectronicLibEdit.jsp").forward(req, resp);
		}
	}
}

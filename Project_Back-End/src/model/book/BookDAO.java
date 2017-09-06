package model.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class BookDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public BookDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/team/back");
			conn = source.getConnection();
		}//try
		catch (NamingException e) {e.printStackTrace();}//catch
		catch (SQLException e) {e.printStackTrace();}//catch
	}///////////////////////
		// 자원반납용]

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}///////////////// close()

	/*
	 * public List<AnswerDTO> selectList() {
	 * 
	 * List<AnswerDTO> records = new Vector<AnswerDTO>();
	 * 
	 * String sql =
	 * "SELECT A.*,D.DEPT_NAME FROM ANSWER_TABLE A JOIN DEPT_TABLE D ON A.DEPT_NO = D.DEPT_NO ORDER BY ANSWER_NO DESC"
	 * ;
	 * 
	 * try { psmt = conn.prepareStatement(sql);
	 * 
	 * // 페이징을 위한 시작 및 종료 rownum설정] rs = psmt.executeQuery(); while (rs.next()) {
	 * AnswerDTO dto = new AnswerDTO(rs.getInt(1), rs.getInt(2), rs.getString(3),
	 * rs.getInt(4), rs.getDate(5));
	 * 
	 * records.add(dto); } } catch (SQLException e) { e.printStackTrace(); } return
	 * records; }///////////////// selectList
	 */

	public int insert(BookDTO dto) {
		int affected = 0;
		String sql = "INSERT INTO BOOK_TABLE VALUES (SEQ_INCNUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getBook_title());
			psmt.setString(2, dto.getBook_writer());
			psmt.setString(3, dto.getBook_shape());
			psmt.setString(4, dto.getBook_trans());
			psmt.setString(5, dto.getBook_isbn());
			psmt.setString(6, dto.getBook_pubplace());
			psmt.setString(7, dto.getBook_pubdate());
			psmt.setString(8, dto.getBook_type());
			psmt.setString(9, dto.getBook_mark());
			psmt.setString(10, dto.getBook_pubmatter());
			psmt.setString(11, dto.getBook_abstract());
			psmt.setString(12, dto.getBook_img());

			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}///////////// insert
	
	public List selectList(int start, int end) {
		List list = new Vector();
		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM(SELECT * FROM BOOK_TABLE ORDER BY BOOK_NO DESC) T) WHERE R BETWEEN ? AND ?";
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			while(rs.next()){
				BookDTO dto = new BookDTO();
				dto.setBook_no(rs.getInt(1));
				dto.setBook_title(rs.getString(2));
				dto.setBook_writer(rs.getString(3));
				dto.setBook_shape(rs.getString(4));
				dto.setBook_trans(rs.getString(5));
				dto.setBook_isbn(rs.getString(6));
				dto.setBook_pubplace(rs.getString(7));
				dto.setBook_pubdate(rs.getString(8));
				dto.setBook_type(rs.getString(9));
				dto.setBook_mark(rs.getString(10));
				dto.setBook_pubmatter(rs.getString(11));
				dto.setBook_abstract(rs.getString(12));
				dto.setBook_img(rs.getString(13));
				dto.setBook_regidate(rs.getDate(14).toString());
				list.add(dto);
			}//while
		}//try
		catch(SQLException e){e.printStackTrace();}//catch
		
		return list;
	}//selectList

	// 총 레코드 수 얻기용
	public int getTotalRecordCount() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM BOOK_TABLE";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			total = rs.getInt(1);

		} // try
		catch (Exception e) {
			e.printStackTrace();
		}
		;// catch
		return total;
	}// getTotalRecordCount//상세보기용
	
	public BookDTO selectOne(String no) {
		BookDTO dto = null;
		String sql = "SELECT * FROM BOOK_TABLE WHERE BOOK_NO=?";
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new BookDTO();
				dto.setBook_no(rs.getInt(1));
				dto.setBook_title(rs.getString(2));
				dto.setBook_writer(rs.getString(3));
				dto.setBook_shape(rs.getString(4));
				dto.setBook_trans(rs.getString(5));
				dto.setBook_isbn(rs.getString(6));
				dto.setBook_pubplace(rs.getString(7));
				dto.setBook_pubdate(rs.getString(8));
				dto.setBook_type(rs.getString(9));
				dto.setBook_mark(rs.getString(10));
				dto.setBook_pubmatter(rs.getString(11));
				dto.setBook_abstract(rs.getString(12));
				dto.setBook_img(rs.getString(13));
				dto.setBook_regidate(rs.getDate(14).toString());
			}//if
		}//try
		catch(Exception e){ e.printStackTrace(); }//catch
		
		return dto;
	}//selectOne

}

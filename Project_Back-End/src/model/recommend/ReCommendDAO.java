package model.recommend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;



public class ReCommendDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public ReCommendDAO(ServletContext context) {
		try {

			// 드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			// 데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"), "TEAM ", "2030");
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		// 회원여부 판단용]
/*public List<BookDTO> selectList(){
		
		List<BookDTO> records = new Vector<BookDTO>();
		
		//페이징 미 적용
		//String sql="SELECT B.*,M.NAME FROM BBS B JOIN MEMBER M ON B.ID=M.ID ORDER BY NO DESC";
		String sql="SELECT * FROM BOOK_TABLE ORDER BY BOOK_NO DESC";
		//페이징 적용-구간쿼리로 변경
		
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]			
			rs = psmt.executeQuery();
			while(rs.next()){
				BookDTO dto = new BookDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDate(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getDate(14));
						records.add(dto);
			
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		return records;
	}/////////////////selectList
*/	
	
	
	
	public List<model.book.BookDTO> selectList(Map<String, Object> map) {

		List<model.book.BookDTO> records = new Vector<model.book.BookDTO>();

		// 페이징 미 적용

		/*String sql = "SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT * FROM BOOK_TABLE) ";
		// 검색용 쿼리 추가
		if (map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		sql += " ORDER BY BOOK_NO DESC) T) " + "WHERE R BETWEEN ? AND ?";*/
		String sql="SELECT * FROM BOOK_TABLE ORDER BY BOOK_NO DESC";
		try {
			psmt = conn.prepareStatement(sql);

			// 페이징을 위한 시작 및 종료 rownum설정]
		/*	psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));*/

			rs = psmt.executeQuery();
			while (rs.next()) {
				model.book.BookDTO dto = new model.book.BookDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
				
				records.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;
	}///////////////// selectList

	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM OTHERBOOK_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID=M.MEMBER_ID ";
		// 검색용 쿼리 추가
		if (map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}/////////////// getTotalRecordCount
	public int delete(String no) {
		int affected = 0;
		String sql = "DELETE OTHERBOOK_TABLE WHERE OTHER_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}///////////// delete
	
}

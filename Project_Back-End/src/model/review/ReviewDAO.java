package model.review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import model.outer.OuterDto;

public class ReviewDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public ReviewDAO(ServletContext context) {
		try {

			// 드라이버 로딩]
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			// 데이타베이스 연결]
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"), "TEAM", "2030");
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
	
	//전체 목록 가져오기]
	public List<ReviewDTO> selectList(int start, int end){
		List<ReviewDTO> records = new Vector<ReviewDTO>();
		
		//페이징 미 적용
		String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT R.REVIEW_NO,B.BOOK_TITLE,B.BOOK_TYPE,B.BOOK_PUBPLACE,B.BOOK_PUBDATE,B.BOOK_PUBMATTER,B.BOOK_MARK,B.BOOK_NAME,L.LIST_CONTENT,R.REVIEW_REVIEWER FROM REVIEW_TABLE R JOIN BOOK_TABLE B ON R.BOOK_NO = B.BOOK_NO JOIN LIST_TABLE L ON L.BOOK_NO = B.BOOK_NO";
		
		//페이징 적용-구간쿼리로 변경
		//String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT B.*,M.NAME FROM BBS B JOIN MEMBER M ON B.ID=M.ID ";
		//검색용 쿼리 추가
		/*if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}*/		
		sql+=" ORDER BY R.REVIEW_NO DESC) T) WHERE R BETWEEN ? AND ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			
			rs = psmt.executeQuery();
			while(rs.next()){
				ReviewDTO dto = new ReviewDTO(
						rs.getInt(1),
						0,
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						null,
						rs.getString(9),
						null,
						rs.getString(10),
						null
						);
				
				records.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		return records;
	}/////////////////selectList
	
	public int getTotalRecordCount() {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM REVIEW_TABLE R JOIN BOOK_TABLE B ON R.BOOK_NO = B.BOOK_NO JOIN LIST_TABLE L ON L.BOOK_NO = B.BOOK_NO";
		// 검색용 쿼리 추가
		/*if (map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}*/

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
	
	
	public ReviewDTO selectOne(String no) {
		ReviewDTO dto = null;
		String sql = "SELECT R.REVIEW_REVIEW,R.REVIEW_REVIEWER,B.BOOK_PUBMATTER,B.BOOK_MARK,B.BOOK_NAME,B.BOOK_WRITER,R.REVIEW_PDF,L.LIST_CONTENT,R.REVIEW_NO FROM BOOK_TABLE B JOIN REVIEW_TABLE R ON B.BOOK_NO = R.BOOK_NO JOIN LIST_TABLE L ON R.BOOK_NO = L.BOOK_NO WHERE R.REVIEW_NO = ?";
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new ReviewDTO();
				dto.setReview_review(rs.getString(1));
				dto.setReview_reviewer(rs.getString(2));
				dto.setBook_pubmatter(rs.getString(3));
				dto.setBook_mark(rs.getString(4));
				dto.setBook_name(rs.getString(5));
				dto.setBook_writer(rs.getString(6));
				dto.setReview_pdf(rs.getString(7));
				dto.setList_content(rs.getString(8));
				dto.setReview_no(rs.getInt(9));
				
			}//if
		}//try
		catch(Exception e){ e.printStackTrace(); }//catch
		
		return dto;
	}//selectOne
	
	
	public int update(ReviewDTO dto){
		int affected =0;
		String sql="UPDATE REVIEW_TABLE SET BOOK_NO = ?, REVIEW_REVIEW = ?, REVIEW_REVIEWER = ?,REVIEW_PDF = ? WHERE REVIEW_NO = ?";
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBook_no());
			psmt.setString(2, dto.getReview_review());
			psmt.setString(3, dto.getReview_reviewer());
			psmt.setString(4, dto.getReview_pdf());
			psmt.setInt(5, dto.getReview_no());
			
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}	
	
		return affected;
	}/////////////update
	
	
}



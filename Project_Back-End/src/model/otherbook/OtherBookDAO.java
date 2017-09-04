package model.otherbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class OtherBookDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public OtherBookDAO(ServletContext context) {
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
	public List<OtherBookDTO> selectList(Map<String, Object> map) {

		List<OtherBookDTO> records = new Vector<OtherBookDTO>();

		// 페이징 미 적용

		String sql = "SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT O.*,M.MEMBER_NAME FROM OTHERBOOK_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID=M.MEMBER_ID ";
		// 검색용 쿼리 추가
		if (map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		sql += " ORDER BY OTHER_NO DESC) T) " + "WHERE R BETWEEN ? AND ?";

		try {
			psmt = conn.prepareStatement(sql);

			// 페이징을 위한 시작 및 종료 rownum설정]
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));

			rs = psmt.executeQuery();
			while (rs.next()) {
				OtherBookDTO dto = new OtherBookDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
						,rs.getString(6),rs.getString(7),rs.getString(8),rs.getInt(9),rs.getString(10),rs.getDate(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getDate(15));

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
	public OtherBookDTO selectOne(String no) {
		OtherBookDTO dto = null;
		String sql = "SELECT O.*,M.MEMBER_NAME FROM OTHERBOOK_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID=M.MEMBER_ID WHERE OTHER_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				
				dto = new OtherBookDTO();
				dto.setOther_no(rs.getInt(1));
				dto.setBook_isbn(rs.getString(2));
				dto.setMember_id(rs.getString(3));
				dto.setOther_title(rs.getString(4));
				dto.setOther_writer(rs.getString(5));
				dto.setOther_group(rs.getString(6));
				dto.setOther_issue(rs.getString(7));
				dto.setOther_data(rs.getString(8));
				dto.setOther_price(rs.getInt(9));
				dto.setOther_status(rs.getString(10));
				dto.setOther_year(rs.getDate(11));
				dto.setOther_requester(rs.getString(12));
				dto.setOther_email(rs.getString(13));
				dto.setOther_tel(rs.getString(14));
				dto.setOther_regidate(rs.getDate(15));


			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return dto;
	}////////////////// selectOne
	public int update(OtherBookDTO dto){
		int affected =0;
		String sql="UPDATE OTHERBOOK_TABLE SET OTHER_REQUESTER=?,OTHER_EMAIL=?,OTHER_TEL=?,OTHER_DATA=?,OTHER_WRITER=?,OTHER_ISSUE=?,OTHER_ISBN=? WHERE OTHER_NO=?";
	
		try {
			psmt = conn.prepareStatement(sql);		
			psmt.setString(1, dto.getOther_requester());
			psmt.setString(2, dto.getOther_email());
			psmt.setString(3, dto.getOther_tel());
			psmt.setString(4, dto.getOther_data());		
			psmt.setString(5, dto.getOther_writer());
			psmt.setString(6, dto.getOther_issue());		
			psmt.setString(7, dto.getBook_isbn());
			psmt.setInt(8, dto.getOther_no());
			
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}	
	
		return affected;
	}/////////////update
	public Map<String, OtherBookDTO> prevNnext(String no) {
		Map<String, OtherBookDTO> map = new HashMap<String, OtherBookDTO>();

		String sql = "SELECT OTHER_NO,OTHER_TITLE FROM OTHERBOOK_TABLE WHERE OTHER_NO=(SELECT MIN(OTHER_NO) FROM OTHERBOOK_TABLE WHERE OTHER_NO > ?)";
		try {
			// 이전글 구하기]
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {// 이전글 존재
				map.put("PREV", new OtherBookDTO(rs.getInt(1),null,null, rs.getString(2),null, null,null,null, 0, null,null, null,null,null,null));

			}
			// 다음글 구하기
			sql = "SELECT  OTHER_NO,OTHER_TITLE FROM OTHERBOOK_TABLE WHERE OTHER_NO=(SELECT MAX(OTHER_NO) FROM OTHER_TABLE WHERE OTHER_NO < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {// 다음글 존재
				map.put("NEXT", new OtherBookDTO(rs.getInt(1),null,null, rs.getString(2),null, null,null,null, 0, null,null, null,null,null,null));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return map;
	}//////////////// prevNnext
}

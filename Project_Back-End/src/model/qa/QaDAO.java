package model.qa;

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

public class QaDAO {

	// 멤버변수]
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public QaDAO(ServletContext context) {
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

	public boolean isMember(String id, String pwd) {
		String sql = "SELECT COUNT(*) FROM MEMBER_TABLE WHERE MEMBER_ID=? AND MEMBER_PASSWORD=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			rs.next();
			if (rs.getInt(1) != 1)
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}/////////////////// isMember

	public List<QaDTO> selectList(Map<String, Object> map) {

		List<QaDTO> records = new Vector<QaDTO>();

		// 페이징 미 적용

		String sql = "SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT Q.*,M.MEMBER_NAME FROM QA_TABLE Q JOIN MEMBER_TABLE M ON Q.MEMBER_ID=M.MEMBER_ID";
		// 검색용 쿼리 추가
		if (map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchColumn") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		sql += " ORDER BY QA_NO DESC) T) " + "WHERE R BETWEEN ? AND ?";

		try {
			psmt = conn.prepareStatement(sql);

			// 페이징을 위한 시작 및 종료 rownum설정]
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));

			rs = psmt.executeQuery();
			while (rs.next()) {
				QaDTO dto = new QaDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getInt(12),rs.getString(13),rs.getString(14),rs.getDate(15));

				records.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return records;
	}///////////////// selectList

	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM QA_TABLE Q JOIN MEMBER_TABLE M ON Q.MEMBER_ID=M.MEMBER_ID ";
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
		String sql = "DELETE QA_TABLE WHERE QA_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}///////////// delete

	public QaDTO selectOne(String no) {
		QaDTO dto = null;
		String sql = "SELECT Q.*,M.MEMBER_NAME FROM QA_TABLE Q JOIN MEMBER_TABLE M ON Q.MEMBER_ID=M.MEMBER_ID WHERE QA_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				
				dto = new QaDTO();
				dto.setQa_no(rs.getInt(1));
				dto.setMember_id(rs.getString(2));
				dto.setQa_division(rs.getString(3));
				dto.setQa_email(rs.getString(4));
				dto.setQa_tel(rs.getString(5));
				dto.setQa_open(rs.getString(6));
				dto.setQa_emailing(rs.getString(7));
				dto.setQa_sms(rs.getString(8));
				dto.setQa_title(rs.getString(9));
				dto.setQa_content(rs.getString(10));
				dto.setQa_file(rs.getString(11));
				dto.setQa_count(rs.getInt(12));
				dto.setQa_process(rs.getString(13));
				dto.setQa_name(rs.getString(14));
				dto.setQa_regidate(rs.getDate(15));
			
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return dto;
	}////////////////// selectOne
		// 조회수 업데이트]

	public void updateVisitCount(String no) {
		String sql = "UPDATE QA_TABLE SET QA_COUNT=QA_COUNT+1 WHERE QA_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//////////////////// updateVisitCount
		// 이전글/다음글 얻기

	public Map<String, QaDTO> prevNnext(String no) {
		Map<String, QaDTO> map = new HashMap<String, QaDTO>();

		String sql = "SELECT QA_NO,QA_TITLE FROM QA_TABLE WHERE QA_NO=(SELECT MIN(QA_NO) FROM QA_TABLE WHERE QA_NO > ?)";
		try {
			// 이전글 구하기]
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {// 이전글 존재
				map.put("PREV", new QaDTO(rs.getInt(1), null,null, null,null, null, null, null,
						rs.getString(2), null, null,0,null, null,null));

			}
			// 다음글 구하기
			sql = "SELECT QA_NO,QA_TITLE FROM QA_TABLE WHERE QA_NO=(SELECT MAX(QA_NO) FROM QA_TABLE WHERE QA_NO < ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {// 다음글 존재
				map.put("NEXT", new QaDTO(rs.getInt(1), null,null, null,null, null, null, null,
						rs.getString(2), null, null, 0,null, null,null));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return map;
	}//////////////// prevNnext
	public int update(QaDTO dto){
		int affected =0;
		String sql="UPDATE QA_TABLE  SET QA_TITLE=?,QA_CONTENT=? WHERE QA_NO=?";
	
		try {
			psmt = conn.prepareStatement(sql);		
			psmt.setString(1, dto.getQa_title());
			psmt.setString(2, dto.getQa_content());
			psmt.setInt(3, dto.getQa_no());
	
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}	
	
		return affected;
	}/////////////update
	
	public int insert(QaDTO dto){
		int affected =0;
	String sql="INSERT INTO QA_TABLE VALUES(SEQ_INCNUM.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,?,?,?,?,DEFAULT,?,SYSDATE)";
	/*	String sql="INSERT INTO QA_TABLE VALUES(SEQ_INCNUM.NEXTVAL,?,?,?,?,?,";*/
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMember_id());
			psmt.setString(2, dto.getQa_division());
			psmt.setString(3, dto.getQa_email());
			psmt.setString(4, dto.getQa_tel());
			psmt.setString(5, dto.getQa_title());
			psmt.setString(6, dto.getQa_content());
			psmt.setString(7, dto.getQa_file());
			psmt.setInt(8, dto.getQa_count());
			psmt.setString(9, dto.getQa_name());
	
			
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}		
		return affected;
	}/////////////insert

}

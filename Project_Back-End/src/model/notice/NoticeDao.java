package model.notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class NoticeDao {
	//멤버변수
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	//생성자]
	public NoticeDao(ServletContext context){
		try {
			Class.forName(context.getInitParameter("ORACLE_DRIVER"));
			conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"), "team ", "2030");
		} catch (Exception e) {				
			e.printStackTrace();
		}
	}
	
	public void close(){
		try{
			if(rs   != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}//try
		catch(Exception e){e.printStackTrace();}//catch
	}//close
	
	
	//전체 목록 가져오기]
	public List<NoticeDto> selectList(){
		List<NoticeDto> records = new Vector<NoticeDto>();
		
		//페이징 미 적용
		String sql="SELECT N.*,D.DEPT_NAME FROM NOTICE_TABLE N JOIN MEMBER_TABLE M ON N.MEMBER_ID = M.MEMBER_ID JOIN DEPT_TABLE D ON D.DEPT_NO = N.DEPT_NO ORDER BY NOTICE_NO DESC";
		//;
		//페이징 적용-구간쿼리로 변경
		/*String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT B.*,M.NAME FROM BBS B JOIN MEMBER M ON B.ID=M.ID ";
		//검색용 쿼리 추가
		if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}		
		sql+=" ORDER BY NO DESC) T) WHERE R BETWEEN ? AND ?";*/
		
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]
			
			rs = psmt.executeQuery();
			while(rs.next()){
				NoticeDto dto = new NoticeDto(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7),
						rs.getString(8),
						rs.getDate(9),
						rs.getString(10)
						);
				records.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		return records;
	}/////////////////selectList
	
	
	public NoticeDto selectOne(String no) {
		NoticeDto dto = null;
		String sql = "SELECT N.*,D.DEPT_NAME FROM NOTICE_TABLE N JOIN MEMBER_TABLE M ON N.MEMBER_ID = M.MEMBER_ID JOIN DEPT_TABLE D ON D.DEPT_NO = N.DEPT_NO WHERE NOTICE_NO = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				
				dto = new NoticeDto();
				dto.setNotice_no(rs.getInt(1));
				dto.setMember_id(rs.getString(2));
				dto.setNotice_title(rs.getString(3));
				dto.setNotice_divide(rs.getString(4));
				dto.setNotice_file(rs.getString(5));
				dto.setDept_no(rs.getInt(6));
				dto.setNotice_count(rs.getInt(7));
				dto.setNotice_content(rs.getString(8));
				dto.setNotice_regidate(rs.getDate(9));
				dto.setDept_name(rs.getString(10));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return dto;
	}////////////////// selectOne
	
	
	public int update(NoticeDto dto){
		int affected =0;
		String sql="UPDATE NOTICE_TABLE SET NOTICE_TITLE=?,DEPT_NO=?, NOTICE_FILE=? WHERE NOTICE_NO=?";
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNotice_title());
			psmt.setInt(2, dto.getDept_no());
			psmt.setString(3, dto.getNotice_file());
			psmt.setInt(4, dto.getNotice_no());
			
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}	
	
		return affected;
	}/////////////update

	
	public List<NoticeDto> selectname(){
		List<NoticeDto> records = new Vector<NoticeDto>();
		
		//페이징 미 적용
		String sql="SELECT DEPT_NAME FROM DEPT_TABLE";
		//;
		//페이징 적용-구간쿼리로 변경
		/*String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT B.*,M.NAME FROM BBS B JOIN MEMBER M ON B.ID=M.ID ";
		//검색용 쿼리 추가
		if(map.get("searchWord") !=null){
			sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
		}		
		sql+=" ORDER BY NO DESC) T) WHERE R BETWEEN ? AND ?";*/
		
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]
			
			rs = psmt.executeQuery();
			while(rs.next()){
				NoticeDto dto = new NoticeDto(
						0, null, null, null, null, 0, 0, null, null, rs.getString(1)
						);
				records.add(dto);
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		}		
		return records;
	}/////////////////selectList
	
	public void updateVisitCount(String no) {
		String sql = "UPDATE NOTICE_TABLE SET NOTICE_COUNT=NOTICE_COUNT+1 WHERE NOTICE_NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//////////////////// updateVisitCount
	
	
}

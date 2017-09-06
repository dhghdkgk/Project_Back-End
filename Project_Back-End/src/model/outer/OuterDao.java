package model.outer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;



public class OuterDao {
	//멤버변수
		private Connection conn;
		private PreparedStatement psmt;
		private ResultSet rs;
		
		//생성자]
		public OuterDao(ServletContext context){
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
		public List<OuterDto> selectList(Map<String, Object> map){
			List<OuterDto> records = new Vector<OuterDto>();
			
			//페이징 미 적용
			//String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT O.*,M.MEMBER_NAME FROM OUTER_CONCERT_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID = M.MEMBER_ID";
			
			//페이징 적용-구간쿼리로 변경
			String sql="SELECT * FROM (SELECT T.*, ROWNUM R FROM (SELECT O.*,M.MEMBER_NAME FROM OUTER_CONCERT_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID = M.MEMBER_ID";
			//검색용 쿼리 추가
			if(map.get("searchWord") !=null){
				sql+=" WHERE "+map.get("searchColumn")+ " LIKE '%"+map.get("searchWord")+"%' ";
			}		
			sql+=" ORDER BY OUTER_NO DESC) T) WHERE R BETWEEN ? AND ?";
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				//페이징을 위한 시작 및 종료 rownum설정]
				
				rs = psmt.executeQuery();
				while(rs.next()){
					OuterDto dto = new OuterDto(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getInt(5),
							rs.getString(6),
							rs.getString(7),
							rs.getString(8),
							rs.getString(9),
							rs.getString(10),
							rs.getString(11),
							rs.getString(12),
							rs.getString(13),
							rs.getDate(14)
							);
					records.add(dto);
				}
			} catch (SQLException e) {			
				e.printStackTrace();
			}		
			return records;
		}/////////////////selectList
		
		public int getTotalRecordCount(Map<String, Object> map) {
			int totalCount = 0;
			String sql = "SELECT COUNT(*) FROM OUTER_CONCERT_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID = M.MEMBER_ID";
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
		
		
		public OuterDto selectOne(String no) {
			OuterDto dto = null;
			String sql = "SELECT O.*,M.MEMBER_ID FROM OUTER_CONCERT_TABLE O JOIN MEMBER_TABLE M ON O.MEMBER_ID = M.MEMBER_ID WHERE OUTER_NO = ?";
			try{
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, no);
				rs = psmt.executeQuery();
				if(rs.next()){
					dto = new OuterDto();
					dto.setOuter_no(rs.getInt(1));
					dto.setMember_id(rs.getString(2));
					dto.setOuter_concertname(rs.getString(3));
					dto.setOuter_name(rs.getString(4));
					dto.setOuter_number(rs.getInt(5));
					dto.setOuter_tel(rs.getString(6));
					dto.setOuter_email(rs.getString(7));
					dto.setOuter_content(rs.getString(8));
					dto.setOuter_progress(rs.getString(9));
					dto.setOuter_equipment(rs.getString(10));
					dto.setOuter_profile(rs.getString(11));
					dto.setOuter_date(rs.getString(12));
					dto.setOuter_request(rs.getString(13));
					dto.setOuter_regidate(rs.getDate(14));
					
				}//if
			}//try
			catch(Exception e){ e.printStackTrace(); }//catch
			
			return dto;
		}//selectOne
		
		
		public int update(OuterDto dto){
			int affected =0;
			String sql="UPDATE OUTER_CONCERT_TABLE SET OUTER_CONCERTNAME = ?, OUTER_NAME = ?, OUTER_TEL = ?, OUTER_EMAIL = ?, OUTER_CONTENT = ?, OUTER_PROGRESS = ?, OUTER_EQUIPMENT = ?, OUTER_PROFILE = ?, OUTER_REQUEST = ?, OUTER_DATE = ? WHERE OUTER_NO=?";
		
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getOuter_concertname());
				psmt.setString(2, dto.getOuter_name());
				psmt.setString(3, dto.getOuter_tel());
				psmt.setString(4, dto.getOuter_email());
				psmt.setString(5, dto.getOuter_content());
				psmt.setString(6, dto.getOuter_progress());
				psmt.setString(7, dto.getOuter_equipment());
				psmt.setString(8, dto.getOuter_profile());
				psmt.setString(9, dto.getOuter_request());
				psmt.setString(10,dto.getOuter_date());
				psmt.setInt(11, dto.getOuter_no());
				
				affected = psmt.executeUpdate();
			} 
			catch (SQLException e) {			
				e.printStackTrace();
			}	
		
			return affected;
		}/////////////update
	
	
		public int delete(String no) {
			int affected = 0;
			String sql = "DELETE OUTER_CONCERT_TABLE WHERE OUTER_NO=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, no);
				affected = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return affected;
		}///////////// delete
		
	
}//class

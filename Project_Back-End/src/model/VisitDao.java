package model;

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



public class VisitDao {
	//멤버변수
		private Connection conn;
		private PreparedStatement psmt;
		private ResultSet rs;
		
		//생성자]
		public VisitDao(ServletContext context){
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
	
		public int insert(VisitDto dto) {
			int affected =0;
			String sql="INSERT INTO VISIT_TRANING_TABLE VALUES(SEQ_INCNUM.NEXTVAL,KIM,?,?,?,?,?,?,?,?,?)";
		
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, dto.getVisit_no());
				psmt.setString(2, dto.getMember_id());
				psmt.setString(3, dto.getVisit_name());
				psmt.setString(3, dto.getVisit_register());
				psmt.setString(3, dto.getVisit_tel());
				psmt.setString(3, dto.getVisit_email());
				psmt.setString(3, dto.getVisit_division());
				psmt.setInt(3, dto.getVisit_number());
				psmt.setString(3, dto.getVisit_date());
				psmt.setString(3, dto.getVisit_content());
				psmt.setString(3, dto.getVisit_regidate());
				affected = psmt.executeUpdate();
			} 
			catch (SQLException e) {			
				e.printStackTrace();
			}		
			return affected;
			
		}
		
		
		//전체 목록 가져오기]
	
		
		
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

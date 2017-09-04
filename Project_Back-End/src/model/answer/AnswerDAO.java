package model.answer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class AnswerDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;

	// 생성자]
	public AnswerDAO(ServletContext context) {
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
public List<AnswerDTO> selectList(){
		
		List<AnswerDTO> records = new Vector<AnswerDTO>();
		
		
		String sql="SELECT A.*,D.DEPT_NAME FROM ANSWER_TABLE A JOIN DEPT_TABLE D ON A.DEPT_NO = D.DEPT_NO ORDER BY ANSWER_NO DESC";
		
		
		try {
			psmt = conn.prepareStatement(sql);
			
			//페이징을 위한 시작 및 종료 rownum설정]			
			rs = psmt.executeQuery();
			while(rs.next()){
				AnswerDTO dto = new AnswerDTO(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getInt(4),
					rs.getDate(5));
			
				records.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
		return records;
	}/////////////////selectList
		// 회원여부 판단용]
	
	public int insert(AnswerDTO dto){
		int affected =0;
		String sql="INSERT INTO ANSWER_TABLE(ANSWER_NO,DEPT_NO,ANSWER_CONTENT,QA_NO) VALUES(SEQ_INCNUM.NEXTVAL,?,?,?)";
	
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getDept_no());
			psmt.setString(2, dto.getAnswer_content());
			psmt.setInt(3, dto.getQa_no());
		
			affected = psmt.executeUpdate();
		} 
		catch (SQLException e) {			
			e.printStackTrace();
		}		
		return affected;
	}/////////////insert
	
}

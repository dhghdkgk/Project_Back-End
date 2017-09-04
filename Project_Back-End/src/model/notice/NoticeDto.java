package model.notice;

import java.util.Date;

public class NoticeDto {
	private int notice_no;
	private String member_id;
	private String notice_title;
	private String notice_divide;
	private String notice_file;
	private int dept_no;
	private int notice_count;
	private String notice_content;
	private Date notice_regidate;
	private String dept_name;
	
	public NoticeDto() {}
	
	public NoticeDto(int notice_no, String member_id, String notice_title, String notice_divide, String notice_file,
			int dept_no, int notice_count, String notice_content, Date notice_regidate, String dept_name) {
		super();
		this.notice_no = notice_no;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_divide = notice_divide;
		this.notice_file = notice_file;
		this.dept_no = dept_no;
		this.notice_count = notice_count;
		this.notice_content = notice_content;
		this.notice_regidate = notice_regidate;
		this.dept_name = dept_name;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_divide() {
		return notice_divide;
	}
	public void setNotice_divide(String notice_divide) {
		this.notice_divide = notice_divide;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regidate() {
		return notice_regidate;
	}
	public void setNotice_regidate(Date notice_regidate) {
		this.notice_regidate = notice_regidate;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	
	
	
}

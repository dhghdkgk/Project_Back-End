package model;

import java.util.Date;

public class TotalDTO {
	private  int no;
	private String member_id;
	private  String title;
	private String name;
	private String content;
	private String divide;
	private int count;
	private java.util.Date regidate;
	
	public TotalDTO() {}
	public TotalDTO(int no, String member_id, String title, String name, String content, String divide, int count,
			Date regidate) {
		super();
		this.no = no;
		this.member_id = member_id;
		this.title = title;
		this.name = name;
		this.content = content;
		this.divide = divide;
		this.count = count;
		this.regidate = regidate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDivide() {
		return divide;
	}
	public void setDivide(String divide) {
		this.divide = divide;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public java.util.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.util.Date regidate) {
		this.regidate = regidate;
	}
	
}

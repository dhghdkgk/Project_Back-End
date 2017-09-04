package model.outer;

import java.util.Date;

public class OuterDto {
	private int outer_no;
	private String member_id;
	private String outer_concertname;
	private String outer_name;
	private int outer_number;
	private String outer_tel;
	private String outer_email;
	private String outer_content;
	private String outer_progress;
	private String outer_equipment;
	private String outer_profile;
	private String outer_date;
	private String outer_request;
	private java.util.Date outer_regidate;
	
	public OuterDto(){}

	public OuterDto(int outer_no, String member_id, String outer_concertname, String outer_name, int outer_number,
			String outer_tel, String outer_email, String outer_content, String outer_progress, String outer_equipment,
			String outer_profile, String outer_date, String outer_request, Date outer_regidate) {
		super();
		this.outer_no = outer_no;
		this.member_id = member_id;
		this.outer_concertname = outer_concertname;
		this.outer_name = outer_name;
		this.outer_number = outer_number;
		this.outer_tel = outer_tel;
		this.outer_email = outer_email;
		this.outer_content = outer_content;
		this.outer_progress = outer_progress;
		this.outer_equipment = outer_equipment;
		this.outer_profile = outer_profile;
		this.outer_date = outer_date;
		this.outer_request = outer_request;
		this.outer_regidate = outer_regidate;
	}

	public int getOuter_no() {
		return outer_no;
	}

	public void setOuter_no(int outer_no) {
		this.outer_no = outer_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getOuter_concertname() {
		return outer_concertname;
	}

	public void setOuter_concertname(String outer_concertname) {
		this.outer_concertname = outer_concertname;
	}

	public String getOuter_name() {
		return outer_name;
	}

	public void setOuter_name(String outer_name) {
		this.outer_name = outer_name;
	}

	public int getOuter_number() {
		return outer_number;
	}

	public void setOuter_number(int outer_number) {
		this.outer_number = outer_number;
	}

	public String getOuter_tel() {
		return outer_tel;
	}

	public void setOuter_tel(String outer_tel) {
		this.outer_tel = outer_tel;
	}

	public String getOuter_email() {
		return outer_email;
	}

	public void setOuter_email(String outer_email) {
		this.outer_email = outer_email;
	}

	public String getOuter_content() {
		return outer_content;
	}

	public void setOuter_content(String outer_content) {
		this.outer_content = outer_content;
	}

	public String getOuter_progress() {
		return outer_progress;
	}

	public void setOuter_progress(String outer_progress) {
		this.outer_progress = outer_progress;
	}

	public String getOuter_equipment() {
		return outer_equipment;
	}

	public void setOuter_equipment(String outer_equipment) {
		this.outer_equipment = outer_equipment;
	}

	public String getOuter_profile() {
		return outer_profile;
	}

	public void setOuter_profile(String outer_profile) {
		this.outer_profile = outer_profile;
	}

	public String getOuter_date() {
		return outer_date;
	}

	public void setOuter_date(String outer_date) {
		this.outer_date = outer_date;
	}

	public String getOuter_request() {
		return outer_request;
	}

	public void setOuter_request(String outer_request) {
		this.outer_request = outer_request;
	}

	public java.util.Date getOuter_regidate() {
		return outer_regidate;
	}

	public void setOuter_regidate(java.util.Date outer_regidate) {
		this.outer_regidate = outer_regidate;
	}

	
	
	
}//class

package model;

import java.util.Date;

public class VisitDto {
	private int visit_no; 
	private String member_id;
	private String visit_name; 
	private String visit_register;
	private String visit_tel; 
	private String visit_email;
	private String visit_division; 
	private int visit_number; 
	private String visit_date; 
	private String visit_content; 
	private String visit_regidate; 
	
	public VisitDto(){
		
	}

	public VisitDto(int visit_no, String member_id, String visit_register, String visit_name, String visit_tel,
			String visit_division, int visit_number, String visit_date, String visit_content, String visit_regidate) {
		super();
		this.visit_no = visit_no;
		this.member_id = member_id;
		this.visit_register = visit_register;
		this.visit_name = visit_name;
		this.visit_tel = visit_tel;
		this.visit_division = visit_division;
		this.visit_number = visit_number;
		this.visit_date = visit_date;
		this.visit_content = visit_content;
		this.visit_regidate = visit_regidate;
	}

	public int getVisit_no() {
		return visit_no;
	}

	public void setVisit_no(int visit_no) {
		this.visit_no = visit_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getVisit_register() {
		return visit_register;
	}

	public void setVisit_register(String visit_register) {
		this.visit_register = visit_register;
	}

	public String getVisit_name() {
		return visit_name;
	}

	public void setVisit_name(String visit_name) {
		this.visit_name = visit_name;
	}

	public String getVisit_tel() {
		return visit_tel;
	}

	public void setVisit_tel(String visit_tel) {
		this.visit_tel = visit_tel;
	}

	public String getVisit_division() {
		return visit_division;
	}

	public void setVisit_division(String visit_division) {
		this.visit_division = visit_division;
	}

	public int getVisit_number() {
		return visit_number;
	}

	public void setVisit_number(int visit_number) {
		this.visit_number = visit_number;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getVisit_content() {
		return visit_content;
	}

	public void setVisit_content(String visit_content) {
		this.visit_content = visit_content;
	}

	public String getVisit_regidate() {
		return visit_regidate;
	}

	public void setVisit_regidate(String visit_regidate) {
		this.visit_regidate = visit_regidate;
	}

	public String getVisit_email() {
		return visit_email;
	}

	public void setVisit_email(String visit_email) {
		this.visit_email = visit_email;
	}
	
	
	
	
}

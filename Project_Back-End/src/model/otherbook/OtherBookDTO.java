package model.otherbook;

import java.util.Date;

/*
 *  CREATE TABLE OTHERBOOK(
 OTHER_NO NUMBER PRIMARY KEY ,
 BOOK_ISBN NVARCHAR2(20) NOT NULL,
 MEMBER_ID NVARCHAR2(20) REFERENCES MEMBER(MEMBER_ID),
 OTHER_TITLE NVARCHAR2(50) NOT NULL,
 OTHER_WRITER NVARCHAR2(15) NOT NULL,
 OTHER_GROUP NVARCHAR2(100) NOT NULL,
 OTHER_ISSUE NVARCHAR2(50) NOT NULL,
 OTHER_YEAR DATE NOT NULL,
 OTHER_REGUESTER NVARCHAR2(20) NOT NULL,
 OTHER_EMAIL NVARCHAR2(20) NOT NULL,
 OTHER_TEL NVARCHAR2(15) NOT NULL,
 OTHER_REGIDATE DATE DEFAULT SYSDATE,
 OTHER_DATADIVIDE NVARCHAR2(20) NOT NULL,
 OTHER_TYPE NVARCHAR2(50) NOT NULL,
 OTHER_DBDIVIDE NVARCHAR2(20) NOT NULL)
 /
 */
public class OtherBookDTO {
private int other_no;
private String other_isbn;
private String member_id;
private String other_title;
private String other_writer;
private String other_group;
private String other_issue;
private String other_data;
private int other_price;
private String other_status;
private java.util.Date other_year;
private String other_requester;
private String other_email;
private String other_tel;
private java.util.Date other_regidate;//신청일

public OtherBookDTO() {}

public OtherBookDTO(int other_no, String other_isbn, String member_id, String other_title, String other_writer,
		String other_group, String other_issue, String other_data, int other_price, String other_status,
		Date other_year, String other_requester, String other_email, String other_tel, Date other_regidate) {
	
	this.other_no = other_no;
	this.other_isbn = other_isbn;
	this.member_id = member_id;
	this.other_title = other_title;
	this.other_writer = other_writer;
	this.other_group = other_group;
	this.other_issue = other_issue;
	this.other_data = other_data;
	this.other_price = other_price;
	this.other_status = other_status;
	this.other_year = other_year;
	this.other_requester = other_requester;
	this.other_email = other_email;
	this.other_tel = other_tel;
	this.other_regidate = other_regidate;
}

public int getOther_no() {
	return other_no;
}

public void setOther_no(int other_no) {
	this.other_no = other_no;
}

public String getBook_isbn() {
	return other_isbn;
}

public void setBook_isbn(String other_isbn) {
	this.other_isbn = other_isbn;
}

public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}

public String getOther_title() {
	return other_title;
}

public void setOther_title(String other_title) {
	this.other_title = other_title;
}

public String getOther_writer() {
	return other_writer;
}

public void setOther_writer(String other_writer) {
	this.other_writer = other_writer;
}

public String getOther_group() {
	return other_group;
}

public void setOther_group(String other_group) {
	this.other_group = other_group;
}

public String getOther_issue() {
	return other_issue;
}

public void setOther_issue(String other_issue) {
	this.other_issue = other_issue;
}

public String getOther_data() {
	return other_data;
}

public void setOther_data(String other_data) {
	this.other_data = other_data;
}

public int getOther_price() {
	return other_price;
}

public void setOther_price(int other_price) {
	this.other_price = other_price;
}

public String getOther_status() {
	return other_status;
}

public void setOther_status(String other_status) {
	this.other_status = other_status;
}

public java.util.Date getOther_year() {
	return other_year;
}

public void setOther_year(java.util.Date other_year) {
	this.other_year = other_year;
}

public String getOther_requester() {
	return other_requester;
}

public void setOther_requester(String other_requester) {
	this.other_requester = other_requester;
}

public String getOther_email() {
	return other_email;
}

public void setOther_email(String other_email) {
	this.other_email = other_email;
}

public String getOther_tel() {
	return other_tel;
}

public void setOther_tel(String other_tel) {
	this.other_tel = other_tel;
}

public java.util.Date getOther_regidate() {
	return other_regidate;
}

public void setOther_regidate(java.util.Date other_regidate) {
	this.other_regidate = other_regidate;
}





}

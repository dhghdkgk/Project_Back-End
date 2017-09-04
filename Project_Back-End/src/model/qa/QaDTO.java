package model.qa;

import java.util.Date;

/*
 * QA_NO                                     NOT NULL NUMBER
MEMBER_ID                                 NOT NULL NVARCHAR2(20)
QA_DIVISION                               NOT NULL NVARCHAR2(20)
QA_EMAIL                                  NOT NULL NVARCHAR2(20)
QA_TEL                                    NOT NULL NVARCHAR2(20)
QA_OPEN                                   NOT NULL NVARCHAR2(2)
QA_EMAILING                               NOT NULL NVARCHAR2(2)
QA_SMS                                    NOT NULL NVARCHAR2(2)
QA_TITLE                                  NOT NULL NVARCHAR2(50)
QA_CONTENT                                NOT NULL NVARCHAR2(1000)
QA_FILE                                   NOT NULL NVARCHAR2(50)

QA_PROCESS                                NOT NULL NVARCHAR2(20)
QA_REGIDATE                               NOT NULL DATE
 */
public class QaDTO {
private int qa_no;
private String member_id;
private String qa_division;
private String qa_email;
private String qa_tel;
private String qa_open;
private String qa_emailing;
private String qa_sms;
private String qa_title;
private String qa_content;
private String qa_file;
private int qa_count;
private String qa_process;
private String qa_name;
private java.util.Date qa_regidate;

public QaDTO() {}

public QaDTO(int qa_no, String member_id, String qa_division, String qa_email, String qa_tel, String qa_open,
		String qa_emailing, String qa_sms, String qa_title, String qa_content, String qa_file, int qa_count,
		String qa_process, String qa_name, Date qa_regidate) {
	super();
	this.qa_no = qa_no;
	this.member_id = member_id;
	this.qa_division = qa_division;
	this.qa_email = qa_email;
	this.qa_tel = qa_tel;
	this.qa_open = qa_open;
	this.qa_emailing = qa_emailing;
	this.qa_sms = qa_sms;
	this.qa_title = qa_title;
	this.qa_content = qa_content;
	this.qa_file = qa_file;
	this.qa_count = qa_count;
	this.qa_process = qa_process;
	this.qa_name = qa_name;
	this.qa_regidate = qa_regidate;
}

public int getQa_no() {
	return qa_no;
}

public void setQa_no(int qa_no) {
	this.qa_no = qa_no;
}

public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}

public String getQa_division() {
	return qa_division;
}

public void setQa_division(String qa_division) {
	this.qa_division = qa_division;
}

public String getQa_email() {
	return qa_email;
}

public void setQa_email(String qa_email) {
	this.qa_email = qa_email;
}

public String getQa_tel() {
	return qa_tel;
}

public void setQa_tel(String qa_tel) {
	this.qa_tel = qa_tel;
}

public String getQa_open() {
	return qa_open;
}

public void setQa_open(String qa_open) {
	this.qa_open = qa_open;
}

public String getQa_emailing() {
	return qa_emailing;
}

public void setQa_emailing(String qa_emailing) {
	this.qa_emailing = qa_emailing;
}

public String getQa_sms() {
	return qa_sms;
}

public void setQa_sms(String qa_sms) {
	this.qa_sms = qa_sms;
}

public String getQa_title() {
	return qa_title;
}

public void setQa_title(String qa_title) {
	this.qa_title = qa_title;
}

public String getQa_content() {
	return qa_content;
}

public void setQa_content(String qa_content) {
	this.qa_content = qa_content;
}

public String getQa_file() {
	return qa_file;
}

public void setQa_file(String qa_file) {
	this.qa_file = qa_file;
}

public int getQa_count() {
	return qa_count;
}

public void setQa_count(int qa_count) {
	this.qa_count = qa_count;
}

public String getQa_process() {
	return qa_process;
}

public void setQa_process(String qa_process) {
	this.qa_process = qa_process;
}

public String getQa_name() {
	return qa_name;
}

public void setQa_name(String qa_name) {
	this.qa_name = qa_name;
}

public java.util.Date getQa_regidate() {
	return qa_regidate;
}

public void setQa_regidate(java.util.Date qa_regidate) {
	this.qa_regidate = qa_regidate;
}





}

package model.answer;

import java.util.Date;

/*
 * 
 * ANSWER_NO                                 NOT NULL NUMBER
DEPT_NO                                   NOT NULL NUMBER
ANSWER_CONTENT                            NOT NULL NVARCHAR2(1000)
QA_NO                                     NOT NULL NUMBER
ANSWER_REGIDATE                           NOT NULL DATE
 */
public class AnswerDTO {
private int answer_no;
private int dept_no;

private String answer_content;
private int qa_no;
private java.util.Date answer_regidate;



public AnswerDTO(int answer_no, int dept_no, String answer_content, int qa_no, Date answer_regidate) {
	this.answer_no = answer_no;
	this.dept_no = dept_no;
	this.answer_content = answer_content;
	this.qa_no = qa_no;
	this.answer_regidate = answer_regidate;
}
public int getAnswer_no() {
	return answer_no;
}
public void setAnswer_no(int answer_no) {
	this.answer_no = answer_no;
}
public int getDept_no() {
	return dept_no;
}
public void setDept_no(int dept_no) {
	this.dept_no = dept_no;
}
public String getAnswer_content() {
	return answer_content;
}
public void setAnswer_content(String answer_content) {
	this.answer_content = answer_content;
}
public int getQa_no() {
	return qa_no;
}
public void setQa_no(int qa_no) {
	this.qa_no = qa_no;
}
public java.util.Date getAnswer_regidate() {
	return answer_regidate;
}
public void setAnswer_regidate(java.util.Date answer_regidate) {
	this.answer_regidate = answer_regidate;
}







}

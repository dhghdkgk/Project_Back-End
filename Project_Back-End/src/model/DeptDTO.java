package model;

import java.util.Date;

public class DeptDTO {
private int dept_no;
private String dept_name;
private java.util.Date regidate;
public DeptDTO(int dept_no, String dept_name, Date regidate) {
	this.dept_no = dept_no;
	this.dept_name = dept_name;
	this.regidate = regidate;
}
public int getDept_no() {
	return dept_no;
}
public void setDept_no(int dept_no) {
	this.dept_no = dept_no;
}
public String getDept_name() {
	return dept_name;
}
public void setDept_name(String dept_name) {
	this.dept_name = dept_name;
}
public java.util.Date getRegidate() {
	return regidate;
}
public void setRegidate(java.util.Date regidate) {
	this.regidate = regidate;
} 




}

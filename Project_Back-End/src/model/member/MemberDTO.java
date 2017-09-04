package model.member;

import java.sql.Date;
/*
 *  MEMBER_ID                                 NOT NULL NVARCHAR2(20)
 MEMBER_NAME                               NOT NULL NVARCHAR2(10)
 MEMBER_BIRTH                              NOT NULL NVARCHAR2(15)
 MEMBER_PASSWORD                           NOT NULL NVARCHAR2(20)
 MEMBER_JOB                                NOT NULL NVARCHAR2(10)
 MEMBER_EMAIL                              NOT NULL NVARCHAR2(25)
 MEMBER_MINE_TIP                           NOT NULL NVARCHAR2(20)
 MEMBER_MINE_ANSWER                        NOT NULL NVARCHAR2(20)
 MEMBER_ADDRESS                            NOT NULL NVARCHAR2(40)
 MEMBER_TEL                                NOT NULL NVARCHAR2(15)
 MEMBER_DISABLED_SERVICE                            NVARCHAR2(50)
 MEMBER_APPLY                                       NVARCHAR2(50)
 MEMBER_OUT                                NOT NULL NVARCHAR2(2)
 MEMBER_REGIDATE                           NOT NULL DATE
 */
	
public class MemberDTO {
	private String member_id;
	private String member_birth;
	private String member_password;
	private String member_job;
	private String member_email;
	private String member_mine_tip;
	private String member_mine_answer;
	private String member_address;
	private String member_tel;
	private String member_disabled_service;
	private String member_apply;
	private String member_out;
	private java.util.Date member_regidate;
	public MemberDTO() {}
	public MemberDTO(String member_id, String member_birth, String member_password, String member_job,
			String member_email, String member_mine_tip, String member_mine_answer, String member_address,
			String member_tel, String member_disabled_service, String member_apply, String member_out,
			java.util.Date member_regidate) {
		this.member_id = member_id;
		this.member_birth = member_birth;
		this.member_password = member_password;
		this.member_job = member_job;
		this.member_email = member_email;
		this.member_mine_tip = member_mine_tip;
		this.member_mine_answer = member_mine_answer;
		this.member_address = member_address;
		this.member_tel = member_tel;
		this.member_disabled_service = member_disabled_service;
		this.member_apply = member_apply;
		this.member_out = member_out;
		this.member_regidate = member_regidate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_job() {
		return member_job;
	}
	public void setMember_job(String member_job) {
		this.member_job = member_job;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_mine_tip() {
		return member_mine_tip;
	}
	public void setMember_mine_tip(String member_mine_tip) {
		this.member_mine_tip = member_mine_tip;
	}
	public String getMember_mine_answer() {
		return member_mine_answer;
	}
	public void setMember_mine_answer(String member_mine_answer) {
		this.member_mine_answer = member_mine_answer;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_disabled_service() {
		return member_disabled_service;
	}
	public void setMember_disabled_service(String member_disabled_service) {
		this.member_disabled_service = member_disabled_service;
	}
	public String getMember_apply() {
		return member_apply;
	}
	public void setMember_apply(String member_apply) {
		this.member_apply = member_apply;
	}
	public String getMember_out() {
		return member_out;
	}
	public void setMember_out(String member_out) {
		this.member_out = member_out;
	}
	public java.util.Date getMember_regidate() {
		return member_regidate;
	}
	public void setMember_regidate(java.util.Date member_regidate) {
		this.member_regidate = member_regidate;
	}
	
}

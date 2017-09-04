package model.recommend;

import java.util.Date;

public class ReCommendDTO {
	private int rec_no;
	private int book_no;
	private java.util.Date rec_regidate;
	public ReCommendDTO(int rec_no, int book_no, Date rec_regidate) {
		this.rec_no = rec_no;
		this.book_no = book_no;
		this.rec_regidate = rec_regidate;
	}
	public int getRec_no() {
		return rec_no;
	}
	public void setRec_no(int rec_no) {
		this.rec_no = rec_no;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public java.util.Date getRec_regidate() {
		return rec_regidate;
	}
	public void setRec_regidate(java.util.Date rec_regidate) {
		this.rec_regidate = rec_regidate;
	}
	
	
}

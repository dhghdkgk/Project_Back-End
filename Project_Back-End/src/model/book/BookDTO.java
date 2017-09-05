package model.book;

public class BookDTO {
	private int book_no;//책번호
	private String book_title;//책이름
	private String book_writer;//저자
	private String book_shape;//모양
	private String book_trans;//책임표시사항
	private String book_isbn;//isbn
	private String book_pubplace;//발행처
	private String book_pubdate;//발행일
	private String book_type;//분류
	private String book_mark;//청구기호
	private String book_pubmatter;//바행사항
	private String book_abstract;//초록
	private String book_img;//이미지
	private String book_regidate;//등록일

	public BookDTO() {
	}

	public BookDTO(int book_no, String book_title, String book_writer, String book_shape, String book_trans,
			String book_isbn, String book_pubplace, String book_pubdate, String book_type, String book_mark,
			String book_pubmatter, String book_abstract, String book_img, String book_regidate) {

		this.book_no = book_no;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_shape = book_shape;
		this.book_trans = book_trans;
		this.book_isbn = book_isbn;
		this.book_pubplace = book_pubplace;
		this.book_pubdate = book_pubdate;
		this.book_type = book_type;
		this.book_mark = book_mark;
		this.book_pubmatter = book_pubmatter;
		this.book_abstract = book_abstract;
		this.book_img = book_img;
		this.book_regidate = book_regidate;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_shape() {
		return book_shape;
	}

	public void setBook_shape(String book_shape) {
		this.book_shape = book_shape;
	}

	public String getBook_trans() {
		return book_trans;
	}

	public void setBook_trans(String book_trans) {
		this.book_trans = book_trans;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_pubplace() {
		return book_pubplace;
	}

	public void setBook_pubplace(String book_pubplace) {
		this.book_pubplace = book_pubplace;
	}

	public String getBook_pubdate() {
		return book_pubdate;
	}

	public void setBook_pubdate(String book_pubdate) {
		this.book_pubdate = book_pubdate;
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public String getBook_mark() {
		return book_mark;
	}

	public void setBook_mark(String book_mark) {
		this.book_mark = book_mark;
	}

	public String getBook_pubmatter() {
		return book_pubmatter;
	}

	public void setBook_pubmatter(String book_pubmatter) {
		this.book_pubmatter = book_pubmatter;
	}

	public String getBook_abstract() {
		return book_abstract;
	}

	public void setBook_abstract(String book_abstract) {
		this.book_abstract = book_abstract;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public String getBook_regidate() {
		return book_regidate;
	}

	public void setBook_regidate(String book_regidate) {
		this.book_regidate = book_regidate;
	}

}

package model.review;

public class ReviewDTO {
	private int review_no;
	private int book_no;
	private String book_title;
	private String book_type;
	private String book_writer;
	private String book_pubplace;
	private String book_pubdate;
	private String book_pubmatter;
	private String book_mark;
	private String book_name;
	private String list_content;

	private String review_review;
	private String review_reviewer;
	private String review_pdf;
	
	public ReviewDTO() {}

	public ReviewDTO(int review_no, int book_no, String book_title, String book_type, String book_writer,
			String book_pubplace, String book_pubdate, String book_pubmatter, String book_mark, String book_name,
			String list_content, String review_review, String review_reviewer, String review_pdf) {
		super();
		this.review_no = review_no;
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_type = book_type;
		this.book_writer = book_writer;
		this.book_pubplace = book_pubplace;
		this.book_pubdate = book_pubdate;
		this.book_pubmatter = book_pubmatter;
		this.book_mark = book_mark;
		this.book_name = book_name;
		this.list_content = list_content;
		this.review_review = review_review;
		this.review_reviewer = review_reviewer;
		this.review_pdf = review_pdf;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
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

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
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

	public String getBook_pubmatter() {
		return book_pubmatter;
	}

	public void setBook_pubmatter(String book_pubmatter) {
		this.book_pubmatter = book_pubmatter;
	}

	public String getBook_mark() {
		return book_mark;
	}

	public void setBook_mark(String book_mark) {
		this.book_mark = book_mark;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getList_content() {
		return list_content;
	}

	public void setList_content(String list_content) {
		this.list_content = list_content;
	}

	public String getReview_review() {
		return review_review;
	}

	public void setReview_review(String review_review) {
		this.review_review = review_review;
	}

	public String getReview_reviewer() {
		return review_reviewer;
	}

	public void setReview_reviewer(String review_reviewer) {
		this.review_reviewer = review_reviewer;
	}

	public String getReview_pdf() {
		return review_pdf;
	}

	public void setReview_pdf(String review_pdf) {
		this.review_pdf = review_pdf;
	}

	
	
}

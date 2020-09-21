package team.Dproject.main.model;

public class CommentDTO {
	private int cno;
	private int bno;
	private String content;
	private String writer;
	private String com_date;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}
}

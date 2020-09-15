package team.Dproject.main.model;

public class resvDTO {
	private int hotel_resv_no;
	private int member_no;
	private int hotel_no;
	private String room_no;
	private int use_point;
	private int save_point;
	private String pay;
	private String start_resv_date;
	private String end_resv_date;
	public int getHotel_resv_no() {
		return hotel_resv_no;
	}
	public void setHotel_resv_no(int hotel_resv_no) {
		this.hotel_resv_no = hotel_resv_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getHotel_no() {
		return hotel_no;
	}
	public void setHotel_no(int hotel_no) {
		this.hotel_no = hotel_no;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public int getUse_point() {
		return use_point;
	}
	public void setUse_point(int use_point) {
		this.use_point = use_point;
	}
	public int getSave_point() {
		return save_point;
	}
	public void setSave_point(int save_point) {
		this.save_point = save_point;
	}
	public String getStart_resv_date() {
		return start_resv_date;
	}
	public void setStart_resv_date(String start_resv_date) {
		this.start_resv_date = start_resv_date;
	}
	public String getEnd_resv_date() {
		return end_resv_date;
	}
	public void setEnd_resv_date(String end_resv_date) {
		this.end_resv_date = end_resv_date;
	}
	
	
	
}

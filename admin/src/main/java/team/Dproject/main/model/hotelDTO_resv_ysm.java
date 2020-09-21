package team.Dproject.main.model;

public class hotelDTO_resv_ysm {
	private int hotel_resv_no;
	private int member_no;
	private int hotel_no;
	private int room_no;
	private int use_point;
	private int save_point;
	private int price;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	private String resv_date;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHotel_resv_no() {
		return hotel_resv_no;
	}
	public void setHotel_resv_no(int hotel_resv_no) {
		this.hotel_resv_no = hotel_resv_no;
	}
	public int getMember_no() {
		return member_no;
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
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
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
	public String getResv_date() {
		return resv_date;
	}
	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

}

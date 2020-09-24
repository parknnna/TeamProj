package team.Dproject.main.model;

public class bus_resvDTO {
	private int bus_resv_no;
	private int member_no;
	private int bus_no;
	private int road_no;
	private int seat; 
	private int use_point; 
	private int save_point; 
	private String resv_date;
	private int price;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getBus_resv_no() {
		return bus_resv_no;
	}
	public void setBus_resv_no(int bus_resv_no) {
		this.bus_resv_no = bus_resv_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getBus_no() {
		return bus_no;
	}
	public void setBus_no(int bus_no) {
		this.bus_no = bus_no;
	}
	public int getRoad_no() {
		return road_no;
	}
	public void setRoad_no(int road_no) {
		this.road_no = road_no;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
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

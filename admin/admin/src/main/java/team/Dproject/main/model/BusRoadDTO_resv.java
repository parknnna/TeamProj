package team.Dproject.main.model;

public class BusRoadDTO_resv {
	private int road_no;
	private int bus_no;
	private int member_no;
	private String arrival;
	private String departure;
	private int price;
	private int arr_time;
	private int tot_time;
	
	
	public int getRoad_no() {
		return road_no;
	}
	public void setRoad_no(int road_no) {
		this.road_no = road_no;
	}
	public int getBus_no() {
		return bus_no;
	}
	public void setBus_no(int bus_no) {
		this.bus_no = bus_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public String getArrival() {
		return arrival;
	}
	public void setArrival(String arrival) {
		this.arrival = arrival;
	}
	
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getArr_time() {
		return arr_time;
	}
	public void setArr_time(int arr_time) {
		this.arr_time = arr_time;
	}
	public int getTot_time() {
		return tot_time;
	}
	public void setTot_time(int tot_time) {
		this.tot_time = tot_time;
	}
	
	
}

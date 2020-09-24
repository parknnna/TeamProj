package team.Dproject.main.model;

public class MemberDTO {
	private int member_no;
	private String name;
	private String id;
	private String passwd;
	private String ssn1;
	private String ssn2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private int position;
	private int sex;
	private int point;
	private String joindate;
	private String filename;
	private int filesize;
	
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getHp1(){
		return hp1;
	}
	public String getHp2(){
		return hp2;
	}
	public String getHp3(){
		return hp3;
	}
	public String getAllHp() {
		return hp1+"-"+hp2+"-"+hp3;
		
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	
}

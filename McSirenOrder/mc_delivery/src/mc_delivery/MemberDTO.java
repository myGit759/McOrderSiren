package mc_delivery;

//IDX      NOT NULL NUMBER        
//ID       NOT NULL VARCHAR2(100) 
//PASSWORD NOT NULL VARCHAR2(100) 
//NAME     NOT NULL VARCHAR2(100) 
//PHONENUM NOT NULL VARCHAR2(100) 
//EMAIL    NOT NULL VARCHAR2(100) 
//GENDER   NOT NULL VARCHAR2(10)  
//POINT             NUMBER      

public class MemberDTO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String phonenum;
	private String email;
	private String gender;
	private int point;
	private int age;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	
}

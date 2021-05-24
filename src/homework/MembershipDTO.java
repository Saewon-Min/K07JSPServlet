package homework;

import java.sql.Date;

public class MembershipDTO {

    private String id;
    private String pass; 
    private String name ;
    private String gender ;
    private String birth ;
    private String zipcode;
    private String address ;
    private String email ;    
    private String phone ;    
    private String homephone ;    
    private java.sql.Date regidate;
    
    
    public MembershipDTO() {}
    
	public MembershipDTO(String id, String pass, String name, String gender, String birth, String zipcode,
			String address, String email, String phone, String homephone, Date regidate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.zipcode = zipcode;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.homephone = homephone;
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String addr) {
		this.address = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHomephone() {
		return homephone;
	}
	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	
    
    
}

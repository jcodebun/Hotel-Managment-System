package in.co.hotel.mgt.sys.bean;

public class HotelBean extends BaseBean {
	
	private String name;
	private String city;
	private String address;
	private String description;
	private String contect;
	private String rating;
	
	
	
	
	
	
	
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContect() {
		return contect;
	}
	public void setContect(String contect) {
		this.contect = contect;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return id+ "";
	}
	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return name;
	}

}

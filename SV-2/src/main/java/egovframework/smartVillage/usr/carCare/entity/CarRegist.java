package egovframework.smartVillage.usr.carCare.entity;

public class CarRegist{
	private int carRegId;
	private String carNumber;
	private String houseDongHo;
	private String regDate;
	
	public int getCarRegId() {
		return carRegId;
	}
	public void setCarRegId(int carRegId) {
		this.carRegId = carRegId;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public String getHouseDongHo() {
		return houseDongHo;
	}
	public void setHouseDongHo(String houseDongHo) {
		this.houseDongHo = houseDongHo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
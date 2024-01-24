package egovframework.smartVillage.usr.carCare.entity;

public class ChargeHist{
	private int chargeHistId;
	private String biotModelName;
	private String houseDongHo;
	private String chargeState;
	private String regDate;
	
	public int getChargeHistId() {
		return chargeHistId;
	}
	public void setChargeHistId(int chargeHistId) {
		this.chargeHistId = chargeHistId;
	}
	public String getBiotModelName() {
		return biotModelName;
	}
	public void setBiotModelName(String biotModelName) {
		this.biotModelName = biotModelName;
	}
	public String getHouseDongHo() {
		return houseDongHo;
	}
	public void setHouseDongHo(String houseDongHo) {
		this.houseDongHo = houseDongHo;
	}
	public String getChargeState() {
		return chargeState;
	}
	public void setChargeState(String chargeState) {
		this.chargeState = chargeState;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
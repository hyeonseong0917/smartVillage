package egovframework.smartVillage.usr.waterEnergy.vo;

public class UsageChartVo{
	private String regMonth;
	private String regYear;
	private double recentUsages;
	private double prevUsages;
	
	public void setRegMonth(String regMonth) {
		this.regMonth = regMonth;
	}
	public void setPrevUsages(double prevUsages) {
		this.prevUsages = prevUsages;
	}
	public void setRecentUsages(double recentUsages) {
		this.recentUsages = recentUsages;
//		System.out.println("set 1"+recentUsages);
	}
	public void setRegYear(String regYear) {
		this.regYear = regYear;
	}
	
	public String getRegMonth() {
//		System.out.println(regMonth);
		return regMonth;
	}
	public double getRecentUsages() {
//		System.out.println(recentUsages);
		return recentUsages;
	}
	public double getPrevUsages() {
//		System.out.println(prevUsages);
		return prevUsages;
	}
	public String getRegYear() {
		return regYear;
	}
}
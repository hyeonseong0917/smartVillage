package egovframework.smartVillage.usr.waterEnergy.vo;

public class ExportChartVo {
	private String regMonth;
	private String regYear;
	private double recentUsages;
	private double prevUsages;
	
	private double recentExports;
	private double prevExports;
	public void setRegMonth(String regMonth) {
		this.regMonth = regMonth;
	}
	public void setRegYear(String regYear) {
		this.regYear = regYear;
	}
	public void setPrevUsages(double prevUsages) {
		this.prevUsages = prevUsages;
	}
	public void setRecentUsages(double recentUsages) {
		this.recentUsages = recentUsages;
//		System.out.println("set 1"+recentUsages);
	}
	public void setPrevExports(double prevExports) {
		this.prevExports = prevExports;
//		System.out.println("set 2"+prevExports);
	}
	public void setRecentExports(double recentExports) {
		this.recentExports = recentExports;
//		System.out.println("set 3"+recentExports);
	}
	
	public String getRegMonth() {
//		System.out.println(regMonth);
		return regMonth;
	}
	public String getRegYear() {
		return regYear;
	}
	public double getRecentExports() {
//		System.out.println(recentExports);
		return recentExports;
	}
	public double getRecentUsages() {
//		System.out.println(recentUsages);
		return recentUsages;
	}
	public double getPrevUsages() {
//		System.out.println(prevUsages);
		return prevUsages;
	}
	public double getPrevExports() {
//		System.out.println(prevExports);
		return prevExports;
	}
}

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
	}
	public void setPrevExports(double prevExports) {
		this.prevExports = prevExports;
	}
	public void setRecentExports(double recentExports) {
		this.recentExports = recentExports;
	}
	
	public String getRegMonth() {
		return regMonth;
	}
	public String getRegYear() {
		return regYear;
	}
	public double getRecentExports() {
		return recentExports;
	}
	public double getRecentUsages() {
		return recentUsages;
	}
	public double getPrevUsages() {

		return prevUsages;
	}
	public double getPrevExports() {
		return prevExports;
	}
}

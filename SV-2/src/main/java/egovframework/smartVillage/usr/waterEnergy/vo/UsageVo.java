package egovframework.smartVillage.usr.waterEnergy.vo;

public class UsageVo{
	private String recentRegDate;
	private double recentUsage;
	private String prevRegDate;
	private double prevUsage;
	
	
	public String getRecentRegDate() {
		return recentRegDate;
	}
	public void setRecentRegDate(String recentRegDate) {
		this.recentRegDate = recentRegDate;
	}
	public double getRecentUsage() {
		return recentUsage;
	}
	public void setRecentUsage(double recentUsage) {
		this.recentUsage = recentUsage;
	}
	public String getPrevRegDate() {
		return prevRegDate;
	}
	public void setPrevRegDate(String prevRegDate) {
		this.prevRegDate = prevRegDate;
	}
	public double getPrevUsage() {
		return prevUsage;
	}
	public void setPrevUsage(double prevUsage) {
		this.prevUsage = prevUsage;
	}
	
}
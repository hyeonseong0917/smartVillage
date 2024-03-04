package egovframework.smartVillage.usr.environment.vo;

public class InvironmentChartVO {
	private String thingModelAttributeName;
	private String thingModelAttributeType;
	private double thingModelAttributeValue;
	private String measurementTime;
	
	public void setMeasurementTime(String measurementTime) {
		this.measurementTime = measurementTime;
	}
	public void setThingModelAttributeName(String thingModelAttributeName) {
		this.thingModelAttributeName = thingModelAttributeName;
	}
	public void setThingModelAttributeType(String thingModelAttributeType) {
		this.thingModelAttributeType = thingModelAttributeType;
	}
	public void setThingModelAttributeValue(double thingModelAttributeValue) {
		this.thingModelAttributeValue = thingModelAttributeValue;
	}
	
	public String getMeasurementTime() {
		return measurementTime;
	}
	public String getThingModelAttributeName(){
		return thingModelAttributeName;
	}
	public String getThingModelAttributeType(){
		return thingModelAttributeType;
	}
	public double getThingModelAttributeValue(){
		return thingModelAttributeValue;
	}
	
}

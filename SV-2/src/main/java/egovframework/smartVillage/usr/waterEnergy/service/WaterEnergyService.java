package egovframework.smartVillage.usr.waterEnergy.service;

import java.util.List;

import egovframework.smartVillage.usr.waterEnergy.vo.UsageChartVo;
import egovframework.smartVillage.usr.waterEnergy.vo.UsageVo;
import egovframework.smartVillage.usr.waterEnergy.vo.ExportChartVo;

public interface WaterEnergyService {
	public UsageVo selectWaterUsage(String houseDongHo) throws Exception;
    public UsageVo selectElectricUsage(String houseDongHo) throws Exception;
    public UsageVo selectHeatingUsage(String houseDongHo) throws Exception;
    public UsageVo selectCoolingUsage(String houseDongHo) throws Exception;
    public UsageVo selectHotWaterUsage(String houseDongHo) throws Exception;
    
    
	public List<UsageChartVo> selectWaterUsageChartData(String houseDongHo) throws Exception;
	public List<ExportChartVo> selectElectricUsageChartData(String houseDongHo) throws Exception;
	public List<UsageChartVo> selectHeatingUsageChartData(String houseDongHo) throws Exception;
	public List<UsageChartVo> selectCoolingUsageChartData(String houseDongHo) throws Exception;
	public List<UsageChartVo> selectHotWaterUsageChartData(String houseDongHo) throws Exception;
}

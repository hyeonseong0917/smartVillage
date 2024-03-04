package egovframework.smartVillage.usr.waterEnergy.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.smartVillage.usr.waterEnergy.vo.UsageChartVo;
import egovframework.smartVillage.usr.waterEnergy.vo.UsageVo;
import egovframework.smartVillage.usr.waterEnergy.vo.ExportChartVo;

@Repository("waterEnergyDAO")
public class WaterEnergyDAO extends EgovComAbstractDAO {

	public UsageVo selectWaterUsage(String houseDongHo) throws Exception {
		return (UsageVo) select("WaterEnergyDAO.selectWaterUsage", houseDongHo);
	}
	public UsageVo selectElectricUsage(String houseDongHo) throws Exception {
		return (UsageVo) select("WaterEnergyDAO.selectElectricUsage", houseDongHo);
	}
	public UsageVo selectHeatingUsage(String houseDongHo) throws Exception {
		return (UsageVo) select("WaterEnergyDAO.selectHeatingUsage", houseDongHo);
	}
	public UsageVo selectCoolingUsage(String houseDongHo) throws Exception {
		return (UsageVo) select("WaterEnergyDAO.selectCoolingUsage", houseDongHo);
	}
	
	public UsageVo selectHotWaterUsage(String houseDongHo) throws Exception {
		return (UsageVo) select("WaterEnergyDAO.selectHotWaterUsage", houseDongHo);
	}

	public List<UsageChartVo> selectWaterUsageChartData(String houseDongHo) throws Exception {
		return (List<UsageChartVo>) list("WaterEnergyDAO.selectWaterUsageChartData", houseDongHo);	
	}
	public List<ExportChartVo> selectElectricUsageChartData(String houseDongHo) throws Exception {
		return (List<ExportChartVo>) list("WaterEnergyDAO.selectElectricUsageChartData", houseDongHo);
	}
	public List<UsageChartVo> selectHeatingUsageChartData(String houseDongHo) throws Exception {
		return (List<UsageChartVo>) list("WaterEnergyDAO.selectHeatingUsageChartData", houseDongHo);
	}
	public List<UsageChartVo> selectCoolingUsageChartData(String houseDongHo) throws Exception {
		return (List<UsageChartVo>) list("WaterEnergyDAO.selectCoolingUsageChartData", houseDongHo);
	}
	public List<UsageChartVo> selectHotWaterUsageChartData(String houseDongHo) throws Exception {
		return (List<UsageChartVo>) list("WaterEnergyDAO.selectHotWaterUsageChartData", houseDongHo);
	}
}

package egovframework.smartVillage.usr.waterEnergy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.smartVillage.usr.waterEnergy.dao.WaterEnergyDAO;
import egovframework.smartVillage.usr.waterEnergy.service.WaterEnergyService;
import egovframework.smartVillage.usr.waterEnergy.vo.UsageChartVo;
import egovframework.smartVillage.usr.waterEnergy.vo.UsageVo;
import egovframework.smartVillage.usr.waterEnergy.vo.ExportChartVo;

@Service("waterEnergyService")
public class WaterEnergyServiceImpl extends EgovAbstractServiceImpl implements WaterEnergyService {

	@Resource(name = "waterEnergyDAO")
	private WaterEnergyDAO waterEnergyDAO;
	
	@Override
	public UsageVo selectWaterUsage(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectWaterUsage(houseDongHo);
	}
	@Override
	public UsageVo selectElectricUsage(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectElectricUsage(houseDongHo);
	}
	@Override
	public UsageVo selectHeatingUsage(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectHeatingUsage(houseDongHo);
	}
	@Override
	public UsageVo selectCoolingUsage(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectCoolingUsage(houseDongHo);
	}
	@Override
	public UsageVo selectHotWaterUsage(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectHotWaterUsage(houseDongHo);
	}
	@Override
	public List<UsageChartVo> selectWaterUsageChartData(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectWaterUsageChartData(houseDongHo);
	}
	@Override
	public List<ExportChartVo> selectElectricUsageChartData(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectElectricUsageChartData(houseDongHo);
	}
	@Override
	public List<UsageChartVo> selectHeatingUsageChartData(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectHeatingUsageChartData(houseDongHo);
	}
	@Override
	public List<UsageChartVo> selectCoolingUsageChartData(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectCoolingUsageChartData(houseDongHo);
	}
	@Override
	public List<UsageChartVo> selectHotWaterUsageChartData(String houseDongHo) throws Exception {
		return waterEnergyDAO.selectHotWaterUsageChartData(houseDongHo);
	}
}

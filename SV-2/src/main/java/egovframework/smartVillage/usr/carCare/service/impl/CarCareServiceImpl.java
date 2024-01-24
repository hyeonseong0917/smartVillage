package egovframework.smartVillage.usr.carCare.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.smartVillage.usr.carCare.dao.CarCareDAO;
import egovframework.smartVillage.usr.carCare.entity.CarRegist;
import egovframework.smartVillage.usr.carCare.entity.ChargeHist;
import egovframework.smartVillage.usr.carCare.service.CarCareService;
import egovframework.smartVillage.usr.carCare.vo.CarInOutVo;

@Service("carCareService")
public class CarCareServiceImpl extends EgovAbstractServiceImpl implements CarCareService {

	@Resource(name = "carCareDAO")
	private CarCareDAO carCareDAO;
	
	@Override
	public List<CarRegist> selectCarRegistInfo(String houseDongHo) throws Exception{
		return carCareDAO.selectCarRegistInfo(houseDongHo);
	}
	@Override
	public List<CarInOutVo> selectCarInOutHist(String houseDongHo) throws Exception{
		return carCareDAO.selectCarInOutHist(houseDongHo);
	}
	
	@Override
	public List<ChargeHist> selectChargeHist(String houseDongHo) throws Exception{
		return carCareDAO.selectChargeHist(houseDongHo);
	}
}

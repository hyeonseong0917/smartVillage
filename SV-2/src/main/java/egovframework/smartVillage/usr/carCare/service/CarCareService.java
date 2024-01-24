package egovframework.smartVillage.usr.carCare.service;

import java.util.List;

import egovframework.smartVillage.usr.carCare.entity.CarRegist;
import egovframework.smartVillage.usr.carCare.entity.ChargeHist;
import egovframework.smartVillage.usr.carCare.vo.CarInOutVo;

public interface CarCareService {
	public List<CarRegist> selectCarRegistInfo(String houseDongHo) throws Exception;
	public List<CarInOutVo> selectCarInOutHist(String houseDongHo) throws Exception;
	public List<ChargeHist> selectChargeHist(String houseDongHo) throws Exception;
}

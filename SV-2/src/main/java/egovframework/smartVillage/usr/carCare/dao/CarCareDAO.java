package egovframework.smartVillage.usr.carCare.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.smartVillage.usr.carCare.entity.CarRegist;
import egovframework.smartVillage.usr.carCare.entity.ChargeHist;
import egovframework.smartVillage.usr.carCare.vo.CarInOutVo;


@Repository("carCareDAO")
public class CarCareDAO extends EgovComAbstractDAO {
	public List<CarRegist> selectCarRegistInfo(String houseDongHo) throws Exception {
		return (List<CarRegist>) list("CarCareDAO.selectCarRegistInfo", houseDongHo);
	}
	public List<CarInOutVo> selectCarInOutHist(String houseDongHo) throws Exception {
		return (List<CarInOutVo>) list("CarCareDAO.selectCarInOutHist", houseDongHo);
	}
	public List<ChargeHist> selectChargeHist(String houseDongHo) throws Exception {
		return (List<ChargeHist>) list("CarCareDAO.selectChargeHist", houseDongHo);
	}
}

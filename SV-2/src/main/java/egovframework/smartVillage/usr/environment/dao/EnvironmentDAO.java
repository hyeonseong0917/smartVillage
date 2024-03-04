package egovframework.smartVillage.usr.environment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.smartVillage.usr.environment.vo.InvironmentInfoVO;
import egovframework.smartVillage.usr.environment.vo.InvironmentChartVO;

@Repository("environmentDAO")
public class EnvironmentDAO extends EgovComAbstractDAO {
	public List<InvironmentInfoVO> selectEnvironmentInfo(String attributeType) throws Exception {
		return (List<InvironmentInfoVO>) list("EnvironmentDAO.selectEnvironmentInfo", attributeType);
	}
	public List<InvironmentChartVO> selectEnvironmentUsageChartData(String attributeType) throws Exception{
		return (List<InvironmentChartVO>) list("EnvironmentDAO.selectEnvironmentUsageChartData", attributeType);
	}
}

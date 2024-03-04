package egovframework.smartVillage.usr.environment.service;

import java.util.List;

import egovframework.smartVillage.usr.environment.vo.InvironmentInfoVO;
import egovframework.smartVillage.usr.environment.vo.InvironmentChartVO;

public interface EnvironmentService {
	public List<InvironmentInfoVO> selectEnvironmentInfo(String attributeType) throws Exception;
	public List<InvironmentChartVO> selectEnvironmentUsageChartData(String attributeType) throws Exception;
}

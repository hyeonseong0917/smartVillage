package egovframework.smartVillage.usr.environment.service;

import java.util.List;

import egovframework.smartVillage.usr.environment.vo.InvironmentInfoVO;

public interface EnvironmentService {
	public List<InvironmentInfoVO> selectEnvironmentInfo(String attributeType) throws Exception;
}

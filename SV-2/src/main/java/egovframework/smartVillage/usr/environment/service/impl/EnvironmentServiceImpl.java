package egovframework.smartVillage.usr.environment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.smartVillage.usr.environment.dao.EnvironmentDAO;
import egovframework.smartVillage.usr.environment.service.EnvironmentService;
import egovframework.smartVillage.usr.environment.vo.InvironmentInfoVO;

@Service("environmentService")
public class EnvironmentServiceImpl extends EgovAbstractServiceImpl implements EnvironmentService {

	@Resource(name = "environmentDAO")
	private EnvironmentDAO environmentDAO;
	
	@Override
	public List<InvironmentInfoVO> selectEnvironmentInfo(String attributeType) throws Exception {
		return environmentDAO.selectEnvironmentInfo(attributeType);
	}
}

package egovframework.smartVillage.usr.cctv.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.smartVillage.usr.cctv.dao.CctvDAO;
import egovframework.smartVillage.usr.cctv.service.CctvService;

@Service("cctvService")
public class CctvServiceImpl extends EgovAbstractServiceImpl implements CctvService {

	@Resource(name = "cctvDAO")
	private CctvDAO cctvDAO;
	
	@Override
	public String selectCctvInfo(String cctvId) throws Exception {
		return cctvDAO.selectCctvInfo(cctvId);
	}
}

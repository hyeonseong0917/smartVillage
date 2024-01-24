package egovframework.smartVillage.usr.cctv.dao;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;


@Repository("cctvDAO")
public class CctvDAO extends EgovComAbstractDAO {
	public String selectCctvInfo(String cctvId) throws Exception {
		return (String) select("CctvDAO.selectCctvInfo", cctvId);
	}
}

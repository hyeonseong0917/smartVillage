package egovframework.smartVillage.usr.waterEnergy.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.smartVillage.usr.waterEnergy.service.WaterEnergyService;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 * 수정일수정자 수정내용
 *------- -----------------------------------
 * 2009.3.19이삼섭최초 생성
 * 2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 * 2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *
 * </pre>
 */
@Controller
public class WaterEnergyController {
	
	@Resource(name="waterEnergyService")
	WaterEnergyService waterEnergyService;
	
	/**
	 * XSS 방지 처리.
	 *
	 * @param data
	 * @return
	 */
	protected String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}
		
		String ret = data;
		
		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");
		
		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");
		
		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");
		
		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		
		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		
		return ret;
	}


	/**
	 * 게시물에 대한 목록을 조회한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/smartVillage/waterEnergy/waterEnergyUsage.mdo")
	public String selectUsageInfo(@RequestParam(value = "tabId", defaultValue="water") String tabId, Model model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String viewName = "";
//		System.out.println(tabId); water
//		System.out.println("TAB ID is" + tabId);
		switch(tabId) {
			case "water":
				model.addAttribute("usageInfo", waterEnergyService.selectWaterUsage(user.getAddress()));
				viewName = "egovframework/smartVillage/usr/waterEnergy/water";
				break;
			case "electric":
				model.addAttribute("usageInfo", waterEnergyService.selectElectricUsage(user.getAddress()));
				viewName = "egovframework/smartVillage/usr/waterEnergy/electric";
				break;
			case "heating":
				model.addAttribute("usageInfo", waterEnergyService.selectHeatingUsage(user.getAddress()));
				viewName = "egovframework/smartVillage/usr/waterEnergy/heating";
				break;
			case "cooling":
				model.addAttribute("usageInfo", waterEnergyService.selectCoolingUsage(user.getAddress()));
				viewName= "egovframework/smartVillage/usr/waterEnergy/cooling";
				break;
			case "hotWater":
				model.addAttribute("usageInfo", waterEnergyService.selectHotWaterUsage(user.getAddress()));
				viewName = "egovframework/smartVillage/usr/waterEnergy/hotWater";
				break;
			default:
				model.addAttribute("usageInfo", waterEnergyService.selectWaterUsage(user.getAddress()));
				viewName = "egovframework/smartVillage/usr/waterEnergy/water";
				break;
		}
//		System.out.println(viewName);
		return viewName;
	}
	
	@RequestMapping("/smartVillage/waterEnergy/getChartData.mdo")
	public ModelAndView selectChartData(@RequestParam(value = "tabId", defaultValue="water") String tabId, SessionStatus status) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("jsonView");
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
//		System.out.println("Chart TAB ID is " + tabId);
		switch(tabId) {
			
			case "water":
//				System.out.println(user.getAddress()); 101
				modelAndView.addObject("chartInfo", waterEnergyService.selectWaterUsageChartData(user.getAddress()));
				break;
			case "electric":
				modelAndView.addObject("chartInfo", waterEnergyService.selectElectricUsageChartData(user.getAddress()));
				break;
			case "heating":
//				System.out.println("heat chart");
				modelAndView.addObject("chartInfo", waterEnergyService.selectHeatingUsageChartData(user.getAddress()));
				break;
			case "cooling":
//				System.out.println("cool chart");
				modelAndView.addObject("chartInfo", waterEnergyService.selectCoolingUsageChartData(user.getAddress()));
				break;
			case "hotWater":
//				System.out.println("hot chart");
				modelAndView.addObject("chartInfo", waterEnergyService.selectHotWaterUsageChartData(user.getAddress()));
				break;
			default:
				modelAndView.addObject("chartInfo", waterEnergyService.selectWaterUsageChartData(user.getAddress()));
				break;
		}
		
		return modelAndView;
	}
}

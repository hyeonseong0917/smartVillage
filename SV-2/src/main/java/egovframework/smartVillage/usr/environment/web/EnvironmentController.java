package egovframework.smartVillage.usr.environment.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.smartVillage.usr.environment.service.EnvironmentService;

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
public class EnvironmentController {

	@Resource(name = "environmentService")
	private EnvironmentService environmentService;
	
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
	
	@RequestMapping("/smartVillage/environment/environmentInfo.mdo")
	public String selectEnvironmentInfo(@RequestParam(value = "tabId", defaultValue="fine_dust") String tabId, Model model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String viewName = "";
		model.addAttribute("environmentInfo", environmentService.selectEnvironmentInfo(tabId));
		
		switch(tabId) {
			case "fine_dust":
				viewName = "egovframework/smartVillage/usr/environment/fineDust";
				break;
			case "ultra_particles":
				viewName = "egovframework/smartVillage/usr/environment/ultraParticles";
				break;
			case "noise_pollution":
				viewName = "egovframework/smartVillage/usr/environment/noisePollution";
				break;
			case "humidity":
				viewName = "egovframework/smartVillage/usr/environment/humidity";
				break;
			case "temperature":
				viewName = "egovframework/smartVillage/usr/environment/temperature";
				break;
			case "ilumination":
				viewName = "egovframework/smartVillage/usr/environment/ilumination";
				break;
			default:
				viewName = "egovframework/smartVillage/usr/environment/fineDust";
				break;
		}
		
		return viewName;
	}
	@RequestMapping("/smartVillage/environment/getChartData.mdo")
	public ModelAndView selectEnvironmentChartInfo(@RequestParam(value = "tabId", defaultValue="fine_dust") String tabId, SessionStatus status) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("jsonView");
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		modelAndView.addObject("environmentChartInfo", environmentService.selectEnvironmentUsageChartData(tabId));
		return modelAndView;
	}
}

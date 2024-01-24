package egovframework.smartVillage.common.web;

import java.io.Serializable;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.Globals;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;

@Controller
public class CommonController implements Serializable{
	
	private static final long serialVersionUID = 1L;

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;
	
	@Resource(name = "mberManageService")
	private EgovMberManageService mberManageService;
	
	@Resource(name = "userManageService")
	private EgovUserManageService userManageService;


	/** EgovMessageSource */
	@Resource(name="egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value="/")
	
	public String mainView() throws Exception {
		
		return "egovframework/smartVillage/common/main";
	}
	
	@RequestMapping(value="/smartVillage/signInView.mdo")
	public String signInView(@ModelAttribute("mberManageVO") MberManageVO mberManageVO)throws Exception {
		return "egovframework/smartVillage/common/signIn";
	}
	
	@RequestMapping("/smartVillage/signIn.mdo")
	public String insertMber(HttpServletRequest request, @ModelAttribute("entrprsManageVO") MberManageVO mberManageVO, BindingResult bindingResult, Model model) throws Exception {
		if (bindingResult.hasErrors()) {
			return "egovframework/smartVillage/common/signIn";
		} else {
			mberManageService.insertMber(mberManageVO);
			//Exception 없이 진행시 등록 성공메시지
			request.setAttribute("message", "정상적으로 등록되었습니다.\n계정은 관리자 승인 후 사용가능 합니다");
		}
		return "forward:/smartVillage/loginView.mdo";
	}

	@ResponseBody
	@RequestMapping(value = "/smartVillage/duplicationCheck.mdo")
	public String checkIdDplct(@RequestParam(required = false) String id) throws Exception {
		int usedCnt = userManageService.checkIdDplct(id);
		if(usedCnt == 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@IncludedMblInfo(name="모바일 Login",order = 300 ,gid = 30)
	@RequestMapping(value="/smartVillage/loginView.mdo")
	public String loginView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {
		model.addAttribute("message", request.getAttribute("message"));
		return "egovframework/smartVillage/common/login";
	}

/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value="/smartVillage/login.mdo")
	public String login(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			ModelMap model)
			throws Exception {


		
		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);
		
		
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
		
			// 2-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);
		
				return "redirect:/smartVillage/main.mdo";
		
		} else {
		
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "egovframework/smartVillage/common/login";
		}
	}

	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value="/smartVillage/main.mdo")
	public String main(ModelMap model, HttpServletRequest request)
			throws Exception {

		// 3. 메인 페이지 이동
		String main_page = Globals.SMART_VILLAGE_MAIN_PAGE;

		LOGGER.debug("Globals.SMART_VILLAGE_MAIN_PAGE > {}", Globals.SMART_VILLAGE_MAIN_PAGE);
		LOGGER.debug("main_page_Mobile > {}", main_page);

		if (main_page.startsWith("/")) {

			return "forward:" + main_page;

		} else {
			
		return main_page;

		}
	}

	@RequestMapping(value="/smartVillage/logout.do")
		public String actionLogout(HttpServletRequest request, ModelMap model)
				throws Exception {
	
		/*String userIp = EgovClntInfo.getClntIP(request);
	
		// 1. Security 연동
		return "redirect:/j_spring_security_logout";*/
	
		request.getSession().setAttribute("loginVO", null);
	
	
		return "redirect:/";
	}
}
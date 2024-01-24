package egovframework.mbl.com.uat.uia.web;

import java.io.Serializable;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 컨트롤러 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *
 *  </pre>
 */
@Controller
public class EgovMblLoginController implements Serializable{

	private static final long serialVersionUID = 1L;

	/** EgovLoginService */
	@Resource(name = "loginService")
    private EgovLoginService loginService;


	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	/** log */
    private static final Logger LOGGER = LoggerFactory.getLogger(EgovMblLoginController.class);

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @IncludedMblInfo(name="모바일 Login",order = 300 ,gid = 30)
    @RequestMapping(value="/uat/uia/egovLoginUsr.mdo")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
			throws Exception {

    	return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
	}

    /**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
    @RequestMapping(value="/uat/uia/actionLogin.mdo")
    public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO,
    		                   HttpServletRequest request,
    		                   ModelMap model)
            throws Exception {



    	// 1. 일반 로그인 처리
        LoginVO resultVO = loginService.actionLogin(loginVO);


        if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

        	// 2-1. 로그인 정보를 세션에 저장
        	request.getSession().setAttribute("loginVO", resultVO);

    		return "redirect:/uat/uia/actionMain.mdo";

        } else {

        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
        }
    }
    
    /**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value="/uat/uia/actionMain.mdo")
	public String actionMain(ModelMap model, HttpServletRequest request)
			throws Exception {

    	// 1. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
    	}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		// 3. 메인 페이지 이동
		String main_page = Globals.MAIN_PAGE;

		LOGGER.debug("Globals.MAIN_PAGE > {}", Globals.MAIN_PAGE);
		LOGGER.debug("main_page_Mobile > {}", main_page);

		if (main_page.startsWith("/")) {

			return "forward:" + main_page;

		} else {

		    return main_page;

		}
	}
    /**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @SuppressWarnings("unused")
	@RequestMapping(value="/uat/uia/actionMainPC.mdo")
	public String actionMainPC(ModelMap model, HttpServletRequest request)
			throws Exception {

    	// 1. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/mbl/com/uat/uia/EgovLoginUsr";
    	}
    	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		// 3. 메인 페이지 이동
		String main_page = Globals.MAIN_PAGE;

		LOGGER.debug("Globals.MAIN_PAGE > {}", Globals.MAIN_PAGE);
		LOGGER.debug("main_page_Mobile > {}", main_page);

		// 4. 접속 기기에 따라서 모바일용/일반웹용 처음 페이지를 다르게 호출한다.
    	String userAgent = request.getHeader("user-agent");
    	// Window에서 접속할 경우 PC버젼 홈으로 이동한다.
    	if(userAgent.contains("Windows NT")){
    		LOGGER.debug("main_page_PC > {}", main_page);
    		//main_page = "/sym/mnu/mpm/EgovMainMenuHome.do";
    		main_page = "/index.do";
    	}


		if (main_page.startsWith("/")) {
			return "forward:" + main_page;
		} else {
		    return main_page;
		}
	}
    
    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/mbl/com/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model)
			throws Exception {

    	request.getSession().setAttribute("loginVO", null);


    	return "redirect:" + request.getRequestURI();
    }

}
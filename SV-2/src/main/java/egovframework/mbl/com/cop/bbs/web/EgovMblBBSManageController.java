package egovframework.mbl.com.cop.bbs.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardMaster;
import egovframework.com.cop.bbs.service.BoardMasterVO;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.mbl.com.cmm.annotation.IncludedMblInfo;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2009.06.29	한성곤			2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.07.01 안민정		 	댓글, 스크랩, 만족도 조사 기능의 종속성 제거
 *
 * </pre>
 */
@Controller
public class EgovMblBBSManageController {

    @Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Autowired
    private DefaultBeanValidator beanValidator;

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

    /** 첫 화면 공지게시판 링크를 위한 더미 메소드 */
    @IncludedMblInfo(name="공지게시판",order = 102 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000003")
    public void noticeBoard() {}

    /** 첫 화면 유효게시판 링크를 위한 더미 메소드 */
    @IncludedMblInfo(name="유효게시판",order = 103 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000004")
    public void effectiveBoard() {}


    /**
     * 게시물에 대한 목록을 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @IncludedMblInfo(name="일반게시판",order = 100 ,gid = 10, listUrl = "/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000001")
    @RequestMapping("/cop/bbs/selectBoardList.mdo")
    public String selectBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		boardVO.setBbsId(boardVO.getBbsId());
	
		BoardMasterVO vo = new BoardMasterVO();
	
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
	
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));
	
		PaginationInfo paginationInfo = new PaginationInfo();
	
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(1);
	
		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO);//2011.09.07
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
	
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("paginationInfo", paginationInfo);
	
		return "egovframework/mbl/com/cop/bbs/EgovNoticeList";
    }


    /**
     * 게시물에 대한 상세 정보를 조회한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/selectBoardArticle.mdo")
    public String selectBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);
	
		//---------------------------------
		// 2009.06.29 : 2단계 기능 추가
		//---------------------------------
		if (!boardVO.getSubPageIndex().equals("")) {
		    boardVO.setPlusCount(false);
		}
		////-------------------------------
	
		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
	
		model.addAttribute("result", vo);
	
		model.addAttribute("sessionUniqId", user.getUniqId());
		
		return "egovframework/mbl/com/cop/bbs/EgovNoticeInqire";
    }

    /**
     *
     *
     * 게시물 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addBoardArticle.mdo")
    public String addBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		model.addAttribute("boardVO", boardVO);
		////-----------------------------
	
		return "egovframework/mbl/com/cop/bbs/EgovNoticeRegist";
    }

    /**
     * 게시물을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unused")
	@RequestMapping("/cop/bbs/insertBoardArticle.mdo")
    public String insertBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, SessionStatus status,
	    ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("boardVO", boardVO);
	
		    return "egovframework/mbl/com/cop/bbs/EgovNoticeRegist";
		}
		
	    board.setFrstRegisterId(user.getUniqId());
	    board.setBbsId(board.getBbsId());

	    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지

	    bbsMngService.insertBoardArticle(board);
		return "redirect:/cop/bbs/selectBoardList.mdo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardVO
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/addReplyBoardArticle.mdo")
    public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		BoardMasterVO vo = new BoardMasterVO();
	
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		model.addAttribute("result", boardVO);
		////-----------------------------
	
		return "egovframework/mbl/com/cop/bbs/EgovNoticeReply";
    }

    /**
     * 게시물에 대한 답변을 등록한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/replyBoardArticle.mdo")
    public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
		    model.addAttribute("result", boardVO);
		    return "egovframework/mbl/com/cop/bbs/EgovNoticeReply";
		}
	
		if (isAuthenticated) {
		    board.setReplyAt("Y");
		    board.setFrstRegisterId(user.getUniqId());
		    board.setBbsId(board.getBbsId());
//		    board.setParnts(Long.toString(boardVO.getNttId()));
		    board.setParnts(boardVO.getNttId());
//		    board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));
		    board.setReplyLc((boardVO.getReplyLc() + 1));
		    System.out.println(boardVO.getReplyLc());
//		    board.setReplyLc((boardVO.getReplyLc()));
	
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
	
		    bbsMngService.insertBoardArticle(board);
		}
	
		return "redirect:/cop/bbs/selectBoardList.mdo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물 수정을 위한 수정페이지로 이동한다.
     *
     * @param boardVO
     * @param vo
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/forUpdateBoardArticle.mdo")
    public String selectBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	    throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		boardVO.setFrstRegisterId(user.getUniqId());
		
		BoardVO bdvo = new BoardVO();
	
		vo.setBbsId(boardVO.getBbsId());
	
		if (isAuthenticated) {
		    bdvo = bbsMngService.selectBoardArticle(boardVO);
		}
	
		model.addAttribute("result", bdvo);
	
		return "egovframework/mbl/com/cop/bbs/EgovNoticeUpdt";
    }

    /**
     * 게시물에 대한 내용을 수정한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/updateBoardArticle.mdo")
    public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model,
	    SessionStatus status) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
	
		    boardVO.setFrstRegisterId(user.getUniqId());
		    
		    BoardVO bdvo = new BoardVO();
		    bdvo = bbsMngService.selectBoardArticle(boardVO);
	
		    model.addAttribute("result", bdvo);
	
		    return "egovframework/mbl/com/cop/bbs/EgovNoticeUpdt";
		}
	
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
	
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
	
		    bbsMngService.updateBoardArticle(board);
		}
	
		return "redirect:/cop/bbs/selectBoardList.mdo?bbsId="+board.getBbsId();
    }

    /**
     * 게시물에 대한 내용을 삭제한다.
     *
     * @param boardVO
     * @param board
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cop/bbs/deleteBoardArticle.mdo")
    public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board,
	    @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	
		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
	
		    bbsMngService.deleteBoardArticle(board);
		}
	
		return "redirect:/cop/bbs/selectBoardList.mdo?bbsId="+board.getBbsId();
    }
}

package egovframework.com.cop.bbs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;
import egovframework.com.cop.bbs.service.EgovBBSManageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 게시물 관리를 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일     	수정자           수정내용
 *  -----------    --------    ---------------------------
 *   2009.03.19  	이삼섭          최초 생성
 *	 2011.09.22 	서준식          nttId IdGen 서비스로 변경
 *	 2014.02.21		이기하          답글에 대한 nttId 생성
 * </pre>
 */
@Service("EgovBBSManageService")
public class EgovBBSManageServiceImpl extends EgovAbstractServiceImpl implements EgovBBSManageService {

    @Resource(name = "BBSManageDAO")
    private BBSManageDAO bbsMngDAO;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @see egovframework.smartVillage.usr.board.service.brd.service.EgovBBSManageService#deleteBoardArticle(egovframework.smartVillage.usr.board.service.brd.service.Board)
     */
    public void deleteBoardArticle(Board board) throws Exception {

	board.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

	bbsMngDAO.deleteBoardArticle(board);
    }

    /**
     * 게시판에 게시물 또는 답변 게시물을 등록 한다.
     *
     * @see egovframework.smartVillage.usr.board.service.brd.service.EgovBBSManageService#insertBoardArticle(egovframework.smartVillage.usr.board.service.brd.service.Board)
     */
    public void insertBoardArticle(Board board) throws Exception {
	// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

	if ("Y".equals(board.getReplyAt())) {
	    // 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록, 3.nttNo는 현재 게시판의 순서대로
	    // replyLc는 부모글의 ReplyLc + 1
	    bbsMngDAO.replyBoardArticle(board);

	} else {
	    // 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
	    board.setParnts("0");
	    board.setReplyLc("0");
	    board.setReplyAt("N");

	    bbsMngDAO.insertBoardArticle(board);
	}
    }

	/**
     * 게시물 대하여 상세 내용을 조회 한다.
     *
     * @see egovframework.smartVillage.usr.board.service.brd.service.EgovBBSManageService#selectBoardArticle(egovframework.smartVillage.usr.board.service.brd.service.BoardVO)
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
	if (boardVO.isPlusCount()) {
	    int iniqireCo = bbsMngDAO.selectMaxInqireCo(boardVO);

	    boardVO.setInqireCo(iniqireCo);
	    bbsMngDAO.updateInqireCo(boardVO);
	}

	return bbsMngDAO.selectBoardArticle(boardVO);
    }

	/**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @see egovframework.smartVillage.usr.board.service.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.smartVillage.usr.board.service.brd.service.BoardVO)
     */
    public Map<String, Object> selectBoardArticles(BoardVO boardVO) throws Exception {
		List<BoardVO> list = bbsMngDAO.selectBoardArticleList(boardVO);
		List<BoardVO> result = new ArrayList<BoardVO>();
	
	    BoardVO vo;
	    Iterator<BoardVO> iter = list.iterator();
	    while (iter.hasNext()) {
			vo = (BoardVO)iter.next();
			result.add(vo);
	    }
	
		int cnt = bbsMngDAO.selectBoardArticleListCnt(boardVO);
	
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));
	
		return map;
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @see egovframework.smartVillage.usr.board.service.brd.service.EgovBBSManageService#updateBoardArticle(egovframework.smartVillage.usr.board.service.brd.service.Board)
     */
    public void updateBoardArticle(Board board) throws Exception {
	bbsMngDAO.updateBoardArticle(board);
    }
}

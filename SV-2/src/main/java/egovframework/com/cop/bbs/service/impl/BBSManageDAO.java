package egovframework.com.cop.bbs.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.bbs.service.Board;
import egovframework.com.cop.bbs.service.BoardVO;

/**
 * 게시물 관리를 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.19  이삼섭          최초 생성
 *   2011.09.22 서준식          nttId IdGen 서비스로 변경
 * </pre>
 */
@Repository("BBSManageDAO")
public class BBSManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판에 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void insertBoardArticle(Board board) throws Exception {
	//long nttId = (Long)select("BBSManageDAO.selectMaxNttId");//2011.09.22
	//board.setNttId(nttId);//2011.09.22
	insert("BBSManageDAO.insertBoardArticle", board);
    }

    /**
     * 게시판에 답변 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public long replyBoardArticle(Board board) throws Exception {
	long nttId = (Long)select("BBSManageDAO.selectMaxNttId");
	board.setNttId(nttId);
	insert("BBSManageDAO.replyBoardArticle", board);

	//----------------------------------------------------------
	// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
	//----------------------------------------------------------
	//String parentId = board.getParnts();
	long nttNo = (Long)select("BBSManageDAO.getParentNttNo", board);

	board.setNttNo(nttNo);
	update("BBSManageDAO.updateOtherNttNo", board);

	board.setNttNo(nttNo + 1);
	update("BBSManageDAO.updateNttNo", board);

	return nttId;
    }
	
    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
	return (BoardVO)select("BBSManageDAO.selectBoardArticle", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectBoardArticleListCnt(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManageDAO.selectBoardArticleListCnt", boardVO);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateBoardArticle(Board board) throws Exception {
	update("BBSManageDAO.updateBoardArticle", board);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void deleteBoardArticle(Board board) throws Exception {
	update("BBSManageDAO.deleteBoardArticle", board);
    }

    /**
     * 게시물에 대한 조회 건수를 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateInqireCo(BoardVO boardVO) throws Exception {
	update("BBSManageDAO.updateInqireCo", boardVO);
    }

    /**
     * 게시물에 대한 현재 조회 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectMaxInqireCo(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManageDAO.selectMaxInqireCo", boardVO);
    }
}

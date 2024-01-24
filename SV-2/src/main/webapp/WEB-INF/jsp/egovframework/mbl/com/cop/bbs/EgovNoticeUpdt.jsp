<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html> 
<html> 
    <head>
    <title>EgovFrame 모바일게시판</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	    
    
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/EgovCom.js"></script>
		<!-- datebox  import-->        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/datepicker/jqm-datebox.css"/>

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.core.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.calbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.datebox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jqm-datebox.mode.flipbox.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"></script> 

		<script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
        <validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
        
		<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/cop/bbs/EgovBBSMng.js" ></script>
        
		<script type="text/javascript">
			function fn_egov_regist_notice(){
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/updateBoardArticle.mdo";
				document.board.submit();
			}
			
			function fn_egov_select_noticeList() {
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.board.submit();	
			}
			

			//상세조회
			function fn_egov_inqire_notice(nttId, bbsId) {
				document.board.nttId.value = nttId;
				document.board.bbsId.value = bbsId;
				document.board.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardArticle.mdo";
				document.board.submit();			
			}	
			function fn_showList() {
			
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.board.submit();
				
			}
		</script>
    </head>

<body>

    <!-- 메인 페이지 -->
    <div data-role="page" id="NoticeInire" data-url="page_main" >

		<form name="board" method="post" action=""  enctype="multipart/form-data">
		
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
			<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" >
			<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
			<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
			<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
			<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
			<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
			<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
			
			<div data-role="header">
				<a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>');" data-icon="arrow-l">뒤로</a>
			<h1>게시글 수정</h1> 	
		</div>
			
	        <div data-role="content" class="com-ussContent">
	        
				<div data-role="fieldcontain" data-inline="true">
					<div class="uss-regist" data-inline="true">
						<label for="nttSj"><strong>제목</strong></label><br>
		        		<input name="nttSj"  type="text" id="name" maxlength="20"  size="20"  value="<c:out value='${result.nttSj}'/>"  >
					</div>
					<div class="uss-regist" data-inline="true">
						<label for="nttCn"><strong>글내용</strong></label><br>
			        	<textarea cols="40" rows="40" name="nttCn" id="nttCn"class="com-textContents"><c:out value="${result.nttCn}" escapeXml="false"/></textarea>
					</div>
				</div>
	            <!-- <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/> -->
	            <!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping java에서 -->
	            <!-- <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/> -->
				
				<input type="hidden" name="cal_url" value="${pageContext.request.contextPath}/sym/cmm/EgovNormalCalPopup.do"/>
				
				<div class="ui-grid-a uss-clear">	
					<div class="ui-block-a"><a href="javascript:fn_egov_regist_notice();" data-role="button" data-theme="b">수정</a></div>
					<div class="ui-block-b"><a href='javascript:fn_showList();' data-role="button" data-theme="b">목록</a></div>
				</div>	
	        </div>
	    
	    </form>
</div>	
	
</body>

</html>
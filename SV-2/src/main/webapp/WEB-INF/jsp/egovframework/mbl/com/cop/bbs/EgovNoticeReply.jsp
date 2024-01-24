<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!-- 장규완 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  
<!-- 완료 -->
 
<!DOCTYPE html> 
<html> 
    <head>
    <c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000001'}">
		<title>취미생활</title>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000002'}">
		<title>고장신고</title>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
		<title>공지사항</title>
	</c:if>
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
			<!--
			function fn_egov_validateForm(obj) {
				return true;
			}

			function fn_egov_regist_notice() {
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/replyBoardArticle.mdo";
				document.board.submit();
			}
			function fn_egov_select_noticeList() {
			
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.board.submit();
				
			}
			//-->
			</script>
</head>

<body>
<!-- 메인 페이지 -->

<div data-role="page" id="page_main" data-url="page_main"   class="ui-page ui-body-c ui-page-active" >

			<!-- 장규완 추가. submit 전달항목 -->
			<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="replyAt" value="Y"/>
				<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>"/>
				<input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>"/>
				<input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>"/>
				<input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>"/>
				
				<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"/>
				
				<input type="hidden" name="cal_url" value="${pageContext.request.contextPath}/sym/cmm/EgovNormalCalPopup.do"/>
				
				<div data-role="header" data-theme="a">
					<a href="javascript:fn_egov_select_noticeList();" data-icon="arrow-l">뒤로</a>
					<h1>답글 쓰기</h1> 
				</div>
		
				<div data-role="content" class="com-ussContent">
					<form name="board">
						<div data-role="fieldcontain" data-inline="true">
						<div class="uss-regist" data-inline="true">
							<label for="nttSj"><strong>제목</strong></label><br>
			        		<input name="nttSj" id="name" type="text" maxlength="20" maxlength="20" placeholder="제목을 입력해주세요."  value="">
						</div>
						<div class="uss-regist" data-inline="true">
							<label for="nttCn"><strong>글내용</strong></label><br>
				        	<textarea cols="40" rows="40" name="nttCn" id="nttCn" placeholder="글내용을 입력해주세요."></textarea>
						</div>
					</div>
						<fieldset class="ui-grid-a">			
						<div class="ui-block-a">
						    <input type="button" value="등록" onclick="fn_egov_regist_notice()" data-icon="plus" data-theme="b" >
						</div>
						<div class="ui-block-b">  
							<input type="reset" value="초기화" data-theme="b" data-icon="refresh"/>
					     </div>
						</fieldset>
									 
					</form>
				</div>
		</form:form>
	</div>	
</body>
</html>
		
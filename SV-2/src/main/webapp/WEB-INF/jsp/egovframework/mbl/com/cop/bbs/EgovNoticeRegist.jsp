<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  


 
<!DOCTYPE html> 
<html>  
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        	
    <c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000001'}">
		<title>취미생활</title>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000002'}">
		<title>고장신고</title>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
		<title>공지사항</title>
	</c:if>

   	<!-- eGovFrame Common import -->
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	

      <script type="text/javascript">
		_editor_area = "nttCn";
		_editor_url = "${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/htmlarea3.0/";
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js"></script>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/com/cop/bbs/EgovBBSMng.js" ></script>
	<script type="text/javascript">

			function fn_showList() {
				var bbsId = document.board.bbsId.value;
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.board.submit();
				
			}
			function fn_egov_regist_notice() {
				if (!validateBoard(document.board)){
					return;
				}
				var bbsId = document.board.bbsId.value;
				document.board.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/insertBoardArticle.mdo";
				document.board.submit();
			}

      </script>
</head>

<body>

<!--등록 페이지 -->
<div data-role="page" id="Add_Page">
	<div data-role="header">
		<a href="javascript:fn_showList();" data-icon="arrow-l">뒤로</a>
		<h1>게시글 쓰기</h1> 
	</div>
<form:form commandName="board" name="board" method="post" enctype="multipart/form-data">
					
	<div data-role="content" class="com-ussContent">
		<div data-inline="true">
			<div class="uss-regist" data-inline="true">
				<label for="nttSj"><strong>제목</strong></label>
        		<input name="nttSj" id="name"  type="text" maxlength="20"  size="20" placeholder="제목을 입력해주세요." >
			</div>
			<div class="uss-regist" data-inline="true">
				<label for="nttCn"><strong>글내용</strong></label>
	        	<textarea cols="40" rows="40" name="nttCn" id="nttCn" placeholder="글내용을 입력해주세요." class="com-textContents"></textarea>
			</div>
        <!-- 
        <div data-role="navbar" data-iconpos="top">
            <ul>
                <li><a href="fn_egov_regist_notice()" data-theme="b" data-icon="plus" class="ui-btn-active ui-state-persist" data-ajax="false">등록</a></li>
                <li><a href="#page1" data-theme="c" data-icon="refresh">초기화</a></li>
            </ul>
        </div>
         -->
		 
		<div class="ui-grid-a addBgBtn">
			<div class="ui-block-a">
                <input type="button" value="등록" onclick="fn_egov_regist_notice()" data-icon="plus" data-theme="b" data-ajax="false" >
			</div>
			<div class="ui-block-b">
                <input type="reset" value="초기화" data-theme="b" data-icon="refresh"/>
			</div>
		</div>
		
		
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping java에서 -->
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
		
		<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
		<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
			
		<!-- <input type="hidden" name="cal_url" value="${pageContext.request.contextPath}/sym/cmm/EgovNormalCalPopup.do"/>  -->
		</div>
		
	</div>
</form:form>
</div>	
</body>
</html>

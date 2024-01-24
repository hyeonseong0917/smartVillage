<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  

 
<!DOCTYPE html> 
<html> 
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

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

	<script type="text/javaScript" language="javascript">
		<!--


		$(document).on('pagehide', "#view", function(){ $(this).remove(); });	
		
		
		function fn_egov_regist(bbsId) {
			document.frm.nttId.value = document.frm.nttId.value;
			document.frm.bbsId.value = bbsId;
			document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/addBoardArticle.mdo";
			document.frm.submit();		
		}
	
		function press(event) {
			if (event.keyCode==13) {
				fn_egov_select_noticeList('0');
			}
		}
	
		function fn_egov_select_noticeList(pageNo) {

			if(document.frm.pageIndex.value == pageNo) {
				return;
			} 

			document.frm.pageIndex.value = pageNo == 0 ? 1 : pageNo;

			document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
			document.frm.submit();	
		}
	
		//상세조회
		function fn_egov_inqire_notice(nttId, bbsId) {
			document.frm.nttId.value = nttId;
			document.frm.bbsId.value = bbsId;
			document.frm.action =  "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardArticle.mdo";
			document.frm.submit();			
		}	
		-->
	</script>
</head>

<body>
<!-- 메인 페이지 -->

<div data-role="page" id="list">

	<!-- header start -->
	<div data-role="header">
		<a href="${pageContext.request.contextPath}/uat/uia/actionMain.mdo" data-icon="arrow-l" rel="external">뒤로</a>
		<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000001'}">
			<h1 class="bodLogo">취미생활</h1>
		</c:if>
		<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000002'}">
			<h1 class="bodLogo">고장신고</h1>
		</c:if>
		<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
			<h1 class="bodLogo">공지사항</h1>
		</c:if>
		<!--<a href="#Add_Page"  data-icon="plus">등록</a> -->
		<a href="javascript:fn_egov_regist('<c:out value="${boardVO.bbsId}"/>')" data-icon="plus">등록</a>
	</div>

	<!-- header end -->
			
			
	<!-- contents start -->
    <div data-role="content">
    	<!-- 장규완 추가. submit 전달항목 -->
		<form id="frm" name="frm" method="post" data-role="none">
			<div id="searchview">
				<div class="uss-Search">
					<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
					<input type="hidden" name="nttId"  value="0"/>
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
					   <select id="searchCnd" name="searchCnd" title="검색조건 선택"  data-role="none">
		              		<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
						   <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>			   
						   <c:choose>
							  	<c:when test="${anonymous != 'true'}"> 
									<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
							  	</c:when>
							</c:choose>	   
						</select>
		              	<div class="uss-SearchBox">
		                <input type="text" name="searchWrd" id="searchWrd" class="type-text" value="${searchVO.searchWrd }" data-role="none"  onkeypress="press(event);"/>
					</div>
		            <input type="button" name="btnSearch" id="btnSearch" value="조회" onclick="javascript:fn_egov_select_noticeList('0');" class="uss-SearchBtn" data-role="none"/>
				</div>
			</div>
		</form>
		
		<ul data-role="listview">
					<c:choose>
						<c:when test="${empty resultList}">
							<li class="com-egovNodata">
		               			<spring:message code="common.nodata.msg"/>
		               		</li>			
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${resultList}">
								 	<c:choose>
						    		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
						    		<li>
						    			<h3>
						    				<c:out value="${result.nttSj}"/>
						    			</h3>
									</li>
						    		</c:when>
						    		<c:otherwise>
									<li>
										<a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')" data-transition="slide">
											<h3><c:if test="${result.replyLc!=0}">
									    		<c:forEach begin="0" end="${result.replyLc}" step="1">
									    		</c:forEach>
								    			<span><img src="${pageContext.request.contextPath}/images/egovframework/com/cmm/icon/reply_arrow.gif" alt=""/></span>
									    		</c:if>
									            <c:out value="${result.nttSj}"/>
											</h3>
											<span class="ui-li-count">${result.inqireCo}</span>
											<p>
												<span class="uss-txtDate">${result.frstRegisterPnttm }</span>
												<!-- <span class="uss-txtBlack">${qnaManage.wrterNm }</span><span class="uss-txtDate">${qnaManage.writngDe }</span> -->
											</p>
										</a>
									</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>					
						</c:otherwise>
					</c:choose>
					
				</ul>
	
		<!-- 잠시적으로 bbsId=BBSMSTR_000000000550 mappping -->
			<div id="pageNavi" class="com-egovPaging">
			<ui:pagination paginationInfo="${paginationInfo}" type="mblImage" jsFunction="fn_egov_select_noticeList"/>
				
			</div>
		
    </div>
	<!-- contents end -->
			

</div>

</body>
</html>

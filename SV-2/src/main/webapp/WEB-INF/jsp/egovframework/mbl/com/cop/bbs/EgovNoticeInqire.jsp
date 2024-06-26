<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html>
<html> 
<head>
    <title>글조회</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>		  
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/com/EgovCom.js"></script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
		<validator:javascript formName="comment" staticJavascript="false" xhtml="true" cdata="false"/>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/com/cop/bbs/EgovBBSMng.js"></script>
		<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
		 
		<script type="text/javascript">
			
			function fn_egov_select_noticeList() {
				document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.frm.submit();	
			}
			
			function fn_egov_delete_notice() {
				jConfirm('삭제하시겠습니까?', '알림', 'a', function(r) {
					if(r){
					document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/deleteBoardArticle.mdo";
					document.frm.submit();
					 }
				});		
			}
			
			function fn_egov_moveUpdt_notice() {
					document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/forUpdateBoardArticle.mdo";
					document.frm.submit();	
			}
			
			function fn_egov_addReply() {
				document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/addReplyBoardArticle.mdo";
				document.frm.submit();
				
			}
		
				function onloading() {
					if ("<c:out value='${msg}'/>" != "") {
						alert("<c:out value='${msg}'/>");
					}
				}

				function fn_egov_selectCommentForupdt2(commentNo, wrterNm, frstRegisterNm, commentCn, update) {
		
					if("" == wrterNm){
						document.comment.wrterNm.value = frstRegisterNm;
					}else{
						document.comment.wrterNm.value = wrterNm;
					}
					document.comment.commentNo.value = commentNo;
					document.comment.commentCn.value = commentCn;					
					document.location.href="#ReplayPage"
				}

				function fn_egov_insertComment() {
		
						
					<c:if test="${anonymous == 'true'}">
						document.comment.wrterNm.value = "";
					</c:if>
					document.comment.commentNo.value = "";
					document.comment.commentCn.value = "";
					document.location.href="#ReplayPage"

				}				

			function fn_egov_reset(){
				document.comment.reset();
			}	
				
			function fn_showList() {
			
				document.frm.action = "${pageContext.request.contextPath}/cop/bbs${prefix}/selectBoardList.mdo";
				document.frm.submit();
				
			}
			function init()
			{
				var message = "${msg}";
				var subMsg = "${subMsg}";
				if (message != "") {
					jAlert(message,'알림', 'a');
					message = ""; 
				}
				if (subMsg != ""){
					jAlert(subMsg,'알림', 'a');
				}
			}
			
		</script>
		<!-- 2009.06.29 : 2단계 기능 추가  -->
		<c:if test="${useScrap == 'true'}">
		<script type="text/javascript">
			function fn_egov_addScrap() {
				document.frm.action = "${pageContext.request.contextPath}/cop/scp/addScrap.mdo";
				document.frm.submit();			
			}
		</script>
		</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->

</head>

<body onload="init()">

<form name="frm" method="post" action="">

						
<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"> 
<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>"> 
<input type="hidden" name="frstRegisterNm" value="<c:out value='${result.frstRegisterNm}'/>"> 
<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>">
<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>"> 
<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>">
<input type="hidden" name="nttSj" 	value="<c:out value='${result.nttSj}'/>">
<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
</form>

<!-- 메인 페이지 -->
<div data-role="page" id="NoticeInire" data-url="page_main" >

	<!-- header start -->
	<div data-role="header">
		<a href="javascript:fn_showList();" data-icon="arrow-l">뒤로</a>
		<h1>게시글 상세보기</h1> 
	</div>
	<!-- header end -->
	
	
	<!-- contents start -->

	<div data-role="content" class="com-copContent">
		<div class="com-notSubject">
			<span><label for="name-d"><strong><c:out value="${result.nttSj}"/></strong></label></span>
		</div>
		
		<div class="com-notDaNahit">
			<span>
			<label for="name-d">
				<c:out value="${result.frstRegisterNm}"/>
			</label>
			</span>
			<span class="line">|</span>
			<span><label for="name-d"><c:out value="${result.frstRegisterPnttm}"/></label></span>
			<span class="line">|</span>
			<span class="coHit"><label for="name-d"><c:out value="${result.inqireCo}"/></label></span>
			
		</div>

		<div class="com-notViewContents">
			<span><label for="name-d"><c:out value="${fn:replace(result.nttCn , crlf , '<br>')}"  escapeXml="false"/></label></span>    
		</div>
		<div class="com-egovBtnAdd">
			<!-- 답글 --> 
			<a href="javascript:fn_egov_addReply()" data-role="none" class="com-egovBtn1">답글</a>
		</div>
	
		<div class="ui-grid-b">
			<div class="ui-block-a"><a href="javascript:fn_egov_moveUpdt_notice()" data-role="button" data-theme="b" data-ajax="false">수정</a></div>
			<div class="ui-block-b"><a href="javascript:fn_egov_delete_notice()" data-role="button" data-theme="b">삭제</a></div>
			<div class="ui-block-c"><a href="javascript:fn_egov_select_noticeList()" data-role="button" data-theme="b">목록</a></div>
		</div>
		
		</div>

	<!-- contents end -->
   

</div>

	<!--**********************
	    ** 댓글 등록 페이지 **
	    ***********************-->
	<div data-role="page" id="ReplayPage">
		<div data-role="header">
			<a href="#"  data-rel="back" data-icon="arrow-l">뒤로</a>
			<h1>댓글 쓰기</h1>
		</div>
		<div data-role="content" class="com-ussContent">
			<form:form commandName="comment" name="comment" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="replyAt" value="Y"/>
				<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>"/>
				<input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>"/>
				<input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>"/>
				<input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>"/>
				<input type="hidden" name="bbsId" value="<c:out value='${searchVO.bbsId}'/>"/>
				<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>"/>
				<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>"/>
				<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>"/>
				<!-- <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>"/> -->
				<!-- <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>"/> -->
				<!-- <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>"/> -->
				<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>"/>
				<input type="hidden" name="cal_url" value="${pageContext.request.contextPath}/sym/cmm/EgovNormalCalPopup.do"/>
				<input name="status" type="hidden" value="insert">
				<input name="commentNo" type="hidden" value="">
				
				<div data-role="fieldcontain" data-inline="true">
					<div class="uss-regist" data-inline="true">
						<label for="commentCn">댓글</label><br>
					<textarea cols="40" rows="8" name="commentCn" id="commentCn" value="<c:out value='${searchVO.nttSj}'/>" class="com-textContents"></textarea>
					</div>
					<div class="uss-regist" data-inline="true">
						<label for="wrterNm">작성자</label><br>
						<input type="text" maxlength="20" name="wrterNm" id="wrterNm" value="<c:out value='${wrterNm}'/>"/>
					</div>
				</div>
		
				<fieldset class="ui-grid-a addBgBtn">
					<div class="ui-block-a">
		            	<a href="javascript:fn_egov_regist_comment()" data-role="button" data-theme="b" data-icon="plus">저장</a>
					</div>
		            <div class="ui-block-b">  
		                <a href="javascript:fn_egov_reset()" data-role="button" data-theme="b" data-icon="refresh">초기화</a>
		            </div>
				</fieldset>	
				
			</form:form>
			    
		</div>
	</div>

</body>

</html>
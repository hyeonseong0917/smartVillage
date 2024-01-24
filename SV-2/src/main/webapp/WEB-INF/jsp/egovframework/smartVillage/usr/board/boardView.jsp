<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javaScript" language="javascript">
	
	function fn_egov_select_noticeList() {
		document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo";
		document.frm.submit();	
	}
	
	function fn_egov_delete_notice() {
		if(confirm("삭제하시겠습니까?")){
			document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/deleteBoard.mdo";
			document.frm.submit();
		}	
	}
	
	function fn_egov_moveUpdt_notice() {
		document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/updateBoardView.mdo";
		document.frm.submit();	
	}
	
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}
		
	function fn_showList() {
		document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo";
		document.frm.submit();
		
	}
	
	function fn_egov_addReply() {
		document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/addReplyView.mdo";
		document.frm.submit();
	}
</script>
<form name="frm" method="post" action="">	
	<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>">
	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>"> 
	<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>"> 
	<input type="hidden" name="frstRegisterNm" value="<c:out value='${result.frstRegisterNm}'/>">
	<input type="hidden" name="frstRegisterPnttm" value="<c:out value='${result.frstRegisterPnttm}'/>">
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>">
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>"> 
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>">
	<input type="hidden" name="nttSj" 	value="<c:out value='${result.nttSj}'/>">
	<input type="hidden" name="nttCn" 	value="<c:out value='${result.nttCn}'/>">
	<input type="hidden" name="inqireCo" 	value="<c:out value='${result.inqireCo}'/>">
	<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
</form>
<!-- header_wrap: e -->
<div class="title_box">
	<div class="title_box_inner">
	<c:if test="${result.bbsId ne 'BBSMSTR_000000000003'}">
		<h3>Community</h3>
		<ul class="m_05">
			<i></i>
			<li class="txt1">우리동네<span class="_txt_green"> 커뮤니티</span></li>
			<li>행복으로 <span class="_txt_blue">소통</span>하는<span class="_txt_green"> 친근한</span> 온라인 커뮤니티 공간</li>
		</ul>
	</c:if>
	<c:if test="${result.bbsId eq 'BBSMSTR_000000000003'}">
		<h3>Notice</h3>
		<ul class="m_06">
			<i></i>
			<li class="txt1">스마트빌리지<span class="_txt_blue"> 공지사항</span></li>
			<li><span class="_txt_blue">스마트빌리지</span>에서<span class="_txt_green"> 안내말씀</span> 드립니다.</li>
		</ul>
	</c:if>
	</div>
</div>

<div class="topM_box">
	<div class="topM_box_inner">
	<c:if test="${result.bbsId ne 'BBSMSTR_000000000003'}">
		<div class="ds_type_box">
			<ul>
			<c:if test="${result.bbsId eq 'BBSMSTR_000000000001'}">
				<li class="list_type">취미생활</li>
			</c:if>
			<c:if test="${result.bbsId eq 'BBSMSTR_000000000002'}">
				<li class="list_type">고장신고</li>
			</c:if>
				<li>
					<c:out value="${result.frstRegisterNm}"/>
				</li>
				<li><c:out value="${result.frstRegisterPnttm}"/></li>
				<%-- <li><c:out value="${result.inqireCo}"/></li> --%>
			</ul>
		</div>
		<div>
		<c:if test="${result.frstRegisterNm eq sessionUniqId}">
			<a class="normal_bt" href="javascript:fn_egov_moveUpdt_notice()">수정</a>
		</c:if>
			<a class="normal_bt _blue mgl_5" href="javascript:fn_egov_addReply()">답글</a>
		</div>
	</c:if>
	<c:if test="${result.bbsId eq 'BBSMSTR_000000000003'}">
		<div class="ds_type_box">
			<ul>
				<li class="list_type">공지사항</li>
				<li><c:out value="${result.frstRegisterNm}"/></li>
				<li>${result.frstRegisterPnttm}</li>
				<!--<li class="view_num_icon"><span>973</span></li>-->
			</ul>
		</div>
		<div>
			<!--<a class="normal_bt" href="list.html">수정</a>-->
			<a class="normal_bt _blue mgl_5" href="javascript:fn_egov_select_noticeList()">목록</a>
		</div>
	</c:if>
	</div>
</div>

<div class="sub_container">
	<c:if test="${result.bbsId ne 'BBSMSTR_000000000003'}">
		<div class="view_title">
			<h4><c:out value="${result.nttSj}"/></h4>
		</div>
		<div class="data_view_inner">
			<dl class="d_view_dl">
				<dd class="d_view_except">
					<div id="viewer">
						<c:out value="${fn:replace(result.nttCn , crlf , '<br>')}" escapeXml="false"/>
					</div>
				</dd>
			</dl> 
			<!-- 
			<dl class="d_view_dl">
				<dt>첨부파일</dt>
				<dd class="d_view_except"><a href="#" style="color:blue">file.hwp</a></dd>
			</dl>
			-->
		</div>
		<div class="btm_box_bt">
			<a class="normal_bt _fl" href="javascript:fn_egov_select_noticeList()">목록</a> 
			<div class="_fr">
			<c:if test="${result.frstRegisterId eq sessionUniqId}">
				<a class="normal_bt" href="javascript:fn_egov_delete_notice()">삭제</a>
			</c:if>
			<c:if test="${result.frstRegisterId eq sessionUniqId}">
				<a class="normal_bt" href="javascript:fn_egov_moveUpdt_notice()">수정</a>
			</c:if>
				<a class="normal_bt _blue mgl_5" href="javascript:fn_egov_addReply()">답글</a>
			</div>
		</div>
	</c:if>
	<c:if test="${result.bbsId eq 'BBSMSTR_000000000003'}">
		<div class="view_title">
			<h4><c:out value="${result.nttSj}"/></h4>
		</div>
		<div class="data_view_inner">
			<dl class="d_view_dl">
				<dd class="d_view_except">
					<div id="viewer">
						<c:out value="${fn:replace(result.nttCn , crlf , '<br>')}" escapeXml="false"/>
					</div>
				</dd>
			</dl> 
			<!-- 
			<dl class="d_view_dl">
				<dt>첨부파일</dt>
				<dd class="d_view_except"><a href="#" style="color:blue">file.hwp</a></dd>
			</dl>
			-->
		</div>
		<div class="btm_box_bt">
			<a class="normal_bt _fr _blue" href="javascript:fn_egov_select_noticeList()">목록</a>
		</div>
	</c:if>
</div>
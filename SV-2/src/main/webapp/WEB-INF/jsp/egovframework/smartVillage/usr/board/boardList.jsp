<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javaScript" language="javascript">
	function fn_egov_regist(bbsId) {
		document.frm.nttId.value = document.frm.nttId.value;
		document.frm.bbsId.value = bbsId;
		document.frm.action ="${pageContext.request.contextPath}/smartVillage/board/addBoardView.mdo";
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

		document.frm.action = "${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo";
		document.frm.submit();	
	}

	//상세조회
	function fn_egov_inqire_notice(nttId, bbsId) {
		document.frm.nttId.value = nttId;
		document.frm.bbsId.value = bbsId;
		document.frm.action ="${pageContext.request.contextPath}/smartVillage/board/selectBoardView.mdo";
		document.frm.submit();			
	}
	
	function moveTab(tabId) {
		document.frm.bbsId.value = tabId;
		fn_egov_select_noticeList(0);
	}
</script>
<form id="frm" name="frm" method="post" data-role="none">
	<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>"/>
	<input type="hidden" name="nttId"  value="0"/>
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form>
<!-- header_wrap: e -->
<div class="title_box">
	<div class="title_box_inner">
	<c:if test="${boardVO.bbsId ne 'BBSMSTR_000000000003'}">
		<h3>Community</h3>
		<ul class="m_05">
			<i></i>
			<li class="txt1">우리동네<span class="_txt_green"> 커뮤니티</span></li>
			<li>행복으로 <span class="_txt_blue">소통</span>하는<span class="_txt_green"> 친근한</span> 온라인 커뮤니티 공간</li>
		</ul>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
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
<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000001'}">
	<div class="topM_box_inner">
		<p class="_2 _m05"><a href="javascript:moveTab('BBSMSTR_000000000001');" id="m_01" class="active m_01"><i ></i>취미생활</a></p>
		<p class="_2 _m05"><a href="javascript:moveTab('BBSMSTR_000000000002');" id="m_02" class="m_02" ><i ></i>고장신고</a></p>
		<a class="icon_top_bt _write" href="javascript:fn_egov_regist('<c:out value="${boardVO.bbsId}"/>')">글쓰기</a>
	</div>
</c:if>
<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000002'}">
	<div class="topM_box_inner">
		<p class="_2 _m05"><a href="javascript:moveTab('BBSMSTR_000000000001');" id="m_01" class="m_01"><i ></i>취미생활</a></p>
		<p class="_2 _m05"><a href="javascript:moveTab('BBSMSTR_000000000002');" id="m_02" class="active m_02" ><i ></i>고장신고</a></p>
		<a class="icon_top_bt _write" href="javascript:fn_egov_regist('<c:out value="${boardVO.bbsId}"/>')">글쓰기</a>
	</div>
</c:if>
<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
	<div class="list_top_box">
		<p class="result_num fl_left"><strong class="_txt_blue">${resultCnt}</strong> 건의 공지사항이 있습니다.</p>
		<%-- <a class="icon_top_bt _write fl_right" href="javascript:fn_egov_regist('<c:out value="${boardVO.bbsId}"/>')">글쓰기</a> --%>
	</div>
</c:if>
</div>

<div class="sub_container">
	<c:if test="${boardVO.bbsId ne 'BBSMSTR_000000000003'}">
	<div class="list_top_box">
		<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000001'}">
		<p class="result_num"><strong class="_txt_blue">${resultCnt}</strong> 건의 취미생활 게시물이 있습니다.</p>
		</c:if>
		<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000002'}">
		<p class="result_num"><strong class="_txt_blue">${resultCnt}</strong> 건의 고장신고 게시물이 있습니다.</p>
		</c:if>
	</div>

	<c:forEach var="result" items="${resultList}">
		<c:choose>
		<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
			<h3>
				<c:out value="${result.nttSj}"/>
			</h3>
		</c:when>
		<c:otherwise>
			<div class="
				<c:if test="${result.replyLc >= 0}">
					ds_row_box
			</c:if>
			<c:if test="${result.replyLc > 0}">
					 _reply
			</c:if>
			<c:if test="${result.replyLc > 1}">
					 re
			</c:if>
				">
				<p class="ds_list_title"><a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')">${result.nttSj}</a></p>
				<p class="ds_list_con"><a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')">${result.nttCn}</a></p>
				<div class="ds_type_box">
					<ul>
						<li>
							${result.frstRegisterNm}
						</li>
						<li>${result.frstRegisterPnttm }</li>
						<li class="view_num_icon"><span>${result.inqireCo}</span></li>
					</ul>
				</div>
			</div>
		</c:otherwise>
		</c:choose>
	</c:forEach>
		<div class="paginate_complex">
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList"/>
  		</div>
	</c:if>
	<c:if test="${boardVO.bbsId eq 'BBSMSTR_000000000003'}">
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<div class="ds_row_box
				<c:if test="${status.first}">
					pdt_0
				</c:if>
					">
			<p class="ds_list_title"><a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')">${result.nttSj}</a></p>
			<p class="ds_list_con"><a href="javascript:fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value="${result.bbsId}"/>')">${result.nttCn}</a></p>
			<div class="ds_type_box">
				<ul>
					<li>${result.frstRegisterNm}</li>
					<li>${result.frstRegisterPnttm }</li>
					<li class="view_num_icon"><span>${result.inqireCo}</span></li>
				</ul>
			</div>
		</div>
	</c:forEach>
		<div class="paginate_complex">
			<ui:pagination paginationInfo="${paginationInfo}" type="mblImage" jsFunction="fn_egov_select_noticeList"/>
  		</div>
	</c:if>
</div>
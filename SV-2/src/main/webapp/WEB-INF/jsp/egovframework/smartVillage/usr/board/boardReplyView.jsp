<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javaScript" language="javascript">
	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
		if($("#nttCn").val() == "" || $("#nttSj").val() == ""){
			alert("입력되지 않은 항목이 있습니다.\n입력 후 다시 시도해주세요");
			return;
		}
		document.board.action = "${pageContext.request.contextPath}/smartVillage/board/insertReplyBoard.mdo";
		document.board.submit();
	}
	function fn_egov_select_noticeList() {
		document.board.action = "${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo";
		document.board.submit();
	}
	function fn_egov_inqire_notice(nttId, bbsId) {
		var frm = $('<form></form>');
		
		frm.attr("name", "frm");
		frm.attr("method", "post");
		frm.attr("action", "${pageContext.request.contextPath}/smartVillage/board/selectBoardView.mdo");
		
		frm.append($('<input/>', {type: 'hidden', name: 'nttId', value: nttId}));
		frm.append($('<input/>', {type: 'hidden', name: 'bbsId', value: bbsId}));
		
		frm.appendTo('body');
		
		frm.submit();
	}
</script>
<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="replyAt" value="Y"/>
	<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>
	<input type="hidden" name="nttId" value="<c:out value='${searchVO.nttId}'/>"/>
	<input type="hidden" name="parnts" value="<c:out value='${searchVO.parnts}'/>"/>
	<input type="hidden" name="sortOrdr" value="<c:out value='${searchVO.sortOrdr}'/>"/>
	<input type="hidden" name="replyLc" value="<c:out value='${searchVO.replyLc}'/>"/>
	
	<input type="hidden" name="bbsId" value="<c:out value='${bbsId}'/>"/>
	
	<div class="title_box">
		<div class="title_box_inner">
			<h3>Community</h3>
			<ul class="m_05">
				<i></i>
				<li class="txt1">우리동네<span class="_txt_green"> 커뮤니티</span></li>
				<li>행복으로 <span class="_txt_blue">소통</span>하는<span class="_txt_green"> 친근한</span> 온라인 커뮤니티 공간</li>
			</ul>
		</div>
	</div>

	<div class="topM_box">
		<div class="ds_row_box">
			<p class="ds_list_title"><a href="javascript:fn_egov_inqire_notice('${searchVO.nttId}', '${bbsId}');"><c:out value="${result.nttSj}"/></a></p>
			<p class="ds_list_con"><a href="javascript:fn_egov_inqire_notice('${searchVO.nttId}', '${bbsId}');"><c:out value="${fn:replace(result.nttCn , crlf , '<br>')}" escapeXml="false"/></a></p>
			<div class="ds_type_box">
				<ul>
					<li>${searchVO.frstRegisterNm}</li>
					<li>${searchVO.frstRegisterPnttm}</li>
					<li class="view_num_icon"><span>${searchVO.inqireCo}</span></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="sub_container">
		<div class="view_title">
			<h4>
				<input name="nttSj" id="name" type="text" placeholder="제목을 입력해주세요" class="w100p">
			</h4>
		</div>
		<div class="data_view_inner">
			<dl class="d_view_dl">
				<dd class="d_view_except">
					<div id="viewer">
						<textarea id="nttCn" name="nttCn" cols="" rows="16"></textarea>
					</div>
				</dd>
			</dl> 
			<!-- 
				<dl class="d_view_dl">
					<dt>첨부파일</dt>
					<dd class="d_view_except">
						<a href="#" style="color:blue">file.hwp</a>
					</dd>
				</dl>
			-->
		</div>
		<div class="btm_box_bt">
			<a class="normal_bt _fl" href="javascript:fn_egov_select_noticeList();">취소</a>
			<a class="normal_bt _fr _blue" href="javascript:fn_egov_regist_notice()">저장</a>
		</div>
	</div>
</form:form>
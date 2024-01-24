<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/validator.do"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
	function fn_showList() {
		var bbsId = document.board.bbsId.value;
		document.board.action = "${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo";
		document.board.bbsId.value = bbsId;
		document.board.submit();
	}
	
	function fn_egov_regist_notice() {
		if($("#nttCn").val() == "" || $("#nttSj").val() == ""){
			alert("입력되지 않은 항목이 있습니다.\n입력 후 다시 시도해주세요");
			return;
		}
		document.board.bbsId.value = $("#selBbsId").val();
		document.board.action = "${pageContext.request.contextPath}/smartVillage/board/insertBoard.mdo";
		document.board.submit();
	}

	function fn_egov_update_notice(){
		document.board.action = "${pageContext.request.contextPath}/smartVillage/board/updateBoard.mdo";
		document.board.submit();
	}
</script>
<form:form commandName="board" name="board" method="post" enctype="multipart/form-data">
	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	<input type="hidden" name="bbsId" value="<c:out value='${bbsId}'/>"/>
	
	<c:if test="${result ne null}">
	<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" >
	<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" >
	<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" >
	<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" >
	</c:if>
	
	<input type="hidden" name="searchCnd" value="<c:out value='${searchVO.searchCnd}'/>">
	<input type="hidden" name="searchWrd" value="<c:out value='${searchVO.searchWrd}'/>">
	<!-- header_wrap: e -->
	<div class="title_box">
		<div class="title_box_inner">
		<c:if test="${bbsId ne 'BBSMSTR_000000000003'}">
			<h3>Community</h3>
			<ul class="m_05">
				<i></i>
				<li class="txt1">우리동네<span class="_txt_green"> 커뮤니티</span></li>
				<li>행복으로 <span class="_txt_blue">소통</span>하는<span class="_txt_green"> 친근한</span> 온라인 커뮤니티 공간</li>
			</ul>
		</c:if>
		<c:if test="${bbsId eq 'BBSMSTR_000000000003'}">
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
			<div class="sear_word_sel w60p">
				<select name="selBbsId" id="selBbsId" title="게시판 종류">
					<option value="BBSMSTR_000000000001">취미생활</option>
					<option value="BBSMSTR_000000000002">고장신고</option>
				<c:if test="${bbsId eq 'BBSMSTR_000000000003'}">
					<option value="BBSMSTR_000000000003">공지사항</option>
				</c:if>
				</select>
			</div>
			<div class="fl_right">
				<a class="normal_bt " href="javascript:fn_showList()">취소</a>
				<a class="normal_bt _blue mgl_5" href="javascript:fn_showList()">목록</a>
			</div>
		</div>
	</div>

	<div class="sub_container">
		<div class="view_title">
			<h4>
				<input name="nttSj" id="nttSj" type="text" placeholder="제목을 입력해주세요" class="w100p" value="<c:if test="${result ne null}">${result.nttSj }</c:if>">
			</h4>
		</div>
		<div class="data_view_inner">
			<dl class="d_view_dl">
				<dd class="d_view_except">
					<div id="viewer">
						<textarea name="nttCn" id="nttCn" cols="" rows="16"><c:if test="${result ne null}">${result.nttCn }</c:if></textarea>
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
			<a class="normal_bt _fl" href="javascript:fn_showList()">취소</a>
			<c:if test="${result eq null}">
			<a class="normal_bt _fr _blue" href="javascript:fn_egov_regist_notice()">저장</a>
			</c:if>
			<c:if test="${result ne null}">
			<a class="normal_bt _fr _blue" href="javascript:fn_egov_update_notice()">수정</a>
			</c:if>
		</div>
	</div>
</form:form>
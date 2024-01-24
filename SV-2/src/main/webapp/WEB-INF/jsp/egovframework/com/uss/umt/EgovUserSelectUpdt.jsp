<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovUserSelectUpdt.jsp
  * @Description : 사용자상세조회, 수정 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.02
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>" type="text/css">
<link href="<c:url value='/css/egovframework/com/cmm/button.css'/>" rel="stylesheet"  type="text/css">
<title>User Detail, Update, Delete</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}
function fnDeleteUser(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg"/>")){
	    document.userManageVO.checkedIdForDel.value=checkedIds;
	    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
	    document.userManageVO.submit();
	}
}
function fnPasswordMove(){
	document.userManageVO.action = "<c:url value='/uss/umt/EgovUserPasswordUpdtView.do'/>";
    document.userManageVO.submit();
}
function fnUpdate(){
    if(validateUserManageVO(document.userManageVO)){
        document.userManageVO.submit();
    }
}
function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do'/>";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}
/*
if (typeof(opener.fn_egov_dn_info_setting) == 'undefined') {
	alert('메인 화면이 변경되거나 없습니다');
	this.close();
} else {
	opener.fn_egov_dn_info_setting(dn);
	this.close();
}
*/
//-->
</script>
</head>
<body>
        <!-- content start -->
        <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserSelectUpdt.do" name="userManageVO" method="post" >

        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
        <input name="checkedIdForDel" type="hidden"/>
        <!-- 검색조건 유지 -->
        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
        <input type="hidden" name="userTyForPassword" value="<c:out value='${userManageVO.userTy}'/>"/>
        <!-- for validation -->
	    <input type="hidden" name="password" id="password" value="Test#$123)"/>

        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
            <td width="100%"class="title_left">
            <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" alt=""/>&nbsp;업무사용자 상세조회(수정)</td>
            </tr>
        </table>
        <table width="717" border="0" cellpadding="0" cellspacing="1" class="table-register">
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                사용자아이디<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"/>
                </th>
                <td width="80%" nowrap>
                    <form:input path="emplyrId" id="emplyrId" cssClass="txaIpUmt" size="20" maxlength="20" readonly="true" title="사용자아이디"/>
                    <form:errors path="emplyrId" cssClass="error"/>
                    <form:hidden path="uniqId"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                사용자이름<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"/>
                </th>
                <td width="80%" nowrap>
                    <form:input path="emplyrNm" id="emplyrNm" cssClass="txaIpUmt" size="20"  maxlength="60" title="사용자이름"/>
                    <form:errors path="emplyrNm" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >직위명&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="ofcpsNm" id="ofcpsNm" cssClass="txaIpUmt" size="20" maxlength="50" title="직위명"/>
                    <form:errors path="ofcpsNm" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >핸드폰번호&nbsp;&nbsp;</th>
                <td width="80%" nowrap>
                    <form:input path="moblphonNo" id="moblphonNo" cssClass="txaIpUmt" size="20" maxlength="15" title="핸드폰번호"/>
                    <form:errors path="moblphonNo" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                이메일주소<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"/>
                </th>
                <td width="80%" nowrap>
                    <form:input path="emailAdres" id="emailAdres" cssClass="txaIpUmt" size="20" maxlength="50" title="이메일주소"/>
                    <form:errors path="emailAdres" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th width="20%" height="23" class="required_text" nowrap >
                사용자상태코드<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"/>
                </th>
                <td width="80%" nowrap>
                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="사용자상태코드">
                        <form:option value="" label="--선택하세요--"/>
                        <form:option value="A" label="회원 가입 신청 상태"/>
                        <form:option value="D" label="회원 가입 삭제 상태"/>
                        <form:option value="P" label="회원 가입 승인 상태"/>
                    </form:select>
                    <form:errors path="emplyrSttusCode" cssClass="error"/>
                </td>
            </tr>
            
        </table>
        <table width="717" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="10"></td>
            </tr>
            <tr>
                <td align="center">
                <table border="0" cellspacing="0" cellpadding="0" align="center" >
		            <tr>
		                <!-- 수정 -->
		                <td><span class="button"><input type="submit" value="<spring:message code="button.update"/>" onclick="fnUpdate(); return false;"/></span>&nbsp;</td>
		                <!-- 삭제 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserDelete.do'/>" onclick="fnDeleteUser('<c:out value='${userManageVO.userTy}'/>:<c:out value='${userManageVO.uniqId}'/>'); return false;"><spring:message code="button.delete"/></a></span>&nbsp;</td>
		                <!-- 목록 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list"/></a></span>&nbsp;</td>
                        <!-- 암호변경 -->
		                <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserPasswordUpdtView.do'/>" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate"/></a></span>&nbsp;</td>
                        <!-- 취소 -->
		                <td><span class="button"><a href="#LINK" onclick="javascript:document.userManageVO.reset();"><spring:message code="button.reset"/></a></span></td>
		            </tr>
		        </table>
                </td>
            </tr>
        </table>

        </form:form>
        <!-- content end -->
</body>
</html>

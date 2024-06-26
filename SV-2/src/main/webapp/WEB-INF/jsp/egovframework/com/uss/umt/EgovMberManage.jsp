<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
 /**
  * @Class Name : EgovUserManage.jsp
  * @Description : 사용자관리(조회,삭제) JSP
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
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/com.css'/>" type="text/css" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/button.css'/>" type="text/css" >
<title>User Manage(List,Del)</title>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnCheckAll() {
    var checkField = document.listForm.checkField;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}
function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg"/>")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/EgovMberDelete.do'/>";
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
	document.listForm.selectedId.value = id;
	array = id.split(":");
	if(array[0] == "") {
	} else {
	    userTy = array[0];
	    userId = array[1];    
	}
	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/uss/umt/EgovMberSelectUpdtView.do'/>";
    document.listForm.submit();
}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/EgovMberInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/uss/umt/EgovMberManage.do'/>";
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}"/>");</c:if>
//-->
</script>
</head>
<body>
        <!-- content start -->
        <a href="${pageContext.request.contextPath}/uat/uia/actionMain.mdo" data-icon="arrow-l" rel="external">홈으로</a>
        <table width="717" cellpadding="8" class="table-search" border="0">
            <tr>
                <td width="100%" class="title_left"><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" alt=""/>&nbsp;일반회원관리</td>
            </tr>
        </table>
        <!-- content start -->
        <form name="listForm" action="<c:url value='/uss/umt/EgovMberManage.do'/>" method="post">
        <input name="selectedId" type="hidden"/>
        <input name="checkedIdForDel" type="hidden"/>
        <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
        <div>사용자수 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></div>
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                <div>
                <select name="sbscrbSttus" id="sbscrbSttus" title="검색조건선택1">
                    <option value="0" <c:if test="${empty mberVO.sbscrbSttus || mberVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
                    <option value="A" <c:if test="${mberVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >가입신청</option>
                    <option value="D" <c:if test="${mberVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option>
                    <option value="P" <c:if test="${mberVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option>
                </select>
                <select name="searchCondition" id="searchCondition" title="검색조건선택2">
                    <option value="0" <c:if test="${mberVO.searchCondition == '0'}">selected="selected"</c:if> >ID</option>
                    <option value="1" <c:if test="${empty mberVO.searchCondition || mberVO.searchCondition == '1'}">selected="selected"</c:if> >Name</option>
                </select>
                <input name="searchKeyword" id="searchKeyword" title="검색" type="text" value="<c:out value="${mberVO.searchKeyword}"/>"/>
                </div>
                </td>
                <td>&nbsp;</td>

                <!-- 검색 -->
                <td><span class="button"><input type="submit" value="<spring:message code="button.search"/>" onclick="fnSearch(); return false;"/></span>&nbsp;</td>
                <!-- 삭제 -->
                <td><span class="button"><a href="#LINK" onclick="fnDeleteUser(); return false;"><spring:message code="button.delete"/></a></span>&nbsp;</td>
                <!-- 목록 -->
                <td><span class="button"><a href="<c:url value='/uss/umt/EgovMberManage.do'/>" onclick="fnSearch(); return false;"><spring:message code="button.list"/></a></span>&nbsp;</td>
                <!-- 등록 -->
                <td><span class="button"><a href="<c:url value='/uss/umt/EgovMberInsertView.do'/>" onclick="fnAddUserView(); return false;"><spring:message code="button.create"/></a></span>&nbsp;</td>
            </tr>
        </table>
        <br/>
        <table summary="List of Sample"  width="717" cellpadding="8" class="table-line">
            <thead>
                <tr>
                    <th class="title" scope="col">No.</th>
                    <th class="title" scope="col">
                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
                    </th>
                    <th class="title" scope="col">아이디</th>
                    <th class="title" scope="col">사용자이름</th>
                    <th class="title" scope="col">사용자이메일</th>
                    <th class="title" scope="col">전화번호</th>
                    <th class="title" scope="col">등록일</th>
                    <th class="title" scope="col">가입상태</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="result" items="${resultList}" varStatus="status">
                <tr>
                    <td class="lt_text3" ><c:out value="${status.count}"/></td>
                    <td class="lt_text3" >
                        <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                    </td>
                    <td class="lt_text3" style="cursor:pointer;cursor:hand" >
						<span class="link"><a href="<c:url value='/uss/umt/EgovMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>"  onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;"><c:out value="${result.userId}"/></a></span>
                    </td>
                    <td class="lt_text3" ><c:out value="${result.userNm}"/></td>
                    <td class="lt_text3" ><c:out value="${result.emailAdres}"/></td>
                    <td class="lt_text3" ><c:out value="${result.moblphonNo}"/></td>
                    <td class="lt_text3" ><c:out value="${result.sbscrbDe}"/></td>
                    <td class="lt_text3" >
                        <c:if test="${result.sttus == 'A'}"><c:out value="회원 가입 신청 상태"/></c:if>
                        <c:if test="${result.sttus == 'D'}"><c:out value="회원 가입 삭제 상태"/></c:if>
                        <c:if test="${result.sttus == 'P'}"><c:out value="회원 가입 승인 상태"/></c:if>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table> 
        <!--  page start -->
        <table width="717">
            <tr>
                <td align="center">
                <div id="pagination">
                <ui:pagination paginationInfo = "${paginationInfo}"
                    type="image"
                    jsFunction="fnLinkPage"
                  />
                </div>  
                </td>
            </tr>
        </table>
        <br/>
        <!--  page end -->
        </form>
        <!-- content end -->
</body>
</html>

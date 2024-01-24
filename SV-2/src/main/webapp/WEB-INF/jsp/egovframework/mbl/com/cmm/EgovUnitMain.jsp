<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>전자정부 모바일 프레임워크</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>	    
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>   	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
</head>  
 
<body>
<!-- 모바일 페이지 start -->

<div data-role="page" >

<!-- header start -->
<div data-role="header" data-theme="z" class="com-egovHeaderBar">
스마트빌리지 관리자 페이지
</div>
<!-- header end -->

<!-- content start -->
<div data-role="content">
	<div data-role="collapsible-set">
		<div data-role="collapsible" data-collapsed="true">
			<h3>게시판관리</h3>
			<ul data-role="listview" data-inset="true" data-theme="d">
				<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000001" data-ajax="false">취미생활게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000002" data-ajax="false">고장신고게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/cop/bbs/selectBoardList.mdo?bbsId=BBSMSTR_000000000003" data-ajax="false">공지게시판</a></li>
			</ul>
		</div>
		<div data-role="collapsible" data-collapsed="true">
			<h3>사용자지원</h3>
			<ul data-role="listview" data-inset="true" data-theme="d">
				<li><a href="${pageContext.request.contextPath}/uss/umt/EgovMberManage.do" rel="external">사용자관리</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- content end -->

</div>
<!-- 모바일 페이지 end -->
</body>
</html>


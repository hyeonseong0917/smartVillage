<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>EgovFrame 일반로그인</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/com/uss/ussCommon.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>

		<script type="text/javascript">
		<!--

		function actionLogin() {
			if (document.loginForm.id.value =="") {
				jAlert("아이디를 입력하세요",'알림', 'a');
			} else if (document.loginForm.password.value =="") {
				jAlert("비밀번호를 입력하세요",'알림', 'a');
			}
			else {
		        document.loginForm.action="${pageContext.request.contextPath}/uat/uia/actionLogin.mdo";

				document.loginForm.submit();
			}
		}	

		$(document).ready(fnInit);
		
		function fnInit() {
			var message = "${message}";
			if (message != "") {
				alert(message);
			}
		}
		
		-->
		</script>
</head>

<body>

    <!-- 메인 페이지 -->
    <div data-role="page" id="NoticeInire" data-url="page_main"  data-theme="b" class="com-copIndex">

		<!-- header start -->
		<div data-role="header" data-theme="z" class="com-egovHeaderBar"> 
			스마트빌리지 관리자 페이지
		</div>
		<!-- header end -->

		<!-- content start -->
        <div data-role="content" class="com-logContent">   

			<form name="loginForm" action ="${pageContext.request.contextPath}/mbl/com/uat/uia/actionLogin.do" method="post">
				<input type="hidden" id="userSe" name="userSe" value="USR"/>
				<div data-role="fieldcontain" class="com-logId">
					<label for="id"><strong>아이디</strong></label>
					<input type="text" name="id" id="id" value="" data-theme="c"/>
	            </div>
	
				<div data-role="fieldcontain"  class="com-logPw" style="margin-top:10px">
					<label for="password"><strong>비밀번호</strong></label>
					<input type="password" name="password" id="password" value="" data-theme="c"/>
				</div>
				<div data-role="fieldcontain" class="com-logLogin" style="margin-top:10px">   
					<a href="javascript:actionLogin();" data-role="button" data-theme="b">로그인</a>
				</div>
				<input name="j_username" type="hidden"/>
			</form>

        </div>
		<!-- content end -->

	</div>
	<!-- 메인 페이지 end -->
</body>
</html>


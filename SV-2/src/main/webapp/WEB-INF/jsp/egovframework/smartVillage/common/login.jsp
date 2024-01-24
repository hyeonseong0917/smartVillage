<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="cache-Control" content="co-cache" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	       
		<title>스마트빌리지</title>
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mquery.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slidebars.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.scroll.pack.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/utilsed84.js?v=20200729"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/slidebars.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

		<script type="text/javascript">
			function actionLogin() {
				if (document.loginForm.id.value =="") {
					jAlert("아이디를 입력하세요",'알림', 'a');
				} else if (document.loginForm.password.value =="") {
					jAlert("비밀번호를 입력하세요",'알림', 'a');
				} else {
					var check = $('input[name=rdoSlctUsr]:checked').val();
					//$('#userSe').val(check);
			        document.loginForm.action="${pageContext.request.contextPath}/smartVillage/login.mdo";
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
		</script>
	</head>
	
	<body>
	    <!-- 메인 페이지 -->
	    <div data-role="page" id="NoticeInire" data-url="page_main"  data-theme="b" class="com-copIndex">
			<div class="weather_wrap">
					<div class="weather_inner">
						<ul>
							<li><i id="weather" class="weather _snow"></i></li><!--날씨-->
							<li>부산광역시<span id="temper_val">${tmp}</span><i class="temper "></i></li><!--기온-->
							<li>미세먼지<i class="dust _step0${pm10}"></i></li>
							<li>초미세먼지<i class="dust _step0${pm25}"></i></li>
						</ul>
					</div>
				</div>
			
			<div class="header_wrap">
				<div class="header_inner _login">
					<h1><a href="${pageContext.request.contextPath}/">스마트빌리지</a></h1>
				</div>
			</div>
	
			<!-- content start -->
			<div class="sub_container">
				<div class="login_wrap">
					<div class="login_inner">
						<div class="login_box">
							<form name="loginForm" action ="${pageContext.request.contextPath}/smartVillage/login.mdo" method="POST">
								<div class="join_int_box login_int_t">
									<label>아이디</label>
									<input type="text" title="아이디" name="id" id="id" placeholder="아이디">
								</div>
								<div class="join_int_box login_int_t">
									<label class="l_int_pw">비밀번호</label>
									<input type="password" title="비밀번호" name="password" id="password" placeholder="비밀번호">
								</div>
								<input name="j_username" type="hidden"/>
								<input type="hidden" id="userSe" name="userSe" value="GNR"/>
								<button type="submit" onclick="actionLogin();" class="lg_bt" style="border: none; width: 100%;">로그인</button>
							</form>
						</div>
						<div class="login_bottom_box"> 
							<p>아직 회원이 아니신가요?</p>
							<div class=""> <a href="${pageContext.request.contextPath}/smartVillage/signInView.mdo" class="join_bt">회원가입</a> </div>
						</div>
					</div>
				</div>
			</div>
			<!-- content end -->
	
			<div class="footer_wrap">
				<div class="footer_inner">
					<p><span>우) 34350 대전광역시 대덕구 신탄진로 200</span><span>COPYRIGHT © K-water ALL RIGHTS RESERVED</span></p>
					<div class="footer_link_box"> <a href="javascript:void(0)" class="f_l_text">주요 사이트</a>
						<div class="f_l_drop">
							<ul>
								<li><a href="https://busan-smartvillage.com/" target="_blank">스마트빌리지</a></li>
								<li><a href="www.kwater.or.kr" target="_blnak">K-water</a></li>
							</ul>
						</div>
					</div>
					<!-- <div class="footer_term"> <a href="#">개인정보처리방침</a> </div> -->
				</div>
			</div>
		</div>
		<!-- 메인 페이지 end -->
	</body>
</html>


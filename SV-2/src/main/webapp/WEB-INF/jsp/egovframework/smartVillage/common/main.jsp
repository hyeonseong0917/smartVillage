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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_style.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.scroll.pack.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/utilsed84.js?v=20200729"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/slidebars.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/owl.carousel.js"></script> 
	
		
		<script type="text/javaScript" language="javascript">
			BASE = "";
			login = "";
			
			$(function() {
				$.slidebars();
				$(".sub_search_bt").click(function(){
					$(".mobile_s_inner").toggleClass("search_active");
				});
				$(".m_toggle_bt").click(function(){
					$(".m_toggle_box").toggleClass("tm_open_type");
				});
				// 오른쪽 퀵 메뉴
				var lnb = $('.right_nav_box').offset().top;
			 	$(window).scroll(function(){
					var window = $(this).scrollTop();
					if(lnb <= window) {
						$(".right_nav_box").addClass("r_q_fixed");
					} else {
						$(".right_nav_box").removeClass("r_q_fixed");
					}
			 	})
			});
			function alertReady(){
				alert("준비 중입니다.\n관리자에게 문의 바랍니다.");
			}
		</script>
		
	</head>

	<body>
		<!-- 메인 페이지 -->
		<div id="sb-site">
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
				<div class="header_inner">
					<h1><a href="${pageContext.request.contextPath}/">스마트빌리지</a></h1>
					<div class="gnb_back_bg"style="display:none;">nav bg</div>
					<div class="top_right_box">
						<div class="tablet_nav sb-toggle-right"> <a href="#" class="tablet_nav_bt" id="mnav_bt">
						<span class="line"></span>
						<span class="line"></span>
						<span class="line"></span> </a> </div>
					</div>
					<!-- top_right_box : e--> 
				</div>
			</div>
			<!-- header_wrap: e -->
			<div class="main_contents_wrap">
				<div class="m_c_text">
					<h2></h2>
					<p></p>
					<p class="_02"></p>
				</div>
			</div>
			<!-- main_visual_wrap : e -->
			
			<div class="sub_container">
				<div class="main_menu_box">
					<p class="m_01"><a href="${pageContext.request.contextPath}/smartVillage/waterEnergy/waterEnergyUsage.mdo"><i></i>Water & Energy</a></p>
					<p class="m_02"><a href="${pageContext.request.contextPath}/smartVillage/environment/environmentInfo.mdo"><i></i>Environment</a></p>
					<p class="m_03"><a href="${pageContext.request.contextPath}/smartVillage/carCare/carCare.mdo"><i></i>Car Care</a></p>
					<%-- <p class="m_04"><a href="${pageContext.request.contextPath}/smartVillage/cctv/cctv.mdo"><i></i>CCTV</a></p> --%>
					<p class="m_05"><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000001"><i></i>Community</a></p>
					<p class="m_06"><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000003"><i></i>Notice</a></p>
				</div>
				<!--main_menu_box : e  -->
			</div>
			<!-- sub_container : e-->
			
			<div class="app_box"> <a class="btn js-click-modal"><h4>SMART VILLAGE APP <span class="arrow_down"></span></h4></a>
				<div class="modal">
					<div class="header"><a class="btn js-close-modal"><h4>SMART VILLAGE APP <span class="arrow_down"></span></h4></a></div>
					<div class="body">
						<div class="app_box_inner">
							<p class="m_01"><a href="https://play.google.com/store/apps/details?id=com.samsung.android.oneconnect"><i></i>Smart Things</a></p>
							<p class="m_02"><a href="https://play.google.com/store/apps/details?id=kr.co.gyeyoung.smarthome.v1.raemian"><i></i>스마트 홈</a></p>
							<p class="m_03"><a href="javascript:alertReady()"><i></i>스마트 팜</a></p>
							<p class="m_04"><a href="https://edc.superbin.co.kr"><i></i>스마트 쓰레기통</a></p>
							<p class="m_05"><a href="javascript:alertReady()"><i></i>스마트 에너지</a></p>
							<p class="m_06"><a href="javascript:alertReady()"><i></i>웰니스센터</a></p>
							<p class="m_07"><a href="https://play.google.com/store/apps/details?id=kr.fitt.fitt4"><i></i>AI 체육센터</a></p>
							<p class="m_08"><a href="https://play.google.com/store/apps/details?id=com.healthmax.biogram"><i></i>실시간 건강관리</a></p>
							<p class="m_09"><a href="javascript:alertReady()" name="app"><i></i>친수정보</a></p>
						</div>
					</div>
				</div>
			</div>
			<script src="${pageContext.request.contextPath}/js/index.js"></script>

			<!-- sub_container : e-->
		</div>
		<!-- sb-site --> 
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

		<!-- 모바일 화면에서 오른쪽 메뉴 -->
		<div class="sb-slidebar sb-right">
			<div class="right_nav_box">
				<a href="${pageContext.request.contextPath}/"><div class="mobile_main">main으로 이동</div></a>
				<div style="text-align:center; border-bottom:1px solid  rgba(0,0,0,.1)">
				<c:choose>
				<c:when test="${loginVO ne null}">
					${loginVO.address}동 세대주님<br>
					환영합니다.<br>
					<br>
					<a href="${pageContext.request.contextPath}/smartVillage/logout.do">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/smartVillage/loginView.mdo">로그인</a>
				</c:otherwise>
				</c:choose>
				</div>
				<div id="" class="left_nav_inner">
					<h3><a href="${pageContext.request.contextPath}/smartVillage/waterEnergy/waterEnergyUsage.mdo" class="m01"><em>Water & Energy</em></a></h3>
					<h3><a href="${pageContext.request.contextPath}/smartVillage/environment/environmentInfo.mdo" class="m02"><em>Environment</em></a></h3>
					<h3><a href="${pageContext.request.contextPath}/smartVillage/carCare/carCare.mdo" class="m03"><em>Car Care</em></a></h3>
					<%-- <h3><a href="${pageContext.request.contextPath}/smartVillage/cctv/cctv.mdo" class="m04"><em>CCTV</em></a></h3>  --%>
					<h3><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000001" class="m05"><em>Community</em></a></h3>
					<h3><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000003" class="m06"><em>notice</em></a></h3>
				</div>
			</div>
		</div>
	</body>
</html>
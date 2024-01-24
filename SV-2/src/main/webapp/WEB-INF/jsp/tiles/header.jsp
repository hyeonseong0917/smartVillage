<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h3><a href="${pageContext.request.contextPath}/smartVillage/cctv/cctv.mdo" class="m04"><em>CCTV</em></a></h3> 
			<h3><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000001" class="m05"><em>Community</em></a></h3>
			<h3><a href="${pageContext.request.contextPath}/smartVillage/board/selectBoardList.mdo?bbsId=BBSMSTR_000000000003" class="m06"><em>notice</em></a></h3>
		</div>
	</div>
</div>
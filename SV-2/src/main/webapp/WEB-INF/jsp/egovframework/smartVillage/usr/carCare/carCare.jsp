<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="title_box">
	<div class="title_box_inner">
		<h3>Car Care</h3>
		<ul class="m_03">
			<i></i>
			<li class="txt1">내 <span class="_txt_blue">차량케어</span><span class="_txt_green">서비스</span></li>
			<li>차량의 <span class="_txt_blue">입출차</span>, 전기차<span class="_txt_orange"> 충전상태</span> 확인을 편리하게</li>
		</ul>
	</div>
</div>

<div class="sub_container" style="padding-bottom:0px !important">
	<div class="con_title_box">
		<div class="con_title_box_inner">
			<h4>세대 차량 등록 현황</h4>
		</div>
	</div>
	<!--컨텐츠 타이틀 : e  -->
	<div class="car_info_box">
		<c:forEach items="${carRegistInfo}" var="carRegistInfo" varStatus="status">
		<ul class="">
			<li class="view_num_icon"><span>${carRegistInfo.carNumber }</span></li>
			<li class="date">등록일자<span>${carRegistInfo.regDate }</span></li>
		</ul>
		</c:forEach>
	</div>
	
	<div class="con_title_box_normal">
		<h4>차량 입출차 이벤트</h4>
	</div>
	<div class="car_info_box">
		<c:forEach items="${carInOutHist}" var="carInOutHist" varStatus="status">
		<ul class="">
			<li class="inout">${carInOutHist.carInOutDate}</li>
			<li class="">${carInOutHist.carNumber}</li>
			<li class="">${carInOutHist.carInOutTime}</li>
			<c:if test="${carInOutHist.carInOutType eq 'IN01'}">
				<li class="date">차량 <span class="_txt_blue  pd_0">입차</span></li>
			</c:if>
			<c:if test="${carInOutHist.carInOutType eq 'IN02'}">
				<li class="date">차량 <span class="_txt_blue  pd_0">입차</span></li>
			</c:if>
			<c:if test="${carInOutHist.carInOutType eq 'OT01'}"> 
				<li class="date">차량 출차</li>
			</c:if>
			<c:if test="${carInOutHist.carInOutType eq 'OT02'}"> 
				<li class="date">차량 출차</li>
			</c:if>
		</ul>
		</c:forEach>
	</div>
	
	<div class="gray_full_box">
		<h4 class="">충전소 현황<div class="charging_set_"><p class="set_ok"><i></i>충전 대기</p><p class="set_ing"><i></i>충전 중</p><p class="set_no"><i></i>고장</p></div></h4>
		<div class="chargingStation">
			<c:forEach items="${chargeHist}" var="chargeHist" varStatus="status">
				<c:if test="${chargeHist.chargeState eq 'ready'}">
					<p class="set_ok"><i></i>${chargeHist.houseDongHo}충전소<br></br>충전대기</p>
				</c:if>
				<c:if test="${chargeHist.chargeState eq 'ready'}"> 
					<p class="set_ing"><i></i>${chargeHist.houseDongHo}충전소<br></br>충전중</p>
				</c:if>
				<c:if test="${chargeHist.chargeState eq 'ready'}"> 
					<p class="set_no"><i></i>${chargeHist.houseDongHo}충전소<br></br>고장</p>
				</c:if>
				<c:if test="${chargeHist.chargeState eq 'charging'}"> 
					<p class="set_ing"><i></i>${chargeHist.houseDongHo}충전소<br></br>충전중</p>
				</c:if>
				<c:if test="${chargeHist.chargeState eq 'unconnected'}"> 
					<p class="set_no"><i></i>${chargeHist.houseDongHo}충전소<br></br>고장</p>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
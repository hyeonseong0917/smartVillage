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
		<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
	 
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
		<script type="text/javaScript" language="javascript">
			$(function(){
				$('#mberId').blur(function(event){
					fnIdCheck();
				});
			});
			
			function fnIdCheck(){
				if($("#mberId").val() != ""){
					var data = {
						id: $("#mberId").val(),
					};
					$.ajax({
						// URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
						url: '${pageContext.request.contextPath}/smartVillage/duplicationCheck.mdo',
						type: 'POST',
						data: data,
						success: function(data) {
							if(data != undefined && data != ""){
								if (data == "success"){
									$("#dplctCheck").val("Y");
									$("#dplctYn").text("사용가능한 아이디 입니다.");
							    }else if (data == "fail"){
							    	$("#dplctCheck").val("F");
							        $("#dplctYn").text("이미사용중인 아이디입니다.");
							    }
							}
						},
						error: function(xhr, status, error) {
							alert("오류가 발생했습니다.\n관리자에게 문의 바랍니다.");
						},
					});
				}
			}
			
			function fnInsert(){
				fnIdCheck();
				if($("#mberId").val() == "" 
						|| $("#password").val() == "" 
						|| $("#password2").val() == "" 
						|| $("#moblphonNo").val() == "" 
						|| $("#adres").val() == ""){
					alert("입력되지 않은 항목이 있습니다.\n입력 후 다시 시도해주세요");
					return;
				}
				else if($("#dplctCheck").val() == "F"){
			    	alert("중복된 아이디 입니다.");
			        return;
			    }else if(document.mberManageVO.password.value != document.mberManageVO.password2.value){
					alert("<spring:message code="fail.user.passwordUpdate2" />");
					return;
				}
				document.mberManageVO.submit();
			}
		</script>
	</head>
	
	<body>
	<!-- 메인 페이지 -->
		<div data-role="page" id="NoticeInire" data-url="page_main"data-theme="b" class="com-copIndex">
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
				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />표시는 필수 입력입니다.
				<form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/smartVillage/signIn.mdo" name="mberManageVO" method="post">
					<input id="dplctCheck" name="dplctCheck" type="hidden" value="N"/>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<form:input path="mberId" id="mberId" title="아이디" size="20" maxlength="20" placeholder="아이디"/>
						<div><form:errors path="mberId" cssClass="error" /></div>
					</div>
					<div id="dplctYn"></div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<input name="mberNm" id="mberNm" title="이름" type="text" size="20" value=""maxlength="60" placeholder="이름" />
					</div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<form:password path="password" id="password" title="비밀번호" size="20" maxlength="20" placeholder="비밀번호"/>
						<div><form:errors path="password" cssClass="error" /></div>
					</div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<input name="password2" id="password2" title="비밀번호확인" type="password" size="20" maxlength="20" placeholder="비밀번호확인"/>
					</div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<form:input path="moblphonNo" id="moblphonNo" title="핸드폰번호" size="20" maxlength="15" placeholder="핸드폰번호"/>
						<div><form:errors path="moblphonNo" cssClass="error" /></div>
					</div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<form:input path="mberEmailAdres" id="mberEmailAdres" title="이메일주소" size="30" maxlength="50" placeholder="이메일주소"/>
						<div><form:errors path="mberEmailAdres" cssClass="error" /></div>
					</div>
					<div class="join_int_box_join login_int_t" style="display:flex;">
						<img style="margin-top:4px;" src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시" />
						<form:input path="adres" id="adres" title="동호수" size="70" maxlength="100" placeholder="동호수"/>
						<div><form:errors path="adres" cssClass="error" /></div>
					</div>
					<input name="mberSttus" id="mberSttus" type="hidden" value="A"/>
					
					<div class="btm_box_bt">
						<a class="normal_bt _fl" href="${pageContext.request.contextPath}/smartVillage/loginView.mdo">취소</a>
						<a class="normal_bt _fr _blue" href="javascript:fnInsert()">회원가입</a>
					</div>
				</form:form>
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
	</body>
</html>



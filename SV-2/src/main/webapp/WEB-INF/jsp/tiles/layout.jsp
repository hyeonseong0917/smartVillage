<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/hls.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/googleChart.js"></script>
	
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
		</script>
		
	</head>

	<body>
		<div id="sb-site">
			<tiles:insertAttribute name="header"/>
			<tiles:insertAttribute name="content"/>
			<tiles:insertAttribute name="footer" />
		</div>
		<tiles:insertAttribute name="right"/>
	</body>
</html>
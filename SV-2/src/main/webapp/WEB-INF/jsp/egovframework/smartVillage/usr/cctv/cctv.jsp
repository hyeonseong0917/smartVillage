<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javaScript" language="javascript">
	$(function() {
	 	$("._step_01").click(function () {
	 		var cctvId = this.id;
			var video = document.getElementById('video');
			var videoSrc = "";
			$.getJSON("${pageContext.request.contextPath}/smartVillage/cctv/getCctvUrl.mdo", {cctvId:encodeURI(cctvId)}, function(json){
				var cctvUrl = json.cctvUrl;
				if (video.canPlayType('application/vnd.apple.mpegurl')) {
					video.src = cctvUrl;
					video.addEventListener('loadedmetadata', function () {
						video.muted = 'muted';
						video.autoplay = 'autoplay';
						video.playsinline = 'true';
						video.play();
					});
				} else if (Hls.isSupported()) {
					var hls = new Hls();
					hls.loadSource(cctvUrl);
					hls.attachMedia(video);
					hls.on(Hls.Events.MANIFEST_PARSED, function () {
						video.muted = 'muted';
						video.autoplay = 'autoplay';
						video.playsinline = 'true';
						video.play();
					});
				}
				
				$('.cctv_video_box').show();
			});
		});
	});
	window.onload = () => {
		position();
	}

	window.onresize = () => {
		position();
	}

	function position() {	
		const vw100 = $('.villageMap').width();
		const vh100 = $('.villageMap').height();
		
		/* background image size (source) */
		
		const bgw = 1480
		const bgh = 600
		
		/* projected background image size and position */
		
		const bgscale = Math.max(vh100 / bgh, vw100 / bgw)
		
		const projectedWidth= bgw * bgscale | 0
		const projectedHeight = bgh * bgscale | 0
		
		const leftOverflow = (projectedWidth- vw100) / 2 | 0
		const topOverflow= (projectedHeight - vh100) / 2 | 0
		
		console.log(bgscale.toFixed(2), projectedWidth, projectedHeight, leftOverflow, topOverflow)
		
		const w = projectedWidth - leftOverflow;
		const h = projectedHeight - topOverflow;
		var t = 0;
		var l = 0;
		
		t = Math.round((h* 0.20 * bgscale.toFixed(2)));
		$('#1').css({ top : t + "px"});
		
		t = Math.round((h* 0.15 * bgscale.toFixed(2)));
		$('#2').css({ top : t + "px"});
		
		t = Math.round((h* 0.15 * bgscale.toFixed(2)));
		$('#3').css({ top : t + "px"});
		
		t = Math.round((h* 0.03 * bgscale.toFixed(2)));
		$('#4').css({ top : t + "px"});
		
		t = Math.round((h* 0.27 * bgscale.toFixed(2)));
		$('#5').css({ top : t + "px"});
		
		t = Math.round((h* 0.31 * bgscale.toFixed(2)));
		$('#6').css({ top : t + "px"});
		
		t = Math.round((h* 0.12 * bgscale.toFixed(2)));
		$('#7').css({ top : t + "px"});		
		
		t = Math.round((h* 0.18));
		$('#8').css({ top : t + "px"});
	}
</script>
<style type="text/css">
	/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
	
	.villageMap p span.arrow_box {
		display: none ;
		position: absolute;
		width: 60px; height:60px;
		left: -12px;
		top: -76px;
		border-radius: 60px;
		color: #fff;
		font-size: 14px;padding:8px 0 0; letter-spacing:-.05rem;
		background: url(../img/background/cctv.png) center top no-repeat; background-size:60px;
	}
	
	.villageMap p:hover{ transform:0.5s all scale(0.8);}
	
	.villageMap p span.arrow_box i{border-top:0 none; font-size:13px; display: block; margin-top:18px; }
	
	.villageMap p span.arrow_box:after {
		position: absolute;
		bottom: 97%;
		left:12px ;bottom:-31px;
		width: 0;
		height: 0;
		border: solid transparent;
		border-color: rgba(51, 51, 51, 0);
		border-bottom-color:#0D9DFF;
		border-width: 18px;
		pointer-events: none;
		content: ' ';
		transform:rotate(180deg);
	}
	.villageMap p:hover span {
		display: block;
	}
</style>
<div class="title_box">
	<div class="title_box_inner">
		<h3>Environment</h3>
		<ul class="m_04">
			<i></i>
			<li class="txt1">빌리지 내 <span class="_txt_blue">CCTV</span><span class="_txt_green">영상</span></li>
			<li>공용공간 <span class="_txt_blue">CCTV</span>영상 공유로 <span class="_txt_green">안전하고</span><span class="_txt_blue">편안한</span>삶</li>
		</ul>
	</div>
</div>

<div class="sub_container">
	<div class="villageMap">
		<div class="con_tit_box">
			<h4>CCTV</h4>
		</div>
		<!--컨텐츠 타이틀 : e-->
		
		<p id="1" class="_step_01" style="left:44%; top:20%; transform:translateY(0%)"><span class="arrow_box "><i>놀이터</i></span>1번</p>
		<p id="2" class="_step_01" style="left:12%; top:15%; transform:translateY(-100%)"><span class="arrow_box "><i>횡단보도</i></span>2번</p>
		<p id="3" class="_step_01" style="left:37%; top:15%; transform:translateY(-200%)"><span class="arrow_box "><i>놀이터2</i></span>3번</p><
		<p id="4" class="_step_01" style="left:32%; top:3%; transform:translateY(-300%)"><span class="arrow_box "><i>주 출입로</i></span>4번</p>
		<p id="5" class="_step_01" style="left:61%; top:27%; transform:translateY(-400%)"><span class="arrow_box "><i>횡단보도</i></span>5번</p>
		<p id="6" class="_step_01" style="left:73%; top:31%; transform:translateY(-500%)"><span class="arrow_box "><i>편의점</i></span>6번</p>
		<p id="7" class="_step_01" style="left:67%; top:12%; transform:translateY(-600%)"><span class="arrow_box "><i>스마트팜</i></span>7번</p>
		<p id="8" class="_step_01" style="left:73%; top:18%; transform:translateY(-700%)"><span class="arrow_box "><i>주요도로</i></span>8번</p>
		
		
		<div class="cctv_video_box" style="position: absolute;display:none;bottom:0px;background:#0E0F1B;padding:15px 20px;z-index: 9990;color:rgba(255,255,255,1)">
			<video-player class="ng-star-inserted">
				<video id="video" width="100%" class="video_cctv _videostyler_" controls="" style="filter: brightness(100%) contrast(100%) saturate(100%) grayscale(0%) invert(0%) sepia(0%) hue-rotate(0deg) blur(0px);"></video>
			</video-player>
		</div>
	</div>
</div>
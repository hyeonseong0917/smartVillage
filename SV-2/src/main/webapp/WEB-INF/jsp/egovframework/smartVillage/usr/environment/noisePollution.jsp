<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
	
	.villageMap a p span.arrow_box {
		display: none;
		position: absolute;
		width: 80px; height:80px;
		left: -22px;
		top: 53px;
		border-radius: 100px;
		color: #fff;
		font-size: 14px;padding:8px 0 0; letter-spacing:-.05rem;
	}
	
	.villageMap a p span.arrow_box i{border-top:1px solid rgba(255,255,255,.4); font-size:22px; display: block; margin-top:-2px; }
	.villageMap a p span.arrow_box i:before{content: ' ';position: absolute;}
	.villageMap a p span.arrow_box._step_01{background:linear-gradient(180deg, rgba(13,157,255,1) 54%, rgba(0,103,172,1) 81%, rgba(41,131,245,1) 88%, rgba(0,255,255,1) 95%);}
	.villageMap a p span.arrow_box._step_01:after {  border-bottom-color: #0D9DFF;}
	.villageMap a p span.arrow_box._step_02{ background:linear-gradient(180deg, rgba(172,196,40,1) 54%, rgba(84,96,19,1) 81%, rgba(186,212,37,1) 88%, rgba(216,249,30,1) 95%);}
	.villageMap a p span.arrow_box._step_02:after {  border-bottom-color: #ACC428;}
	
	.villageMap a p span.arrow_box._step_03{ background:linear-gradient(180deg, rgba(204,153,0,1) 54%, rgba(106,80,0,1) 81%, rgba(236,177,0,1) 88%, rgba(254,231,24,1) 95%);}
	.villageMap a p span.arrow_box._step_03:after {  border-bottom-color: #CC9900;}
	
	.villageMap a p span.arrow_box._step_04{ background:linear-gradient(180deg, rgba(221,51,72,1) 54%, rgba(122,20,33,1) 81%, rgba(224,71,90,1) 88%, rgba(255,43,90,1) 95%);}
	.villageMap a p span.arrow_box._step_04:after {  border-bottom-color: #DD3348;}
	
	
	
	.villageMap a p span.arrow_box:after {
		position: absolute;
		bottom: 97%;
		left:16px ;top:-40px;
		width: 0;
		height: 0;
		border: solid transparent;
		border-color: rgba(51, 51, 51, 0);
		border-width: 24px;
		pointer-events: none;
		content: ' ';
	}
	.villageMap a p:hover span {
		display: block;
	}
	#step_01 {
		left:15%;
		transform:translateY(0%);
	}
	#step_02 {
		left:70%;
		transform:translateY(-100%);
	}
	#step_03 {
		left:65%;
		transform:translateY(-200%);
	}
	#step_04 {
		left:68%;
		transform:translateY(-300%);
	}
	#step_05 {
		left:35%;
		transform:translateY(-400%);
	}
	#step_06 {
		left:40%;
		transform:translateY(-500%);
	}
	#step_07 {
		left:49%;
		transform:translateY(-600%);
	}
	#step_08 {
		left:62%;
		transform:translateY(-700%);
	}
</style>

<script type="text/javaScript" language="javascript">
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
		
		const bgw = 1480;
		const bgh = 600;
		
		/* projected background image size and position */
		
		const bgscale = Math.max(vh100 / bgh, vw100 / bgw);
		
		const projectedWidth  = bgw * bgscale | 0;
		const projectedHeight = bgh * bgscale | 0;
		
		const leftOverflow = (projectedWidth  - vw100) / 2 | 0;
		const topOverflow  = (projectedHeight - vh100) / 2 | 0;
		
		console.log(bgscale.toFixed(2), projectedWidth, projectedHeight, leftOverflow, topOverflow);
		
		const w = projectedWidth - leftOverflow;
		const h = projectedHeight - topOverflow;
		var t = 0;
		var l = 0;
		  	
		t = Math.round((h* 0.19 * bgscale.toFixed(2)));
		$('#step_01').css({ top : t + "px"});
						  	
		t = Math.round((h* 0.43 * bgscale.toFixed(2)));
		$('#step_02').css({ top : t + "px"});
						  	
		t = Math.round((h* 0.15 * bgscale.toFixed(2)));
		$('#step_03').css({ top : t + "px"});
		
		t = Math.round((h* 0.18 * bgscale.toFixed(2)));
		$('#step_04').css({ top : t + "px"});
		
		t = Math.round((h* 0.09 * bgscale.toFixed(2)));
		$('#step_05').css({ top : t + "px"});
		
		console.log(t);
		t = Math.round((h* 0.13 * bgscale.toFixed(2)));
		$('#step_06').css({ top : t + "px"});
		
		t = Math.round((h* 0.23 * bgscale.toFixed(2)));
		$('#step_07').css({ top : t + "px"});
		t = Math.round((h* 0.37));
		$('#step_08').css({ top : t + "px"});

	}

	function aa() {

		const vw100 = window.innerWidth;
		const vh100 = window.innerHeight;

		/* background image size (source) */
		const bgw = 2368;
		const bgh = 1473;

		/* projected background image size and position */
		const bgscale = Math.max(vh100 / bgh, vw100 / bgw);

		const projectedWidth  = bgw * bgscale | 0;
		const projectedHeight = bgh * bgscale | 0;
		
		const leftOverflow = (projectedWidth  - vw100) / 2 | 0;
		const topOverflow  = (projectedHeight - vh100) / 2 | 0;

		//console.log(bgscale.toFixed(2), projectedWidth, projectedHeight, leftOverflow, topOverflow)
	}
	
	function moveTab(tabId) {
		var frm = $('<form></form>');
		
		frm.attr("name", "frm");
		frm.attr("method", "post");
		frm.attr("action", "${pageContext.request.contextPath}/smartVillage/environment/environmentInfo.mdo");
		
		frm.append($('<input/>', {type: 'hidden', name: 'tabId', value: encodeURI(tabId)}));
		
		frm.appendTo('body');
		
		frm.submit();
	}
</script>
<div class="title_box">
	<div class="title_box_inner">
		<h3>Environment</h3>
		<ul class="m_02">
		<i></i>
			<li class="txt1">빌리지 내 <span class="_txt_blue">대기환경</span><span class="_txt_green">정보</span> 사용량</li>
			<li>청량한 <span class="_txt_blue">공기</span>, <span class="_txt_green">자연</span>이 함께하는 풍요로운 삶</li>
		</ul>
	</div>
</div>
  
<div class="topM_box">
	<div class="topM_box_inner">
		<p class="_6 _m02"><a href="javascript:moveTab('fine_dust')" class=""><i ></i>미세먼지</a></p>
		<p class="_6 _m02"><a href="javascript:moveTab('ultra_particles')" class=""><i ></i>초미세먼지</a></p>
		<p class="_6 _m02"><a href="javascript:moveTab('temperature')" class=""><i ></i>온도</a></p>
		<p class="_6 _m02"><a href="javascript:moveTab('humidity')" class=""><i ></i>습도</a></p>
		<p class="_6 _m02"><a href="javascript:moveTab('ilumination')" class=""><i ></i>조도</a></p>
		<p class="_6 _m02"><a href="javascript:moveTab('noise_pollution')" class="active"><i ></i>소음</a></p>
	</div>
</div>

<div class="sub_container">
	<div class="villageMap">
		<div class="con_tit_box">
			<h4>소음</h4>
		</div>
		<!--컨텐츠 타이틀 : e  -->
		<div id="chart_div" style="width: 400px; height: 200px; position: absolute; top: 0px; right: 0px;"></div>		
		<c:forEach items="${environmentInfo}" var="environmentInfo" varStatus="status">
			<a class="" href="#none">
				<p id="step_0${status.count}" class="_step_04">
					<span class="arrow_box _step_04">
						${environmentInfo.thingModelAttributeName }
						<i>${environmentInfo.thingModelAttributeValue }</i>
					</span>
					${environmentInfo.thingModelAttributeValue }
				</p>
			</a>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    var specialDiv = $('#chart_div');
    console.log(specialDiv);
    $('.villageMap a p').hover(
        function() {
        	
    		var textContent = $(this).find('span.arrow_box').text();
            let firstLine = textContent.split('\n')[1];

	         // 공백 제거
	         let curPos = firstLine.replace(/\s/g, '');
	
	         let info=[];
        	$.getJSON("${pageContext.request.contextPath}/smartVillage/environment/getChartData.mdo", {tabId:encodeURI('noise_pollution')}, function(json){
        		$(this).find('span.arrow_box').css('display', 'none');
        		var jsonData = json.environmentChartInfo;
        		console.log(jsonData);
        		if(jsonData == undefined || jsonData == ""){
    				return;
    			} else {
    				console.log(jsonData);
    			}
        		/* console.log(curPos); // 출력: "Thisis" */
        		let arr=[];
        		for(var i=0;i<jsonData.length;++i){
        			if(jsonData[i].thingModelAttributeName==curPos){
        				arr.push(jsonData[i]);
        			}
        		}
        		/* console.log(arr); */
        		let hashMap={};
        		
        		for(var i=0;i<arr.length;++i){
        			var curTime=arr[i].measurementTime;
        			var curClock=curTime.substring(0,2);
        			if(!(curClock in hashMap)){
        				hashMap[curClock]=1;
        				info.push(arr[i]);
        			}
        		}
        		var chartData=[
        			['시','소음']
        		];
        		for(var i=0;i<info.length;++i){
    				let tmpPos=[];
    				tmpPos.push(info[i].measurementTime.substring(0,2)+"시")
    				tmpPos.push(parseInt(info[i].thingModelAttributeValue));
    				chartData.push(tmpPos);
    			}	
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable(chartData);
                    var view = new google.visualization.DataView(data);
                    view.setColumns([
    					0,
    					1,  // 전년 물 사용량 열
    				    {
    				        calc: function(dataTable, rowIndex) {
    				            // 소수점 둘째 자리까지 반올림하여 실수 값을 반환합니다.
    				            return parseFloat(dataTable.getValue(rowIndex, 1)).toFixed(2);
    				        },
    				        sourceColumn: 1,
    				        type: "string",
    				        role: "annotation"
    				    },

                        ]);
                    var options = {
                        title: '실시간 소음',
                        curveType: 'function', // 꺾은선 그래프로 설정
                        legend: { position: 'bottom' },
                        fontSize: 7,
                        pointSize: 5, // 데이터 포인트 크기 지정
                        pointShape: { type: 'circle' },
                        annotations: {
    				        textStyle: {
    				            fontSize: 7,   // 원하는 폰트 크기
    				            bold: true,     // 굵게 설정
    				        }
    				    },
    				    backgroundColor: '#74ada7',
    				    /* backgroundColor: '#89c756', */
                    };

                    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                    /* chart.draw(data, options); */
                    chart.draw(view, options);
                    
                }

                $(this).find('span.arrow_box').css('display', 'block');
                specialDiv.show();
                
        	})
        	var mouseX = event.pageX; // 마우스의 현재 x좌표
            var mouseY = event.pageY; // 마우스의 현재 y좌표
            console.log("마우스의 현재 위치 - x: " + mouseX + ", y: " + mouseY);
            var chartDiv = document.getElementById('chart_div');
            chartDiv.style.position = 'absolute';
            /* chartDiv.style.left = mouseX + 30 + 'px';
            chartDiv.style.top = mouseY - 300 + 'px'; */
        },
    );
});
</script>
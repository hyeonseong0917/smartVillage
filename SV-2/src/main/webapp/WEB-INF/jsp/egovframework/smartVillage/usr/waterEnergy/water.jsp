<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
   <meta charset="UTF-8">
   <title>Your Page Title</title>
   <style>
      body {
         background-color: #ff0000; /* 배경 색상을 여기에 지정 */
      }
   </style>
</head>
</html>

<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	$(function() {
		var date = new Date();
		$("#useDate").text(date.getMonth()+1 + ".1~현재");
	});
	function drawChart() {
		$.getJSON("${pageContext.request.contextPath}/smartVillage/waterEnergy/getChartData.mdo", {tabId:encodeURI('water')}, function(json){
			
			var jsonData = json.chartInfo;
			if(jsonData == undefined || jsonData == ""){
				return;
			} else {
				let chartData = [['월', '전년 물 사용량', '물 사용량']];
				for(var i=0; i<jsonData.length; i++){
					let prevRecentDifference = jsonData[i].prevUsages - jsonData[i].recentUsages;
					let data = [jsonData[i].regYear+jsonData[i].regMonth, jsonData[i].prevUsages, jsonData[i].recentUsages,];
					chartData.push(data);
				}
				
				var data = google.visualization.arrayToDataTable(chartData);
				var view = new google.visualization.DataView(data);
				view.setColumns([
					0,
					1,  // 전년 물 사용량 열
				    {
				        calc: "stringify",
				        sourceColumn: 1,
				        type: "string",
				        role: "annotation"
				    },
				    2,  // 물 사용량 열
				    {
				        calc: "stringify",
				        sourceColumn: 2,
				        type: "string",
				        role: "annotation"
				    }
                    ]);
				var options = {
					title: "월별 물 사용량 추이",
					height: 200,
					legend: { position: "bottom" },
					/* chartArea: { left: 20, top: 20, width: '200%', height: '200%'}, */
					tooltip : {
					  /* trigger: 'both', */
					  isHtml: true,
			          showColorCode: true,
			          trigger: 'both',
					},
					annotations: {
				        textStyle: {
				            fontSize: 10,   // 원하는 폰트 크기
				            bold: true,     // 굵게 설정
				        }
				    },
				    
					
				};
				
				var formatter = new google.visualization.NumberFormat({ pattern: '0' });
	            formatter.format(data, 1);
	            formatter.format(data, 2);
	            
	            var tooltipColumns = [0, 1, 2];
	            for (var i = 0; i < jsonData.length; i++) {
	                var formattedValue = formatter.formatValue(data.getValue(i, 1)) + ' / ' + formatter.formatValue(data.getValue(i, 2));
	                data.setFormattedValue(i, 1, data.getValue(i, 1));
	                data.setFormattedValue(i, 2, data.getValue(i, 2));
	            }
	            
	            
	            var chart = new google.visualization.ColumnChart($(".graph_box")[0]);

	            chart.draw(view, options);
	            
			}
		});
	}	
	
	function moveTab(tabId) {
		var frm = $('<form></form>');
		
		frm.attr("name", "frm");
		frm.attr("method", "post");
		frm.attr("action", "${pageContext.request.contextPath}/smartVillage/waterEnergy/waterEnergyUsage.mdo");
		
		frm.append($('<input/>', {type: 'hidden', name: 'tabId', value: encodeURI(tabId)}));
		
		frm.appendTo('body');
		
		frm.submit();
	}
</script>
<div class="title_box">
	<div class="title_box_inner">
		<h3>Water & Energy</h3>
		<ul class="m_01">
			<i></i>
			<li class="txt1">우리집 <span class="_txt_blue">물</span>・<span class="_txt_green">에너지</span> 사용량</li>
			<li>깨끗한 <span class="_txt_blue">물</span>, <span class="_txt_green">그린 에너지</span>로 자연과 사람이 공존하다.</li>
		</ul>
	</div>
</div>

<div class="topM_box" >
	<div class="topM_box_inner" >
		<p><a href="javascript:moveTab('water')" class="active m_01"><i ></i>물</a></p>
		<p><a href="javascript:moveTab('electric')" class=" m_02"><i ></i>전기</a></p>
		<p><a href="javascript:moveTab('cooling')" class=" m_03"><i ></i>냉방</a></p>
		<p><a href="javascript:moveTab('heating')" class=" m_04"><i ></i>난방</a></p>
		<p><a href="javascript:moveTab('hotWater')" class=" m_05"><i ></i>급탕</a></p>
	</div>
</div>

<div class="sub_container" >
	<div class="con_title_box" >
		<div class="con_title_box_inner" >
			<h4>전년 동기대비 물 사용량</h4>
		</div>
	</div>
	<!--컨텐츠 타이틀 : e-->

	<div class="data_box">
		<ul class="defTable" >
			<li>물 사용 기간<span id="useDate"></span></li>
			<li>현재 사용량<span>${usageInfo.recentUsage } m<sup>3</sup></span></li>
			<li>전년동기 사용량<span>${usageInfo.prevUsage } m<sup>3</sup></span></li>
		</ul>
		<div class=m_01_compare_prev>${usageInfo.recentUsage } <br>/ ${usageInfo.prevUsage }</div>
	</div>
	<div class="graph_box">데이터가 없습니다.</div>
</div>
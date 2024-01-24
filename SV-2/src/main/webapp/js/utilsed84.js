/*
 * Copyright 2020 Korea Institute of Science and Technology Information.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

/*메인 메뉴 아코디언 */
$(function() {
  $( "#accordion_mobile" ).accordion({
    heightStyle: "content",
    active:""
  });
});

function showGoogleMap() {
	function renderMap(element, t) {
		var wkt = new Wkt.Wkt();
		// Read in any kind of WKT string
		wkt.read(t);
		var geojson = wkt.toJson();
	  // console.log("GeoJson?", geojson);
	  var map = new google.maps.Map(element, {
			mapTypeId : 'terrain',
			zoom : 10,
			center : {
				lat : 0,
				lng : 0
			}
		})
	  
	  var feature = {
			type : 'Feature',
			geometry : geojson, // pass parsed GEOJSON here
			properties : {
				letter : "G",
				color : "blue",
				rank : "7",
				ascii : "71"
			}
		}
		map.data.addGeoJson(feature);
	
		//Create empty bounds object
		var bounds = new google.maps.LatLngBounds();
	
		// Loop through features
		map.data.forEach(function(feature) {
			var geo = feature.getGeometry();
			geo.forEachLatLng(function(LatLng) {
				bounds.extend(LatLng);
			});
		});
	
		map.fitBounds(bounds);
	}

	$('.wkt-geo').each(function(index, element) {
	  renderMap(element, element.dataset.value);
	});		
}

function modal(url, size, params) {

	params = $.extend({
		backdrop : 'static',
		keyboard : false,
		loaded : null,
		fade : false,
		show : false 
	}, params);

	var loaded = false;
	var shown = false;

	var $div = $('<div class="modal" tabindex="-1" role="dialog">'
			+ '<div class="modal-dialog" role="document">'
			+ '<div class="modal-content">'
			+ '<div class="loader"></div>'
			+ '</div></div></div>');
	if (params.fade)
		$div.addClass('fade');
	if (size)
		$div.find('.modal-dialog').addClass('modal-' + size);
	var $modal = $div.appendTo('body').modal(params);
	$modal.on('hidden.bs.modal', function() {
		$modal.removeData('bs.modal');
		$modal.remove();
	}).on('shown.bs.modal', function() {
		shown = true;
		autofocus();
	}).on('modal.complete', function() {
		$modal.modal('hide');
	}).on('modal.error', function(xhr) {
		showerror(xhr);
	});
	if (params.content && $(params.content).length) {
		$modal.find('.modal-content').append($(params.content));
	} else {
		$modal.find('.modal-content').load(url, function(response, status, xhr) {
			// TODO 로그인페이지로 이동시 location.reload(true);
			if ( status == "error" ) {
		    showerror(xhr);
		  }
			if (params.loaded)
				params.loaded();
			loaded = true;
			autofocus();
		});
	}
	
	function showerror(xhr) {
		$modal.find('.modal-content').html(  
			'<div class="alert alert-danger">' +
			'<h2><strong class="text-primary">요청 처리 중 오류가 발생하였습니다</h2>' +
			'<p class="mgb_30">' + xhr.status + " " + xhr.statusText + '</p>' +
			'<p class="mgb_30">잠시 후에 다시 시도해 보세요. 오류가 지속되면 관리자에게 문의하시기 바랍니다</p>' +
			'<button type="button" class="btn btn-default btn-lg" data-dismiss="modal">닫기</button>' +
			'</div></div>'
		);
		$modal.modal({keyboard: true});//esc
	}

	function autofocus() {
		if (shown && loaded) {
			setTimeout(function() {
				//console.log('autofocus', $modal.find('[autofocus]'));
				$modal.find('[autofocus]').eq(0).focus();
			}, 100);
		}
	}
	
	$modal.modal('show');
	
	return $modal;
}

function submit($form, fullscreen) {
	var done = false;
	var full = fullscreen | $form.closest('.modal').length == 0;
	var wait = full ? $(document.body) : $form;
	wait.waitMe();
	var $ajax = $.ajax({
		url : $form.attr('action'),
		type : 'post',
		data : $form.serialize(),
		dataType : 'json',
		cache: false
	}).done(function(data, status, xhr) {
    // 작업후에 페이지를 이동하는 것이 일반적이며
    // 이때 waitMe('hide')를 할 경우 깜빡임이 보인다
    // 그래서 성공한 경우는 waitMe 를 숨기지 않는다
    done = true;
	}).fail(function(xhr, status, error) {
		// 실패는 호출자에서 처리
	}).always(function() {
		if (!done)
			wait.waitMe('hide');
	});
	$form.on('form.stop', function() {
		wait.waitMe('hide');
	});
	return $ajax;
}

function submitAjax($form, success, fail) {
	var done = false;
	$form.waitMe();
	return $.ajax({
		url : $form.attr('action'),
		type : 'post',
		data : $form.serialize(),
		dataType : 'json',
		cache: false
	}).done(function(data, status, xhr) {
		console.log('submitAjax', data);
		var loc = xhr.getResponseHeader('Location');
		done = true;
		if (loc) 
			location = loc;
		else if (success)
			success(data);
	}).fail(function(xhr, status, error) {
		if (fail)
			fail(error);
		else
			location.reload();
	}).always(function() {
		if (!done)
			$form.waitMe('hide');
	});
}

function copyText($el) {
	// https://velog.io/@godori/js-clipboard-copy
	/*
	var textarea = document.createElement('textarea');
	textarea.value = text;
	document.body.appendChild(textarea);

	textarea.select();
	textarea.setSelectionRange(0, 9999); // 추가
	document.execCommand("copy");
	document.body.removeChild(textarea);
	*/

	//https://developers.google.com/web/updates/2015/04/cut-and-copy-commands
	window.getSelection().removeAllRanges();
	var range = document.createRange();
	range.selectNode($el[0]); // 첫번째 엘리먼트만?
	console.log($el[0]);
	window.getSelection().addRange(range);

	var success = false;
	try {
		// Now that we've selected the anchor text, execute the copy command
		success = document.execCommand('copy');
		console.log('Copy command was ' + success);
	} catch(err) {
	    console.log('Oops, unable to copy', err);
	}

	// Remove the selections - NOTE: Should use
	// removeRange(range) when it is supported
	if (window.getSelection().removeRange) {
		window.getSelection().removeRange(range);
	} else {
		window.getSelection().removeAllRanges();
	}
	
	return success;
}

// https://blog.abelotech.com/posts/number-currency-formatting-javascript/
function formatNumber(num) {
    return ('' + num).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}

//https://stackoverflow.com/questions/23593052/format-javascript-date-as-yyyy-mm-dd
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}

// 이 함수는 macros 에서 fancySize 를 참고
// UI 에서 사용하는 함수와 동일한 방식으로
function fancySize(size) {
    if (size < 1000) {
            return formatNumber(size) + ' Bytes';
    } else if (size < (1000 * 1000)) {
            return formatNumber(Math.round(size * 100 / 1000.0) / 100) + ' Kb';
    } else if (size < (1000 * 1000 * 1000)) {
            return formatNumber(Math.round(size * 100 / 1000.0 / 1000) / 100) + ' Mb';
    } else {
            return formatNumber(Math.round(size * 100 / 1000.0 / 1000 / 1000) / 100) + ' Gb';
    }
}

Vue.filter('formatDate', function(ts) {
	return formatDate(ts);
});
Vue.filter('formatNumber', function(n) {
	return formatNumber(n);
});
Vue.filter('fancySize', function(size) {
	return fancySize(size);
});


<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<script src="jquery-1.11.1.min.js "></script>
<title>DUMBOs</title>
<style>
a{text-decoration:none;}li{list-style:none;}
html, body {
    height:95%;
}

#map-container {
    width: 100%;
    height: 800;
    position: fixed;
    
    background-color:black;    
}

#map-canvas
{
    width: 100%;
    height: 100%;
    opacity:0.7;
}
#panel {
	position: fixed;
	width:500px;
	top: 50%;
	left: 50%;
	margin-left: -250px;
	z-index: 5;
	background-color:#fffdf1;
	padding: 5px;
	border: 1px solid #999;
	opacity:0.85;
}

#address{width:400px;}


#main_article{
	z-index:1;
	border-bottom : 1px solid gray;
	position:absolute;
	top:80px;
	display:block;
}

.maemool{
	
}

</style>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCSmYzxbP4onIPhfbHrbLH_QYbjGKpdGRI&v=3.exp&libraries=places"></script>
<script>

   	var geocoder;
   	var map;
   var mainMap;
	var x=0;

   
   var markers=[];  /// test 
   
   /////////////////////////////////////////////////////////////////////할것 . - > 매물들 임시로 한 20개 정도 위도경도 알아내서 테스트하기 . 지하철역으로 검색하기 만들기 . 매물을 클릭했을때 어떻게 나와야될지 고민학
   
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//									  				초기화														//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	function initialize() {
		var w= window.innerWidth || document.documentElement.clientWidth
		|| document.body.clientWidth;
		document.getElementById("main_article").style.marginLeft=w*3/4+'px';
		
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(37.397, 127);
		var mapOptions = {
			zoom : 9,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		//////////////////////////////////////////////////////////////////////////////////////// 장소 자동완성 기능 

		var input = (document.getElementById('address'));
		var defaultBounds = new google.maps.LatLngBounds(
				new google.maps.LatLng(33.8902, 126.1759),
				new google.maps.LatLng(33.8474, 126.2631));

		var options = {
			bounds : defaultBounds,
			types : [ 'geocode' ],
		componentRestrictions: {country: 'kr'}
		};
		var autocomplete = new google.maps.places.Autocomplete(input, options);
		autocomplete.bindTo('bounds', map);

		google.maps.event.addListener(autocomplete, 'place_changed',
				function() {
					document.getElementById("address").value = '';
					var place = autocomplete.getPlace();
					if (!place.geometry) {
						return;
					}
					// If the place has a geometry, then present it on a map.
					if (place.geometry.viewport) {
						map.fitBounds(place.geometry.viewport);
					} else {
						map.panTo(place.geometry.location);
						map.setZoom(17); // Why 17? Because it looks good.
						goAddressAndChangeCSS(); // 검색시 바뀌는 CSS !! 

					}
					var address = '';

				});
		
						////////////////////////////////////////////////////테스트 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		 google.maps.event.addListener(map, 'click', function(event) {
			    addMarker(event.latLng);
			  });
		google.maps.event.addListener(map,'dragend',function(event){
			var bound = map.getBounds();
			if(markers.length>0){
				
				$("#main_article").empty();

			for(var i =0 ; i < markers.length;i++){
				if(bound.contains(markers[i].getPosition())){
					
					dragendAndChangeCSS();
				}
				else{
				}
			}
			
			}
			});

	}																		
	function addMarker(location) {
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
		markers.push(marker);
	}
										////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////// 지오 코딩 검색시 !!

	function codeAddress() {
		
		var address = document.getElementById('address').value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				map.setZoom(17);
				goAddressAndChangeCSS();  // 검색시 바뀌는 CSS !! 
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//											주소치면 바뀌는 것														//
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function goAddressAndChangeCSS() {
		var w = window.innerWidth || document.documentElement.clientWidth
				|| document.body.clientWidth;
		var h = window.innerHeight || document.documentElement.clientHeight
				|| document.body.clientHeight;

		document.getElementById("map-canvas").style.opacity = 1.0;
		document.getElementById("map-container").style.backgroundColor = 'white';
		document.getElementById("address").style.width = w*1/4-30+'px';
		document.getElementById("panel").style.opacity = 1.0;
		document.getElementById("panel").style.width = w*1/4 +'px';


		$("#map-canvas").animate({	'top' : 40,	'height' : (h - 40),'width' : w * 3 / 4}, 'slow');
		$("#panel").animate({'top' :40,'margin-left':w * 1 / 4+2}, 'slow');
		$("#address").animate({'width':w*1/4-130 }, 'slow');
		
		$("#nav").animate({'left' : 0}, 1000);}
	
	function dragendAndChangeCSS(){
		
		var w= window.innerWidth || document.documentElement.clientWidth
		|| document.body.clientWidth;
		$("<div class='maemool'/>").appendTo("#main_article");
			$("<a  href=item.do ><img src='http://placehold.it/100x100' /></a>").appendTo("#main_article");
			$("<p> 주소 : 수원시 팔달구 원천동</p>").appendTo("#main_article");
			$("<p> 평 수 : 10 평 </p>").appendTo("#main_article");
			$("<p>방 구하실 때, 발품 팔며 돌아다니느라 고생 많으셨죠? 이제 대한민국 1위 전월세 부동산앱인 직방에서 쉽고 편리하게 방 구하세요!</p>").appendTo("#main_article");
		$("</div>").appendTo("#main_article");
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
</script>
</head>
<body>
	
	<div id="panel">
		
		<input id="address" type="textbox" placeholder="주소로 검색"> 
		
		<input type="button" value="SEARCH" onclick="codeAddress()">
		
	</div>
	
	<div id="map-container">
		<div id="map-canvas"></div>
	</div>
	
	<article id="article">
		<div id="main_article"></div>
	</article>

	

</body>
</html>
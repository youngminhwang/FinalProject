<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />

  <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />




<c:import url="/WEB-INF/views/layout/header.jsp" />

<link rel="stylesheet" type="text/css" href="../../resources/css/weather-icons.min.css">

<script type="text/javascript">
$(document).ready(function(){
	
	
	//window.navigator.geolocation.getCurrentPosition() API를 사용
	//성공 시 showLocation함수 호출, 실패 시 showError함수 호출
	if(window.navigator.geolocation) {
		window.navigator.geolocation.getCurrentPosition(showLocation,showError)
	}
	
	$("#searchAddress").click(function(){
		console.log("#searchAddress clicked")
		
		if($('#address').val()===""){
			alert("지역을 입력해주세요")
			return
		}
		
		$.ajax({
			type:"get",			//요청 메소드
			url:"/main/address",				//요청 URL
			data:{address:$('#address').val()},			//요청 파라미터, 전달 데이터
			dataType:"json",		//응답받을 데이터 형식
			success:function(res){	//AJAX응답 성공 시 콜백
				console.log("AJAX성공")
				
				console.log(res)
				
			    var weatherIcon = getWeatherIcon()
				
				for(var key in weatherIcon){
					if(key==res.icon){
					console.log('키 : '+key + ', 값 : ' + weatherIcon[key])
					$("#wicon").empty();
					$('#wicon').append('<i class="' + weatherIcon[key] +'" style="font-size:270px;"></i>');
					}
				}
				
	 	        //날씨정보 출력
	 	        $("#city").html("");
	 	       	$("#temp").html("");
	 	      	$("#humidity").html("");
	 	      	$("#windSpeed").html("");
	 	      	$("#condition").html("");
	 	      	
	 	        $("#city").html(res.city)
	 	        $("#temp").html("기온 : " + res.temp + "°C")
	 	        $("#humidity").html("습도 : " + res.humidity + "%")
	 	        $("#windSpeed").html("풍속 : " + res.windSpeed + "m/s")
	 	        $("#condition").html(res.condition)
			},
			error:function(){	//AJAX응답 실패 시 콜백
				console.log("AJAX실패")
				alert("시 군 구 로 입력해주세요.")
			}
		})
	})
	
	
	var typingBool = false; 
	var typingIdx=0; 
	// 타이핑될 텍스트를 가져온다 
	var typingTxt = "러브체인";
	typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
	if(typingBool==false){ 
	  // 타이핑이 진행되지 않았다면 
	   typingBool=true;     
	   var tyInt = setInterval(typing,500); // 반복동작 
	} 
	     
	function typing(){ 
	  if(typingIdx<typingTxt.length){ 
	    // 타이핑될 텍스트 길이만큼 반복 
	    $("#searchPlant").append(typingTxt[typingIdx]);
	    // 한글자씩 이어준다. 
	    typingIdx++; 
	   } else{ 
	     //끝나면 반복종료 
	    clearInterval(tyInt); 
	   } 
	} 
	
	
	
	$('#searchPlant').focus(function(){
		$('#searchPlant').empty()
		
	})
	$('#searchIcon').hover(function(){
		$( '#btnPlant' ).attr( 'width', '35' );
		$( '#btnPlant' ).attr( 'height', '35' );
	}, function(){
		$( '#btnPlant' ).attr( 'width', '25' );
		$( '#btnPlant' ).attr( 'height', '25' );
	})
	
	
	
	$('.naverSearch').click(function(){
		
		if($('#searchPlant').text() ==""){
			alert("검색어를 입력해주세요.")
			return
		}
		
		$.ajax({
			type:"get",			//요청 메소드
			url:"/main/naverSearch",				//요청 URL
			data:{searchTxt:$('#searchPlant').text()},			//요청 파라미터, 전달 데이터
			dataType:"json",		//응답받을 데이터 형식
			success:function(res){	//AJAX응답 성공 시 콜백
				console.log("AJAX성공")
				console.log(res)
				console.log(res.length)
				var info = "<a class='modal_close_btn' style='display:inline-block;position:sticky;top:10px;left:550px;cursor:pointer;'>닫기</a>"
				for(var i=0; i<res.length; i++){
					info += "<br><h3>"+res[i].title+"</h3><br>"
					info += "<img src='"+res[i].thumbnail+"' width=160 height=160 alt='이미지 없음'><br><br>"
					info += res[i].description+"<br>"
					info += "<a href='"+res[i].link+"' target='_blank'>상세보기 페이지로 이동</a><br><br>"
					info += "<hr style='border:2px solid #878787; height: 2px !important; display: block !important; width: 100% !important;''/>"
				}	
				
				$("#my_modal").html(info);
				modal('my_modal')
			},
			error:function(){	//AJAX응답 실패 시 콜백
				console.log("AJAX실패")
			}
		})
	})
	$('#searchIcon').click(function(){
		$.ajax({
			type:"get",			//요청 메소드
			url:"/main/searchPlant",				//요청 URL
			data:{searchTxt:$('#searchPlant').text()},			//요청 파라미터, 전달 데이터
			dataType:"json",		//응답받을 데이터 형식
			success:function(res){	//AJAX응답 성공 시 콜백
				console.log("AJAX성공")
				if(res.no===""){
					alert("검색 결과가 없습니다.")
					return;
				}
				console.log(res)
				plantModal(res)
			},
			error:function(){	//AJAX응답 실패 시 콜백
				console.log("AJAX실패")
			}
		})
	})
	
}) //$(document).ready(function(){})  end
function plantModal(res){
	var info = "<a class='modal_close_btn' style='display:inline-block;position:sticky;top:10px;left:550px;cursor:pointer;'>닫기</a><br>"
	info += "식물학 명 : "+res.plntbneNm+"<br><br>"
	info += "식물영 명 : "+res.plntzrNm+"<br><br>"
	info += "유통 명 : "+res.distbNm+"<br><br>"
	info += "과 명 : "+res.fmlCodeNm+"<br><br>"
	info += "원산지 : "+res.orgplceInfo+"<br><br>"
	info += "성장 높이 : "+res.growthHgInfo+"<br><br>"
	info += "성장 넓이 : "+res.growthAraInfo+"<br><br>"
	info += "생장속도 : "+res.grwtveCodeNm+"<br><br>"
	info += "생육 온도 : "+res.grwhTpCodeNm+"<br><br>"
	info += "겨울 최저 온도 : "+res.winterLwetTpCodeNm+"<br><br>"
	info += "습도 : "+res.hdCodeNm+"<br><br>"
	info += "비료 : "+res.frtlzrInfo+"<br><br>"
	info += "토양 : "+res.soilInfo+"<br><br>"
	info += "물주기 봄 : "+res.watercycleSprngCodeNm+"<br><br>"
	info += "물주기 여름 : "+res.watercycleSummerCodeNm+"<br><br>"
	info += "물주기 가을 : "+res.watercycleAutumnCodeNm+"<br><br>"
	info += "물주기 겨울 : "+res.watercycleWinterCodeNm+"<br><br>"
	info += "병충해 관리 : "+res.dlthtsManageInfo+"<br><br>"
	info += "특별관리 : "+res.speclmanageInfo+"<br><br>"
	info += "기능성 : "+res.fncltyInfo+"<br><br>"
	info += "광요구도 : "+res.lighttdemanddoCodeNm+"<br><br>"
	
	$("#my_modal").html(info);
	modal('my_modal')
}
function showLocation(event) {
		//위도
		var latitude = event.coords.latitude
		//경도
	    var longitude = event.coords.longitude
	    
	    getWeather(latitude, longitude)
}
function getWeatherIcon(){
	var weatherIcon = {
    		'01d' : 'wi wi-day-sunny',
    		'02d' : 'wi wi-day-cloudy',
    		'03d' : 'wi wi-cloud',
    		'04d' : 'wi wi-cloudy',
    		'09d' : 'wi wi-day-showers',
    		'10d' : 'wi wi-day-rain',
    		'11d' : 'wi wi-day-lightning',
    		'13d' : 'wi wi-day-snow',
    		'50d' : 'wi wi-day-fog',
    		
    		'01n' : 'wi wi-night-clear',
    		'02n' : 'wi wi-night-alt-cloudy',
    		'03n' : 'wi wi-cloud',
    		'04n' : 'wi wi-cloudy',
    		'09n' : 'wi wi-night-alt-showers',
    		'10n' : 'wi wi-night-alt-rain',
    		'11n' : 'wi-night-alt-lightning',
    		'13n' : 'wi wi-night-alt-snow',
    		'50n' : 'wi wi-night-fog'
	};
	
	return weatherIcon
}
function getWeather(latitude, longitude){
	
    var weatherIcon = getWeatherIcon()
    //날씨 정보 얻어오기
    $.ajax({
		type:"get",			
		url:"/main/weather",			
		data:{ latitude:latitude, longitude:longitude },		
		dataType:"json",
		success:function(res){	
			
			console.log("AJAX성공")
			console.log(res);
			
			for(var key in weatherIcon){
				if(key==res.icon){
				console.log('키 : '+key + ', 값 : ' + weatherIcon[key])
				$("#wicon").html("");
				$('#wicon').append('<i class="' + weatherIcon[key] +'" style="font-size:270px;"></i>');
				}
			}
			
 	        //날씨정보 출력
 	        $("#city").html("");
 	       	$("#temp").html("");
 	      	$("#humidity").html("");
 	      	$("#windSpeed").html("");
 	      	$("#condition").html("");
 	      	
 	        $("#city").html(res.city)
 	        $("#temp").html("기온 : " + res.temp + "°C")
 	        $("#humidity").html("습도 : " + res.humidity + "%")
 	        $("#windSpeed").html("풍속 : " + res.windSpeed + "m/s")
 	        $("#condition").html(res.condition)
		},
		error:function(){	
			console.log("AJAX실패")
		}
	})
}
function showError(event) {
  alert("위치 정보를 얻을 수 없습니다.")
}
</script>

<style type="text/css">
ul{
	text-decoration: none;
	list-style:none;
}
/* li:hover{ */
/* 	font-size:40px; */
/* 	background:#white; */
/* } */
.nav>li>a:hover{
	background:#white;
}
#search div{
	font-size:35px;
	text-align:left;
}
#searchPlant div{
	border-bottom:1px solid #ccc;
}
#searchPlant:focus{ 
	outline:none;
} 
.nav {
   position: relative;
   height:620px;
   text-align:center;
}
.nav ul li{
	width:230px;
	height:80px;
}
.nav ul li a{
	color:#688331;
	font-size:35px;
}
.nav ul li a:hover{
	color:black;
	font-size:45px;
	text-decoration: none;
}
#my_modal {
    display: none;
    width: 600px;
    height:600px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    overflow:scroll;
}
#my_modal .modal_close_btn {
    position: absolute;
    top: 10px;
    right: 10px;
}
#address:focus{
	outline: none;
}
/* #myplant{ */
/* 	overflow:auto; */
/* 	border:1px solid #ccc; */
/* 	width:397px; */
/* 	height:150px; */
/* } */
td{
	text-align:center;
	width:150px;
}
tr{
	border-bottom:1px solid #ccc;
}

      html, body {
        position: relative !important;
        height: 100% !important;
        width : 1200px !important;
		margin : auto !important;
		background:white;
      }

      body {
        background: #eee !important;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif !important;
        font-size: 14px !important;
        color: #000 !important;
        margin: 0 !important;
        padding: 0 !important;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      #header{
      	background-color:white !important;
      }
      #wrap-box-bottom{
      	background-color:white !important;
      	margin-top:0;
      }
      
      
</style>


 <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
      	
      	<div class="swiper-slide">
        <div id="search">
			<div style="margin-top:0;font-size:105px;">
				나는 <span contenteditable="true" id="searchPlant" style="width:500px;display:inline-block;color:#688331;font-size:105px;text-align:center;"></span>&nbsp를<br>
				잘 키우는 방법이<br>
				궁금하다. <span id="searchIcon"><svg id="btnPlant" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-up-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M14 2.5a.5.5 0 0 0-.5-.5h-6a.5.5 0 0 0 0 1h4.793L2.146 13.146a.5.5 0 0 0 .708.708L13 3.707V8.5a.5.5 0 0 0 1 0v-6z"/></svg></span>
			</div>
			<div><a class="naverSearch" style="margin-left:10px;cursor:pointer;">네이버 백과로 검색하기</a></div>
		</div>
        </div>
      	
      	<div class="swiper-slide">
        <div class="weather" style="width:100%;">
		
			<div id="wicon" class="col-xs-offset-2 col-xs-3"style="margin-top:30px;margin-right:30px;"></div>
			
			<div style="margin-left:0px;">
				<span style="font-size:43px;" id="city"></span><br>
				<span style="font-size:43px;" id="condition"></span><br>
				<span style="font-size:43px;" id="temp"></span><br>
				<span style="font-size:43px;" id="humidity"></span><br>
				<span style="font-size:43px;" id="windSpeed"></span><br>
				
				<input type="text" name="address" id="address" style="margin-left:540px;border:none;border-bottom:1px solid black;">
				<button id="searchAddress">검색</button>
			
			</div>
			
		</div>
        </div>
      	
        <div class="swiper-slide">
        <div style="width:60%;height:70%;"><img src="<%=request.getContextPath() %>/upload/${dailyPlant.imgStoredName }"alt="그림을 불러오지못함" style="width:100%;height:100%;"></div>
        <div style="margin-left:50px;">
			<table>
				<tr style="height:50px;">
					<td style="font-size:50px;" colspan="2">추천 식물 소개</td>
				</tr>
				<tr style="height:40px;">
					<td>식물명:</td>
					<td>${dailyPlant.name }</td>
				</tr>
				<tr style="height:40px;">
					<td>물주기:</td>
					<td>${dailyPlant.water }</td>
				</tr>
				<tr style="height:40px;">
					<td>햇빛:</td>
					<td>${dailyPlant.sun }</td>
				</tr>
				<tr style="height:40px;">
					<td>습도:</td>
					<td>${dailyPlant.humidity }</td>
				</tr>
			</table>
		</div>
        </div>
        
        
        
        
      </div>
      <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        direction: "vertical",
        slidesPerView: 1,
        spaceBetween: 30,
        mousewheel: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
    </script>














<!-- -------------------------------------------------- -->
<div>
	<span id="my_modal"></span>
</div>

<script>
	function modal(id) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);
	
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = document.createElement('div');
	    bg.setStyle({
	        position: 'fixed',
	        zIndex: zIndex,
	        left: '0px',
	        top: '0px',
	        width: '100%',
	        height: '100%',
	        overflow: 'auto',
	        // 레이어 색갈은 여기서 바꾸면 됨
	        backgroundColor: 'rgba(0,0,0,0.4)'
	    });
	    document.body.append(bg);
	
	    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	    	bg.remove();
	        modal.style.display = 'none';
	    });
	
	    modal.setStyle({
	        position: 'fixed',
	        display: 'block',
	        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	        // 시꺼먼 레이어 보다 한칸 위에 보이기
	        zIndex: zIndex + 1,
	
	        // div center 정렬
	        top: '50%',
	        left: '50%',
	        transform: 'translate(-50%, -50%)',
	        msTransform: 'translate(-50%, -50%)',
	        webkitTransform: 'translate(-50%, -50%)'
// 	        overflow:'hidden'
	    });
	}
	
	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};
</script>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
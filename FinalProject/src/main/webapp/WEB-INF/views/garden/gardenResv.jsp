<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/calender.css">
<link rel="stylesheet" href="/resources/css/custom-scrollbar.css">
<link rel="stylesheet" href="/resources/js/custom-scrollbar.js">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<head>

<style type="text/css">

a { text-decoration:none } 
.select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
.header-menu-box ::after {
  content: none;
}

 #ampm #relDetail{
 	overflow: hidden;
    -webkit-text-size-adjust: 100%;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    box-sizing: border-box;
    float: left;
    width: 33%;
    padding: 0 20px 17px 20px;
    border-right: 1px solid #d8d9db;
}  

 .container { height:600px; max-height: 600px;}
 #gardenList {float: left}
 #ampm {float: left ; position: relative; }
 #relDetail { position: relative;}
 #wrap-box-bottom {height: 5px} 
/*
  .flex-container{ 
            width: 100%; 
            height: 100%; 
            display: -webkit-box; 
            display: -moz-box;
            display: -ms-flexbox; 
            display: flex; 
 
            -webkit-box-align: center; 
            -moz-box-align: center;
            -ms-flex-align: center;
            align-items: center; 
 
            -webkit-box-pack: center;
            -moz-box-pack: center; 
            -ms-flex-pack: center; 
            justify-content: center;
        } 
 */
/* .btn-success{height:4em; border-color:transparent; background-color: }     */
/* .gardens .{color:green } */
/* .{height:4em; border-color: !important; background-color:green !important; color:#fff !important }    */

::-webkit-scrollbar {
    display: none;
 
  .linear_gradient {
        background: linear-gradient(#28a745,white);   
}

    </style>
    
    

<script type="text/javascript">

	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});

 $(document).ready(function() {

	$( function() {
	    $( "#datepicker" ).datepicker({
             minDate: "-2M", 
             maxDate: "+2M"
	    });
	    console.log("datepicked")
	    
	  } );

	  

 
	// DB 연동하여 수목원 리스트 표시 
	$.ajax({
		url:"/garden/getGardenList",
		type: "get",
		data:{},
		dataType: "json",
		success: function(res){
			console.log(res.gardenList.length)
			var str = "";
			str += '<input style="width:0px" type="radio" name="gardenName" id="gardenNameBasic" value="noneChecked">'
			for(var i=0; i<res.gardenList.length; i++){
	 			str += '<input type="radio" class="btn-check btn-block " name="gardenName" id="gardenName' 
 				str += i
 				str += '" value="'
 				str += res.gardenList[i]
 				str += '" autocomplete="off" checked>'
	 			str += '<label class="btn btn-success" style="width:100%; text-align:center" for="gardenName'
 				str += i
 				str += '">'
				str +='<span class="gardens" style="vertical-align: middle;">'
				str += res.gardenList[i]
				str +='</span>'
				str += '</label><br>'
			}
				$("#parkChoice").html(str)
				$(":radio[name='gardenName']").attr('checked', true);

		},
		error: function(){
			console.log(" getGardenList error")
		}
	})


	
	//인원조정 버튼 클릭시
	
// 	$("#container input[type='button'], #container input[type='radio']")
	$("#container").find("input[type='button'], input[type='radio']").click(function() {
		var formValues = $("#totalThey").serialize();
	  	console.log("relDetail click");

  	 	console.log("formValues",formValues)
		$.ajax({
		  		url:"/garden/reserveCalc",
		  		type: "post",
		  		data: formValues,
		  		dataType: "json",
		  		success: function(res){
		  			console.log("calcBtn success")
		  			console.log("calcBtn res",res)
		  			$("#totalPrice").html(res.totalPrice)
		  			$("#totalPrice").append(' 원')
		  		},
		  		error: console.log("calcBtn error")
  		})
	})

 //예약하기 버튼을 누르면 예약정보를 DB에 저장, 동시에 예약 결과 화면으로 이동한다. 
 	$("#goToRes").click(function(){
	  	console.log("goToRes click");
	  	
 		var formValues = $("#totalThey").serialize();
 
  	 	console.log("formValues",formValues)
		$.ajax({
		  		url:"/garden/saveReserve",
		  		type: "post",
		  		data: formValues,
		  		dataType: "json",
		  		success: function(res){
		  	 		if(res.gardenName == 'noneChecked'){
		  	 			alert("공원을 선택해주세요")
		  	 			return;
		  	 		}
		  	 		else if(res.visitDate == 'noneChecked'){	
		  	 			alert("날짜를 선택해주세요")
		  	 			return;
		  	 		} 
		  	 		else if(res.visitTime == 'noneChecked'){
		  	 			alert("방문 시간을 선택해주세요")
		  	 			return;
		  	 		} 
		  	 		else if(res.adultMem=='0' && res.childMem =='0' && res.disabMem=='0'){
		  	 			alert("인원수를 선택해주세요")
		  	 			return;
		  	 		} else {
		  			console.log(res)
		  			console.log("calcBtn success")
		  			window.location.replace("/garden/reserveRes")
		  	 		}
		  		},
		  		error: console.log("calcBtn error")
  		})
 	})
 	

 	
 
 }) //document.ready end
 

	function adultCount(type)  {
		

// 	 console.log($("#datepicker").val()=='')
// 	 console.log($("input[name='gardenName']:checked").val() == 'noneChecked')
// 	 console.log($("input[name='time']:checked").val() == 'noneChecked')
	 
	 if($("input[name=gardenName]:checked").val() != 'noneChecked' && 
		$("input[name=time]:checked").val() != 'noneChecked' && 
		$("#datepicker").val() !=''){
	 
		  let number = $("#adultTotal").text();
		  console.log("number",number)
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  if(number > 0){
		  	$("#adultTotal").html('&nbsp;&nbsp;'+number+'&nbsp;&nbsp;');
			$("#adult").attr('value',number)
		  }
		  else {
			$("#adultTotal").html('&nbsp;&nbsp;'+0+'&nbsp;&nbsp;'); 
			$("#adult").attr('value','0')
		  }

	 } else {
		 alert("가실 수목원과 날짜, 시간을 선택해주세요")
	 }
	}

	function childCount(type)  {
		
		if($("input[name=gardenName]:checked").val() != 'noneChecked' && 
				$("input[name=time]:checked").val() != 'noneChecked' && 
				$("#datepicker").val() !=''){
			 
		  let number = $("#childTotal").text();
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  if(number > 0){
		  	$("#childTotal").html('&nbsp;&nbsp;'+number+'&nbsp;&nbsp;');
			$("#child").attr('value',number)}
		  else{
			$("#childTotal").html('&nbsp;&nbsp;'+0+'&nbsp;&nbsp;');  
			$("#child").attr('value','0')}
     }else {
		 alert("가실 수목원과 날짜, 시간을 선택해주세요")
	 }
	}
	 
	function disabCount(type)  {
		
		if($("input[name=gardenName]:checked").val() != 'noneChecked' && 
			$("input[name=time]:checked").val() != 'noneChecked' && 
			$("#datepicker").val() !=''){
	
		  let number = $("#disabTotal").text();
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		    number = parseInt(number) - 1;
		  }
		  if(number > 0){
		  	$("#disabTotal").html('&nbsp;&nbsp;'+number+'&nbsp;&nbsp;');
			$("#disability").attr('value',number)}
		  else{
			$("#disabTotal").html('&nbsp;&nbsp;'+0+'&nbsp;&nbsp;'); 
			$("#disability").attr('value','0')}
		}else {
			 alert("가실 수목원과 날짜, 시간을 선택해주세요")
		 }
	}

 
	

</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form name="totalThey" id="totalThey">
	<div id="container" class="container modern-skin">

	   <div id="gardenList" style=" height:90%; width:33%; padding-right: 3% " > 
	   	<div style="height: 5%;"></div> 
	   	<div style="height: 5%; text-align: center"> 예약하실 수목원을 선택하세요 </div>
	   	<div style="height: 3%;"></div> 
	  <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style=" overflow: auto; height:90%; width: 100%; sc"> 
 		 <div id="parkChoice" style=" height: 582px; width: 80%; margin: auto" > </div> 
		 
		</div> 
	   </div> 
		   
	  <div id="dateCon"  style=" width:33%; height:100%; float: left">
		<div id="resDate" style="position:relative; height: 50%; width: 100%;float: left ">
			<div style="height: 10%"></div>
			<div style="position:relative;  text-align: center">
				예약하실 날짜를 선택하세요.
				<input type="text" name="datepicker" id="datepicker" style="width:100%">
			</div>
		</div>
		<div id="ampm" style="position:relative; height: 50%; width: 100%;">
			<table style="position:relative; width: 80%; margin: auto; top: 25%">
				<tr><td style="text-align: center;">방문하실 시간을 선택해주세요.</td></tr>
				<tr style="height: 10px"></tr>
				<tr>
					<td>
						<input type="radio" class="btn-check" name="time" id="morning" value="morning" autocomplete="off" checked>
						<label class="btn btn-success" for="morning" style="width: 100%; ">
							<span style="vertical-align: middle;">오전</span>
						</label><br>
					</td>
				</tr>
				<tr style="height: 10px"></tr>
				<tr>
					<td>
					<input type="radio" class="btn-check" name="time" id="afternoon" value="afternoon" autocomplete="off" checked>
					<label class="btn btn-success" for="afternoon" style="width: 100%">
						<span style="vertical-align: middle;">오후</span>
					</label><br>
					</td>
				</tr>
				<tr style="height: 10px"></tr>
				<tr>
					<td>
					<input type="radio" class="btn-check" name="time" id="night" value="night" autocomplete="off" checked>
					<label class="btn btn-success" for="night" style="width: 100%">
						<span style="vertical-align: middle;">야간</span>
					</label>
					</td>
				</tr>
				<tr>
					<td style="height:0px">
					<input type="radio" class="btn-check" name="time" id="noTime" value="noneChecked" autocomplete="off" checked>
					</td>
				</tr>
			</table>
		</div>
	  </div> 
		
		<div id="relDetail" style="position:relative; width:33%;  float: right; height: 100%">
			<div style="height: 5%"></div>
			<div style="height:5%; text-align: center;">
				인원수를 선택하세요.
			</div>	
			<div style="position:relative; float:relative; height:80%; width: 100%">
				<table style=" margin: auto auto; position:relative; float: relative; top:25% ">
					<tr>
						<th style="width: 40%; ">어른</th>
						<td><input type='button' onclick='adultCount("plus")' value='+'/>
							<span id='adultTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
							<input type='button' onclick='adultCount("minus")' value='-'/>
							<input type="hidden" name="adult" id="adult" value="0"></td>
					</tr>
					<tr style="height: 10px"></tr>
					<tr>
						<th style="width: 40%; ">소아</th>
						<td><input type='button' onclick='childCount("plus")' value='+'/>
						<span id='childTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
						<input type='button' onclick='childCount("minus")' value='-'/>
						<input type="hidden" name="child" id="child" value="0"></td>
					</tr>
					<tr style="height: 10px"></tr>
					<tr>
						<th style="width: 40%; ">우대</th>
						<td><input type='button' onclick='disabCount("plus")' value='+'/>
						<span id='disabTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
						<input type='button' onclick='disabCount("minus")' value='-'/>
						<input type="hidden" name="others" id="disability" value="0"></td>
					</tr>
					
				</table>
			</div>	
<!-- 		 
			<div style="height:65%;">
				<div style="position:absolute; left:37%; top:35%; float:relative; align-items:center ; ">
					<div class="flex-container">
					어른	&nbsp; &nbsp; &nbsp; &nbsp;
						<input type='button' onclick='adultCount("plus")' value='+'/>
						<span id='adultTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
						<input type='button' onclick='adultCount("minus")' value='-'/>
						<input type="hidden" name="adult" id="adult" value="0">
					</div>
				<div style="display: block; height: 10px;"></div>
				
				<div style="display: block; width: width: 100%;">
					<div class="flex-container">				
				소아 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type='button' onclick='childCount("plus")' value='+'/>
					<span id='childTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
					<input type='button' onclick='childCount("minus")' value='-'/>
					<input type="hidden" name="child" id="child" value="0">
					</div>
					<div style="display: block; height: 10px;"></div>
				</div>
				
			<div style="display: block; ">
				<div class="flex-container">		
				우대&nbsp; &nbsp; &nbsp; &nbsp;
					<input type='button' onclick='disabCount("plus")' value='+'/>
					<span id='disabTotal'>&nbsp;&nbsp;0&nbsp;&nbsp;</span>
					<input type='button' onclick='disabCount("minus")' value='-'/>
					<input type="hidden" name="others" id="disability" value="0">
					<div style="display: block; height: 10px;"></div>
				</div>
			</div>
		</div>		
		
	-->
	<div style="position: absolute; display:block; text-align: right; height:20% ;  right: 0; bottom: 0">
	총합 
		<span id="totalPrice"> 0 원</span> <br>
		<button type="button" class="btn btn-info" id="goToRes">  <span style="vertical-align: middle;">예약하기</span> </button>
		
	</div>
		</div>
	</div>
	
</div>
</form>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

</body>
</html>
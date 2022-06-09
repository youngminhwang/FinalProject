<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style type="text/css">

body {
	background-color: #FBF8EF;
	font-family :'Do Hyeon', sans-serif; 
 	font-size : 18px;
 	text-align : center;
}

#wrap-top {
	width : 200px;
	height : 100px;
	padding : 20px;
	margin : auto;
}

#wrap-bottom {
	width : 300px;
	height : 400px;
	margin : auto;
}

#wrap-bottom > div {
	margin : 0px 0px 5px 0px;
}

input {
	text-align : center;
}

.bname:hover{
	background-color : #d9edf7;
	cursor : pointer;
}

</style>

<script type="text/javascript">
window.onload = function() {
	
	const input = document.getElementById('search-input');
	const button = document.getElementById('search-button');
	const auto = document.getElementById('wrap-bottom');
	
	input.onkeydown = function() {
		
		let checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(input.value != null && input.value != '' && input.value.length > 1 && checkKor.test(input.value)) {
		
			const xhr = new XMLHttpRequest();
			
			const url = '/myplant/search?stext=' + input.value;
			
			xhr.open('GET', url);
			
			xhr.send(); 
		
			xhr.onreadystatechange = function() {
		
				if(xhr.readyState !== XMLHttpRequest.DONE) return;
		
				if(xhr.status === 200) {
			
					const result = JSON.parse(xhr.response);
					
					let html = '';
					
					for(let i = 0; i < result.bname.length; ++i){
						html += "<div class='bname'><span>" + result.bname[i] + "</span></div>"
						html += "<div class='cnum' hidden='true'><span>" + result.cnum[i] + "</span></div>"
					}
					
					if( result.bname.length == 10) {
						html += '<div>.</div><div>.</div>'
					}
					
					auto.innerHTML = html;
					
					const bname = document.getElementsByClassName('bname');
					const cnum = document.getElementsByClassName('cnum');
					
					for(let i = 0; i < bname.length; ++i){
						
						bname[i].onclick = function() {
							
							opener.document.getElementById('bname').value = bname[i].textContent;
							opener.document.getElementById('cnum').value = cnum[i].textContent;
							
							let str = '';
							str += '/myplant/searchresult?bname=' + bname[i].textContent + '&cnum=' + cnum[i].textContent;
							
							location.href= str;
							
						}
						
					}
					
				}
				
			};
			
		}
				
	};
			
};
</script>

</head>

<body>
	<div id="wrap-top">
		<span>식물명을 검색 하세요!</span>
		<div class="input-group">
		  <input type="text" class="form-control" id="search-input" aria-describedby="basic-addon2">
		  <span class="input-group-addon" id="basic-addon2"><span class="glyphicon glyphicon-search"></span></span>
		</div>
	</div>
	<div id="wrap-bottom">
		
	</div>
</body>
</html>
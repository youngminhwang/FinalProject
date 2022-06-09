<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#profile-box {
	display : inline-flex;
	width : 800px;
	height : 600px;
	margin : auto;
}

#profile-box > div {
	width : 400px;
	height : 550px;
	padding :50px;
	margin : 50px 0px 0px 0px;
}

.img-thumbnail {
	width : 300px;
	height : 300px;
}

#upload-box {
	width : 300px;
	height :47px;
}

#upload {
	visibility : hidden;
}

#img-name {
	width : 300px;
	height : 34px;
	margin : 13px 0px 0px 0px;
	padding : 6px 0px 6px 0px;
	text-align :center;
}

label {
	margin : 0px;
}

label:hover {
	cursor : pointer;
}

.table {
	margin : 0px 0px 0px 0px;
	text-align : left;
}

.table div {
	display: inline-block;
	width : 200px;
}

input {
	text-align : center;
}

#date {
	padding : 0px;
}

#search-box {
	width : 150px;
}

#water-box {
	width : 150px;
}

#submit {
	margin : 0px 0px 0px 51px;
}


</style>

<div id="wrap-box-top">
	<div><a href="/myplant/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;나의 식물 목록</a></div>
	<div id="title-box">식물 등록하기</div>
	<div></div>
</div>

<form action="/myplant/write" method="post" enctype="multipart/form-data" id="form">
<div id="wrap-box">
	<div id="profile-box">
			<div>
				<div id="img-box">
					<img src="/resources/img/default.jpg" class="img-thumbnail">
				</div>
				<div id="upload-box">
					<div class="bg-info">
						<label for="upload">
							사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
						</label>
					</div>
					<div id="img-name">
					</div>
					<input type="file" accept="image/gif, image/jpeg, image/png" id="upload" name="file" hidden="true">
				</div>
			</div>
			<div>
				<table class="table">
				<tr><td>식물명</td></tr>
				<tr><td>
				<div id="search-box"><input type="text" class="form-control" name="bname" id="bname" value="가울테리아" readonly></div>
				<input type="hidden" name="cnum" id="cnum" value="12938">
				<button type="button" class="btn btn-default" id="search-button">검색</button>
				</td></tr>
				<tr><td>이름</td></tr>
				<tr><td>
					<div><input type="text" name="nick" class="form-control" required 
						  oninvalid="this.setCustomValidity('이름을 입력하세요!')" oninput="this.setCustomValidity('')"></div>
				</td></tr>
				<tr><td>심은날</td></tr>
				<tr><td>
					<div><input type="date" class="form-control" name="birth" id="date" required 
						  oninvalid="this.setCustomValidity('날짜를 입력하세요!')" oninput="this.setCustomValidity('')"></div>
				</td></tr>
				<tr><td>물주기 날짜 간격</td></tr>
				<tr><td>
					<div id="water-box"><input type="text" class="form-control" name="water" required 
										 oninvalid="this.setCustomValidity('숫자를 입력하세요!')" oninput="this.setCustomValidity('')"></div>
					<button type="submit" class="btn btn-success" id="submit">등록 완료</button>
				</td></tr>
				</table>	
			</div>
		</div>
</div>
</form>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

<script type="text/javascript">
const upload = document.getElementById('upload');
const pbox = document.getElementById('img-box');
const nbox = document.getElementById('img-name');

upload.onchange = function() {
	
	pbox.innerHTML = '';
	nbox.textContent = '';
	
	const file = upload.files[0];
	const img = document.createElement('img');
	const url = URL.createObjectURL(file);
	
	img.src = url;
	img.className='img-thumbnail';
	img.style.width = '300px';
	img.style.height = '300px';
	
	pbox.appendChild(img);
	
	const name = file.name;
	
	nbox.innerHTML = name + '&nbsp;<span class="glyphicon glyphicon-remove-circle" id="remove-button"></span>';
	
	const remove = document.getElementById('remove-button');
	
	remove.onclick = function() {
			
		upload.value = '';
		img.src = '/resources/img/default.jpg';
		pbox.appendChild(img);
		nbox.textContent = '';
		
	};
	
};

const search = document.getElementById('search-button');

search.onclick = function() {
	
	window.name = 'writeForm';
	
	let w = (window.screen.width / 2) - 200;
	let h = (window.screen.height / 2) - 250;
	
	window.open('/myplant/searchform', 'searchForm', 'width=400, height=500, left=' + w + ', top=' + h);
	
};
</script>

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
	<div id="title-box">식물 변경하기</div>
	<div></div>
</div>

<form action="/myplant/alter" method="post" enctype="multipart/form-data">
<input type="hidden" name="myPlantNo" value="${myPlant.myPlantNo}">
<div id="wrap-box">
	<div id="profile-box">
			<div>
				<div id="img-box">
					<c:if test="${not empty myPlant.stored}">
						<img src="/upload/${myPlant.stored}" class="img-thumbnail">
					</c:if>
					<c:if test="${empty myPlant.stored}">
						<img src="/resources/img/default.jpg" class="img-thumbnail">
					</c:if>
				</div>
				<div id="upload-box">
					<div class="bg-info">
						<label for="upload">
							사진 첨부&nbsp;<span class="glyphicon glyphicon-picture"></span>
						</label>
					</div>
					<div id="img-name">
						<c:if test="${not empty myPlant.origin}">
							${myPlant.origin}&nbsp;
							<span id="remove-button">
							<span class="glyphicon glyphicon-remove-circle"></span>
							</span>
						</c:if>
					</div>
					<input type="file" accept="image/gif, image/jpeg, image/png" id="upload" name="file" hidden="true">
					<input type="hidden" id="origin" name="origin" value="${myPlant.origin}">
					<input type="hidden" id="stored" name="stored" value="${myPlant.stored}">
				</div>
			</div>
			<div>
				<table class="table">
				<tr><td>식물명</td></tr>
				<tr><td>
					<div id="search-box">
					<input type="text" class="form-control" id="bname" name="bname" value="${myPlant.bname}" readonly>
					</div>
					<input type="hidden" id="cnum" name="cnum" value="${myPlant.cnum}">
					<button type="button" class="btn btn-default" id="search-button">검색</button>
				</td></tr>
				<tr><td>이름</td></tr>
				<tr><td><div><input type="text" name="nick" class="form-control" value="${myPlant.nick}" required 
				 			  oninvalid="this.setCustomValidity('이름을 입력하세요!')" oninput="this.setCustomValidity('')"></div></td></tr>
				<tr><td>심은날</td></tr>
				<tr><td>
					<div><input type="date" class="form-control" name="birth" value="${myPlant.birth}" id="date" required
						  oninvalid="this.setCustomValidity('날짜를 입력하세요!')" oninput="this.setCustomValidity('')"></div>
				</td></tr>
				<tr><td>물주기 간격</td></tr>
				<tr><td>
					<div id="water-box">
					<input type="text" class="form-control" name="water" value="${myPlant.water}" required 
					 oninvalid="this.setCustomValidity('숫자를 입력하세요!')" oninput="this.setCustomValidity('')">
					</div>
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
let remove = document.getElementById('remove-button');

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
	
	remove = document.getElementById('remove-button');
	
	remove.onclick = function() {
			
		upload.value = '';
		img.src = '/resources/img/default.jpg';
		pbox.appendChild(img);
		nbox.textContent = '';
		
	};
	
};

if(remove != null) {
	
	remove.onclick = function() {
		
		pbox.innerHTML = '';
		nbox.textContent = '';
		
		const origin = document.getElementById('origin');
		const stored = document.getElementById('stored');
		
		origin.value = null;
		stored.value = null;
		
		const img = document.createElement('img');
		
		img.src = '/resources/img/default.jpg';
		img.className='img-thumbnail';
		img.style.width = '300px';
		img.style.height = '300px';
		
		pbox.appendChild(img);
	
	};

}

const search = document.getElementById('search-button');

search.onclick = function() {
	
	window.name = 'writeForm';
	
	let w = (window.screen.width / 2) - 200;
	let h = (window.screen.height / 2) - 250;
	
	window.open('/myplant/searchform', 'searchForm', 'width=400, height=500, left=' + w + ', top=' + h);
	
};

</script>

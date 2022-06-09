<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#list {
	width : 1000px;
	height : 600px;	
}

#post-box {
	height: 30px;
	width : 1000px;
	text-align : right;
}

.calendar-box {
	width : 1000px;
	height : 25px;
	padding : 0px 700px 0px 100px;
}

.profile-box {
	display : inline-flex;
	width : 800px;
	height : 150px;
	margin : 0px 100px 5px 100px;
	padding : 10px 5px 10px 5px;
	border : 1px solid black;
}

.profile-box:hover {
	border : 3px solid green;
	cursor : pointer;
}

.img-box {
	width : 130px;
	height : 130px;
}

.img-box > img {
	width : 130px;
	height : 130px;
	padding : 0px;
}

.profile {
	width : 580px;
	height : 130px;
}

.button-box {
	width : 90px;
	height : 130px;
	text-align : right;
}

</style>

<script type="text/javascript">
window.onload = function() {
	
	const profile = document.getElementsByClassName('profile-box');
	const calendar = document.getElementsByClassName('calendar');
	const number = document.getElementsByClassName('number');
	
	for(let i = 0; i < profile.length; ++i){
		profile[i].onmouseover = function(){
			calendar[i].hidden = false;
		}
		profile[i].onmouseout = function(){
			calendar[i].hidden = true;
		}
		profile[i].onclick = function(){
			location.href = '/diary/calendar?no=' + number[i].textContent;
		}
	}
	
	const button = document.getElementById('write-button');
	const text = document.getElementById('write-text');
	
	button.onclick = function() {
		
		if(profile.length == 3) {
			
			text.className = 'text-danger';

			return false;
			
		} else {
			
		location.href = '/myplant/write';
			
		}
		
	}
	
};
</script>

<div id="wrap-box-top">
	<div></div>
	<div id="title-box">나의 식물 목록</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="list">
		<div id="post-box">
		<span class="text-muted" id="write-text">식물은 3개까지 등록할 수 있어요!&nbsp;</span>
		<button type="button" class="btn btn-success btn-sm" id="write-button">식물 등록 하기</button>
		</div>
		<c:forEach items="${list}" var="myPlant">
		<div id="list-box">
			<div class="calendar-box">
				<div class="calendar bg-success" hidden="true">
					<span>캘린더 보기</span>
				</div>
			</div>
			<div class="profile-box">
				<div class="img-box">
					<c:if test="${not empty myPlant.stored}">
						<img src="/upload/${myPlant.stored}" class="img-thumbnail">
					</c:if>
					<c:if test="${empty myPlant.stored}">
						<img src="/resources/img/default.jpg" class="img-thumbnail">
					</c:if>
				</div>
				<div class="profile">
					<table class="table">
						<tr><td>식물명 : </td><td>${myPlant.bname}</td></tr>
						<tr><td>이름 : </td><td>${myPlant.nick}</td></tr>
						<tr><td>심은날 : </td><td>${myPlant.birth}</td></tr>
					</table>	
				</div>
				<div class="button-box">
					<a href="/myplant/alter?no=${myPlant.myPlantNo}">
					<button type="button" class="btn btn-info btn-sm">변경</button>
					</a>
					<a href="/myplant/delete?no=${myPlant.myPlantNo}">
					<button type="button" class="btn btn-warning btn-sm">삭제</button>
					</a>
				</div>
			</div>
			<span class="number" hidden="true">${myPlant.myPlantNo}</span>
		</div>
		</c:forEach>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/calendar.js"></script>

<style type="text/css">
#cal {
	width : 1000px;
	height : 600px;
}

#cal-header {
	display : inline-flex;
	width : 1000px;
	height : 80px;
}

#cal-header > div{
	width : 333px;
	height : 80px;
}

#plant-box {
	width : 200px;
	height : 30px;
	margin : 20px 0px 0px 20px;
	padding : 4px;
	border : 1px solid black;
	border-radius : 10px;
}

#year-box {
	margin : 20px
}

#year {
	display : inline-block;
	margin :0px 10px 0px 10px;
}

#cal-body {
	display : inline-flex;
	margin : 0px 10px 0px 10px;
}

.day-box { 
	width : 120px;
	height : 480px;
	border : 1px solid black;
	margin : 10px;
}

.day-box:hover{
	border : 3px solid green;
	cursor : pointer;
}

.date-box {
	height : 40px;
	padding : 10px 0px 10px 0px;
}

.diary-table {
	margin : 30px 0px;
}
</style>

<div id="wrap-box-top">
	<div><a href="/myplant/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;식물 목록</a></div>
	<div id="title-box">일기 달력</div>
	<div></div>
</div>
<div id="wrap-box">
	<div id="cal">
		<div id="cal-header">
			<div>
			<div id="plant-box">
				<c:out value="${nick}" />의 일기
			</div>
			</div>
			<div>
				<div id="year-box">
					<button class="btn btn-sm" id="prev-week">&lt;</button>
					<div id="year">
					</div>
					<button class="btn btn-sm" id="next-week">&gt;</button>
				</div>
			</div>
			<div>
			</div>
		</div>
		<div id="cal-body">
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>일</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">	
				<span class="date"></span>
				</div>
				<hr>
				<p>월</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>화</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>수</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>목</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>금</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
			<div class="day-box">
				<br>
				<div class="date-box">
				<span class="date"></span>
				</div>
				<hr>
				<p>토</p>
				<table class="table table-striped diary-table">
				</table>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

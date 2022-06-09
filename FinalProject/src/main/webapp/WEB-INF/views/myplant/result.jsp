<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

#table-box {
	width : 400px;
	height : 350px;
	padding : 60px 20px 0px 20px;
	margin :auto;
}

h3 {
	margin : 0px 0px 24px 0px;
}

.table{
	text-align : left;
}

meter {
	width : 100px;
}

span {
	margin : 0px 0px 0px 20px;
	font-size : 15px;
}

#button-box {
	display : inline-flex;
	width : 400px;
	height : 100px;
	padding : 20px 50px 0px 50px;
}

#left-button {
	width : 150px;
	height : 80px;
	text-align : left;
}

#right-button {
	width : 150px;
	height : 80px;
	text-align : right;
}
</style>

</head>

<body>
<div id="table-box">
	<h3 class="bg-info">${plantSum.bname}</h3>
	<table class="table">
	<tr><td>원산지</td><td>${plantSum.home}</td></tr>
	<tr><td>과명</td><td>${plantSum.sort}</td></tr>
	<tr><td>학명</td><td>${plantSum.plname}</td></tr>
	<tr><td>성장 속도</td>
		<td>
			<c:choose>
				<c:when test="${plantSum.glevel eq '느림'}">
					<meter value="2" min="0" max="10" low="3" high="7" optimum="5"></meter><span>느림</span>
				</c:when>
				<c:when test="${plantSum.glevel eq '보통'}">
					<meter value="5" min="0" max="10" low="3" high="7" optimum="5"></meter><span>보통</span>
				</c:when>
				<c:when test="${plantSum.glevel eq '빠름'}">
					<meter value="8" min="0" max="10" low="3" high="7" optimum="0"></meter><span>빠름</span>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr><td>난이도</td>
		<td>
			<c:choose>
				<c:when test="${plantSum.clevel eq '초보자'}">
						<meter value="2" min="0" max="10" low="3" high="7" optimum="0"></meter><span>초보자</span>
				</c:when>
				<c:when test="${plantSum.clevel eq '경험자'}">
						<meter value="6" min="0" max="10" low="3" high="7" optimum="0"></meter><span>경험자</span>
				</c:when>
				<c:when test="${plantSum.clevel eq '전문가'}">
						<meter value="10" min="0" max="10" low="3" high="7" optimum="0"></meter><span>전문가</span>
				</c:when>
			</c:choose>
		</td>
	</tr>
	</table>
</div>
<div id="button-box">
	<div id="left-button"><button class="btn btn-warning">취소</button></div>
	<div id="right-button"><button class="btn btn-success">확인</button></div>
</div>
</body>

<script type="text/javascript">
const button = document.getElementsByClassName('btn');

button[0].onclick = function() {
	
	location.href = '/myplant/searchform';
	
}

button[1].onclick = function() {
	
	window.close();
	
}

</script>

</html>


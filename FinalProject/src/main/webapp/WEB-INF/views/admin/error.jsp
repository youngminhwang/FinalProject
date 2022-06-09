<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/headerm.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		setInterval(function(){
			alert("확인을 누르고 로그인 페이지로 이동합니다")
			location.href="/admin/member/login"
		},3100)
		
		var i = 3;
		setInterval(function(){
			$("#time").text(--i);
		},1000)
	})
</script>

<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
		<div id="title-box">에러 페이지</div>
	<div></div>
</div>
<div id="wrap-box">
	<br><br>
	<h2 style="color:red;">관리자 로그인이 잘못되었습니다</h2>
	
	<span id="time">3</span>초후 로그인 화면으로 이동합니다
	
	<h4>관리자 메인은 아래 버튼을 통해 이동할 수 있습니다</h4>
	
	<button class="btn btn-default" onclick="location.href='/admin/index'">관리자 메인화면으로 이동</button>

</div>


<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
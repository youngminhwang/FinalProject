<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>=== SEEKER ADMIN PAGE ===</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style type="text/css">
*{
 	font-family :'Do Hyeon', sans-serif; 
 	font-size : 18px;
}

body {
	width : 1200px;
/* 	height : 1800px; */
	margin : auto;
}

#header {
	width : 1200px;
	height :130px;
}

#header d{
	height : 100px;
}

#header-box {
	display : inline-flex;
	width : 1200px;
	margin : 0px 0px 0px 0px;
 	border-bottom : 2px solid black;
}

#header-logo-box {
	display : inline-flex;
}

#header-logo {
	width : 150px;
	height : 90px;
	padding : 35px 0px 0px 0px;
	text-align : center;
}

#header-logo h2{
	font-size : 50px;
	margin : 0px 0px 0px 0px;
}

#header-logo-black{
	width : 200px;
	height : 9px;
	background-color : black;
}

.header-menu-box {
	width : 225px;
	padding : 53px 0px 0px 0px;
	text-align : center;
	font-size : 30px;
	color : black;
}

.header-menu-box > a:hover{
	text-decoration-line : none;
	color : black;
}

.header-menu-box > a{
	font-size : 30px;
	color : #688331;
}

#header-login-box {
	width : 130px;
	padding : 20px 0px 0px 0px;
	text-align : right;
}

#header-login-box > a:hover {
	text-decoration-line : none;
	color : black;
}

.header-menu-text-sm {
	font-size : 20px;
}

.header-menu-text-xs {
	font-size : 17px;
}

#hidden-menu-box {
	display : inline-flex;
	width : 1200px;
	height : 25px;
	margin : 0px 0px 5px 0px;
}

#hidden-menu-box > div > a:hover {
	text-decoration-line : none;
}

#hidden-menu-box > div > a > span:hover {
	text-decoration-line : none;
	color : black;
}

#hidden-menu-box > div > a > span {
	margin : 0px 10px 0px 0px;
	padding : 5px 0px 0px 0px;
	color : #688331;
	font-size : 20px;
}

#hidden-menu-board {
	margin : 0px 0px 0px 440px;
}

#hidden-menu-store {
	margin : 0px 0px 0px 22px;
}

#wrap-con {
	width : 1200px;
/* 	height : 1580px; */
	margin : auto;
	position:relative;
}

#wrap-con::after {
	content:"";
	position:absolute;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-color:#ECF8E0;
	background-size:100%;
	z-index:-1;
 	opacity:0.3; 
}

#wrap-box-top {
	display : inline-flex;
	height : 30px;
	font-size : 20px;
	margin : 0px 0px 10px 0px;
	border-top : 1px solid black;
	border-bottom : 1px solid black;
}

#wrap-box-top > div {
	width : 390px;
	height : 30px;
	margin : 0px 5px 0px 5px;
	padding : 4px 0px 0px 0px;
}

#title-box {
	text-align : center;
}

#wrap-box-bottom {
/* 	height : 30px; */
	font-size : 20px;
/* 	margin : 10px 0px 0px 0px; */
	padding : 0px 0px 0px 0px;
	border-bottom : 1px solid black;
}

#wrap-box {
	width :1100px;
/* 	height : 1500px; */
	margin : auto;
	padding : 0px 50px 0px 50px;
	text-align : center;
}
</style>

</head>

<body>
<header id="header">
	<div id="header-box">
		<div id="header-logo-con">
			<div id="header-logo-box">
				<div id="header-logo">
					<h2 style="cursor:pointer" onclick="location.href='/admin/index'">Manager</h2>
				</div>
			</div>
			<div id="header-logo-black">
			</div>
		</div>
		<div class="header-menu-box">
			<a href="/admin/member/list">회원 관리</a>
		</div>
		<div class="header-menu-box" id="menu-box-board">
			<a href="/admin/board/list">게시판 관리</a>
		</div>	
		<div class="header-menu-box" id="menu-box-store">
			<a href="/admin/goods/list">상품 관리</a>
		</div>
		<div class="header-menu-box">
			<a href="/chat/chatList11">1:1 문의 채팅</a>
		</div>
		<div id="header-login-box">
		<c:if test="${empty adminid }">
			<a href="/admin/member/login"><span class="header-menu-text-xs">로그인</span></a>
		</c:if>
		<c:if test="${not empty adminid }">
			<span>관리자님</span>
			<span> | </span>
			<a href="/admin/member/logout" style="color:black;"><span class="header-menu-text-xs">로그아웃</span></a>
		</c:if>
		</div>
	</div>
	<div id="hidden-menu-box">
		<div id="hidden-menu-board">
			<a href="/admin/board/list?cateno=1"><span>자유 게시판</span></a>
			<a href="/admin/board/list?cateno=2"><span>사진 게시판</span></a>
		</div>
		<div id="hidden-menu-store">
			<a href="/admin/goods/register"><span>상품 등록</span></a>
			<a href="/admin/goods/list"><span>상품 목록</span></a>
<!-- 			<a href=""><span>상품 소감</span></a> -->
		</div>
	</div>
</header>
<div id='wrap-con'>
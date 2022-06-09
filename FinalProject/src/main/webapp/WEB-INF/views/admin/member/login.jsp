<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 관리자 헤더m -->
<c:import url="/WEB-INF/views/layout/headerm.jsp"></c:import>

<div id="wrap-box-top">
	<div><a onclick="history.go(-1);" style="cursor:pointer;"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">관리자 로그인</div>
	<div></div>
</div>

<div id="wrap-box">
<br>
<form action="/admin/member/login" method="post" class="form-horizontal">
<div class="form-group">
<label for="adminId" class="col-sm-4 control-label">아이디</label>
<div class="col-sm-6">
<input class="form-control" type="text" id="adminId" name="adminId">
</div>
</div>
<div class="form-group">
<label for="adminPw" class="col-sm-4 control-label">비밀번호</label>
<div class="col-sm-6">
<input class="form-control" type="password" id="adminPw" name="adminPw">
</div>
</div>
<button class="btn btn-info btn-lg">로그인</button>
</form>
</div>

<!-- 관리자 푸터m -->
<c:import url ="/WEB-INF/views/layout/footerm.jsp" ></c:import>
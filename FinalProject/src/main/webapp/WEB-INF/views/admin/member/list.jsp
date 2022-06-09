<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/headerm.jsp" />

<style>
 	table th, td{text-align: center;} 
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	//검색버튼 눌렀을 때 검색
	$("#btnSearch").click(function(){
		console.log("btnSearch clicked")
		location.href="/admin/member/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
	})
	
	//검색창에서 enter키 눌렀을 때도 검색
	$("#search").keydown(function(e){
		if(e.keyCode == 13){//엔터키
			location.href="/admin/member/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
		}
	})
})
</script>

<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">회원관리</div>
	<div></div>
</div>
<div id="wrap-box">

<div class="pull-right form-inline" style="margin-bottom:20px;">
<select id="searchOpt" style="height:34px;border:1px solid #ccc;border-radius:5px;">
	<option value="memberNo">회원번호</option>
	<option value="id">아이디</option>
	<option value="nick">닉네임</option>
</select>
<input type="text" id="search" class="form-control">
<button id="btnSearch" class="btn btn-primary">검색</button>
</div>

<table class="table table-hover clearfix">
<tr>
<th>회원번호</th>
<th>아이디</th>
<th>닉네임</th>
</tr>
<c:forEach items="${memberinfo }" var="i">
<tr onclick="location.href='/admin/member/detail?memberNo=${i.memberNo }'" style="cursor:pointer;">
<td>${i.memberNo }</td>
<td>${i.id }</td>
<td>${i.nick }</td>
</tr>
</c:forEach>
</table>

<!-- 회원 페이징 -->
<c:if test="${not empty paging.search and not empty paging.searchOpt }">
	<c:set var="searchParam" value="&search=${paging.search }&searchOpt=${paging.searchOpt }" />
</c:if>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/admin/member/list${searchParam }">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/admin/member/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/admin/member/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/admin/member/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/admin/member/list?curPage=${i }${searchParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	

	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/admin/member/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/admin/member/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/admin/member/list?curPage=${paging.totalPage }${searchParam }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
<!-- 회원페이징 -->
</div>

<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
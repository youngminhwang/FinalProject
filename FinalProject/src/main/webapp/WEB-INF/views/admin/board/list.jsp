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
		if(${cateno}==0){
			location.href="/admin/board/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
		}
		if(${cateno}!=0){
			location.href="/admin/board/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val()+"&cateno=${cateno}";
		}
		
	})
	
	//검색창에서 enter키 눌렀을 때도 검색
	$("#search").keydown(function(e){
		if(e.keyCode == 13){//엔터키
			if(${cateno}==0){
				location.href="/admin/board/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
			}
			if(${cateno}!=0){
				location.href="/admin/board/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val()+"&cateno=${cateno}";
			}
		}
	})
	
})
</script>

<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
		<c:if test="${cateno eq 0 }">
		<div id="title-box">게시판 관리</div>
		</c:if>
		<c:if test="${cateno eq 1 }">
		<div id="title-box">자유게시판 관리</div>
		</c:if>
		<c:if test="${cateno eq 2 }">
		<div id="title-box">사진게시판 관리</div>
		</c:if>
	<div></div>
</div>
<div id="wrap-box">

<div class="pull-right form-inline" style="margin-bottom:20px;">
<select id="searchOpt" style="height:34px;border:1px solid #ccc;border-radius:5px;">
	<option value="btitle">제목</option>
	<option value="id">아이디</option>
</select>
<input type="text" id="search" class="form-control">
<button id="btnSearch" class="btn btn-primary">검색</button>
</div>

<table class="table table-hover clearfix">
<tr>
<th>번호</th>
<th>제목</th>
<th>아이디</th>
<th>조회수</th>
</tr>
<c:forEach items="${boardinfo }" var="i">
<tr onclick="location.href='/admin/board/detail?boardno=${i.boardno }'" style="cursor:pointer;">
<td>${i.boardno}</td>
<td>${i.btitle }</td>
<td>${i.id }</td>
<td>${i.hit }</td>
</tr>
</c:forEach>
</table>

<!-- 게시판 페이징 -->
<c:if test="${not empty paging.search and not empty paging.searchOpt }">
	<c:set var="searchParam" value="&search=${paging.search }&searchOpt=${paging.searchOpt }" />
</c:if>
<c:if test="${not empty cateno }">
	<c:set var="catenoParam" value="&cateno=${cateno }" />
</c:if>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/admin/board/list${searchParam }${catenoParam }">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/admin/board/list?curPage=${paging.startPage - paging.pageCount }${searchParam }${catenoParam }">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/admin/board/list?curPage=${paging.curPage - 1 }${searchParam }${catenoParam }">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/admin/board/list?curPage=${i }${searchParam }${catenoParam }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/admin/board/list?curPage=${i }${searchParam }${catenoParam }">${i }</a></li>
	</c:if>
	</c:forEach>
	

	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/admin/board/list?curPage=${paging.curPage + 1 }${searchParam }${catenoParam }">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/admin/board/list?curPage=${paging.startPage + paging.pageCount }${searchParam }${catenoParam }">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/admin/board/list?curPage=${paging.totalPage }${searchParam }${catenoParam }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
<!-- 게시판페이징 -->
</div>

</div>

<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
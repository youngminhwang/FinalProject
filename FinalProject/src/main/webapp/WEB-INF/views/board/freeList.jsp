<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header2.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/board/freeWrite"
	})
	
	
})

</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/board/freeWrite"
	})
	
	//검색 버튼 클릭
	$("#btnSearch").click(function() {
		location.href="/board/freeList?search="+$("#search").val();
	});
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<div class="container">

<div id="wrap-box-top">
	<div><a href="/main"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">자유게시판</div>
	<div></div>
</div>

<br><br>

<table class="table table-condensed table-hover">
<!-- <thead> -->
<!-- 	<tr class="warning"> -->
<!-- 		<th style="width: 10%;">글번호</th> -->
<!-- 		<th style="width: 45%;">제목</th> -->
<!-- 		<th style="width: 20%;">작성자</th> -->
<!-- 		<th style="width: 10%;">조회수</th> -->
<!-- 		<th style="width: 15%;">작성일</th> -->
<!-- 	</tr> -->
<!-- </thead> -->
<tbody>
<c:forEach items="${list }" var="board">
	<tr class="success">
		<td>${board.boardno }</td>
		<td><a href="/board/freeView?boardno=${board.boardno }"><c:if test="${board.btitle eq '' }">(not title)</c:if>${board.btitle }</a></td>
		<td>${board.nick }</td>
		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.bdate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>


<hr>

<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<div class="form-inline text-right">
	<input class="form-control" type="text" id="search" value="${param.search }" />
	<button id="btnSearch" class="btn">검색</button>
</div>


<c:import url="./paging.jsp" />
 
</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer2.jsp" />












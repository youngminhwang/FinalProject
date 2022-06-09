<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/headerm.jsp" />

<style>
 	table th, td{text-align: center;} 
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	//게시글 삭제
	$("#btnDel").click(function(){
		console.log("#btnDel clicked")
		if( confirm('게시글을 삭제하면 첨부파일과 댓글도 삭제됩니다. 삭제하시겠습니까?') )
		{
			location.href="/admin/board/delete?boardno=${boardinfo.boardno}&cateno=${boardinfo.cateno}";
		}
	})
	
	$( "[class^='img']" ).on( "error", function() {
      	$(this).hide();
    } );
	
})
</script>

<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
		<div id="title-box">게시판 상세보기</div>
	<div></div>
</div>
<div id="wrap-box">



<table class="table table-striped">

<tr>
<th>제목</th>
<td colspan="7">${boardinfo.btitle }</td>
</tr>

<tr>
<th>아이디</th>
<td>${boardinfo.id}</td>
<th>닉네임</th>
<td>${boardinfo.nick }</td>
<th>조회수</th>
<td>${boardinfo.hit }</td>
<th>작성일</th>
<td><fmt:formatDate value="${boardinfo.bdate }" pattern="yyyy-MM-dd"/></td>
</tr>

<tr>
<th>게시글번호</th>
<td colspan="3">${boardinfo.boardno}</td>
<th>카테고리</th>
<c:if test="${boardinfo.cateno eq 1 }">
<td colspan="3">자유게시판</td>
</c:if>
<c:if test="${boardinfo.cateno eq 2 }">
<td colspan="3">사진게시판</td>
</c:if>
</tr>

<tr>
<th colspan="8">내용</th>
</tr>
<tr>
<td colspan="8">
${boardinfo.bcontent }

<c:if test="${not empty boardFile }">
<br>
<br>
<p>첨부파일</p>
	<c:forEach items="${boardFile }" var="i">
		<div>
		<img class="img" src="<%=request.getContextPath() %>/upload/${i.storedName }" width="30%" height="30%"><br>
		<a href="<%=request.getContextPath() %>/upload/${i.storedName }" download="${i.originName }">${i.originName }</a><br>
		</div>
	</c:forEach>
</c:if>
</td>
</tr>

</table>

<button class="btn btn-default" onclick="location.href='/admin/board/list?cateno=${boardinfo.cateno}'">목록</button>
<button class="btn btn-danger" id="btnDel">삭제</button>

<c:if test="${not empty reply }">
<div style="text-align: left;margin-top:20px;">
댓글
<hr style="margin-top:5px;">
<c:forEach items="${reply }" var="i">
<div style="border-bottom:1px solid #ccc;margin-top:5px;">
	<span>${i.id }</span>
	<span style="margin-right:10px;cursor:pointer;"class="pull-right" onclick="if( confirm('해당 댓글을 삭제하시겠습니까?') ){location.href='/admin/comment/delete?replyNo=${i.replyno}&boardNo=${boardinfo.boardno }'}" >삭제</span>
	<br class="clearfix">
	<span>${i.content }</span>
	<br>
	<span>${i.bdate }</span>
</div>
</c:forEach>


<!-- 댓글 페이징 -->
<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&cateno=1&curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>	
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a>&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${paging.curPage - 1 }">&lt;</a></li>	
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${i }">${i }</a></li>	
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${i }">${i }</a></li>	
	</c:if>
	</c:forEach>
	

	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${paging.curPage + 1 }">&gt;</a></li>	
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>	
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a>&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/admin/board/detail?boardno=${boardinfo.boardno }&curPage=${paging.totalPage }">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>
<!-- 댓글 페이징 -->
</div>
</c:if>

</div>


<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
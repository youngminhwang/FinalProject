<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/headerm.jsp" />

<style>
 	table th, td{text-align: center;} 
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnDel").click(function(){
		console.log("#btnDel clicked")
		if( confirm('[${member.nick}] 를 정말로 탈퇴시킬까요?') )
		{
			location.href="/admin/member/delete?memberNo=${member.memberNo}"
		}
	})
})
</script>


<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">회원 상세보기</div>
	<div></div>
</div>
<div id="wrap-box">

<table class="table table-striped">
<tr>
<th>회원번호</th>
<td>${member.memberNo }</td>
</tr>
<tr>
<th>아이디</th>
<td>${member.id }</td>
</tr>
<tr>
<th>닉네임</th>
<td>${member.nick }</td>
</tr>
<tr>
<th>이름</th>
<td>${member.name }</td>
</tr>
<tr>
<th>이메일</th>
<td>${member.email }</td>
</tr>
<tr>
<th>전화번호</th>
<td>${member.phone }</td>
</tr>
<tr>
<th>주소1</th>
<c:if test="${not empty member.addr1 }">
<td>${member.addr1 }</td>
</c:if>
<c:if test="${empty member.addr1 }">
<td>주소1이 기입되지 않았습니다</td>
</c:if>
</tr>
<tr>
<th>주소2</th>
<c:if test="${not empty member.addr2 }">
<td>${member.addr2 }</td>
</c:if>
<c:if test="${empty member.addr2 }">
<td>주소2이 기입되지 않았습니다</td>
</c:if>
</tr>
<tr>
<th>주소3</th>
<c:if test="${not empty member.addr3 }">
<td>${member.addr3 }</td>
</c:if>
<c:if test="${empty member.addr3 }">
<td>주소3이 기입되지 않았습니다</td>
</c:if>
</tr>
<tr>
<th>가입일자</th>
<td>${member.mdate }</td>
</tr>
</table>

<div class="pull-right">
	
</div>

<div style="margin-top:30px;">
	<button onclick="location.href='/admin/member/list'" class="btn btn-default">목록</button>
	<button class="btn btn-warning" onclick="location.href='/admin/member/update?memberNo=${member.memberNo}'">수정</button>
	<button class="btn btn-danger" id="btnDel">삭제</button>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 	table th, td{text-align: center;} 
 	input{text-align: center;}
 	input[readonly="readonly"]{color:gray;cursor:default;}
</style>
<c:import url="/WEB-INF/views/layout/headerm.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$("#btnUpdate").click(function() {
		$("form").submit();
	})
})
</script>
<div id="wrap-box-top">
	<div><a style="cursor:pointer;" onclick="history.go(-1);"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">회원 수정하기</div>
	<div></div>
</div>
<div id="wrap-box">

<form action="/admin/member/update" method="post" >
<table class="table">
<tr>
<th>회원번호</th>
<td><input type="text" readonly="readonly" name="memberNo"  value="${member.memberNo }"></td>
</tr>
<tr>
<th>아이디</th>
<td><input type="text" readonly="readonly"  value="${member.id }"></td>
</tr>
<tr>
<th>닉네임</th>
<td><input type="text" name="nick" value="${member.nick }"></td>
</tr>
<tr>
<th>이름</th>
<td><input type="text" name="name"  value="${member.name }"></td>
</tr>
<tr>
<th>이메일</th>
<td><input type="text" name="email"  value="${member.email }"></td>
</tr>
<tr>
<th>전화번호</th>
<td><input type="text" name="phone"  value="${member.phone }"></td>
</tr>
<tr>
<th>주소1</th>
<c:if test="${not empty member.addr1 }">
<td><input type="text" name="addr1" value="${member.addr1 }"></td>
</c:if>
</tr>
<tr>
<th>주소2</th>
<c:if test="${not empty member.addr2 }">
<td><input type="text"  name="addr2" value="${member.addr2 }"></td>
</c:if>
</tr>
<tr>
<th>주소3</th>
<c:if test="${not empty member.addr3 }">
<td><input type="text" name="addr3" value="${member.addr3 }"></td>
</c:if>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" readonly="readonly"  value="${member.mdate }"></td>
</tr>
</table>
<p style="color:red;">회원번호, 아이디, 가입일자, 비밀번호는 변경할 수 없습니다</p>
</form>

	

<div style="margin-top:30px;">
	<button id="btnUpdate" class="btn btn-success">수정</button>
	<button onclick="location.href='/admin/member/list'" class="btn btn-default">목록</button>
</div>

</div>

<c:import url="/WEB-INF/views/layout/footerm.jsp" />
    
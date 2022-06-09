<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="/WEB-INF/views/layout/headerm.jsp" />


<script>

$(document).ready(function(){
	$("#submit").click(function(){
		if( $("#name").val() === "" )
		{
			alert("모든 항목을 입력해주세요.")
			return;
		}
		if( $("#water").val() === "" )
		{
			alert("모든 항목을 입력해주세요.")
			return;
		}
		if( $("#sun").val() === "" )
		{
			alert("모든 항목을 입력해주세요.")
			return;
		}
		if( $("#humidity").val() === "" )
		{
			alert("모든 항목을 입력해주세요.")
			return;
		}
		if( $("#file").val() === "" )
		{
			alert("모든 항목을 입력해주세요.")
			return;
		}
		
		$("form").submit();
		
	})
})

</script>

<div>

<form action="/admin/plant/insert" method="post" enctype="multipart/form-data">

<table class="table table-striped">
	<tr>
		<td>식물명</td>
		<td><input id="name" type="text" name="name" ></td>
	</tr>
	<tr>
		<td>물주기 간격</td>
		<td><input id="water" type="text" name="water" ></td>
	</tr>
	<tr>
		<td>햇빛</td>
		<td><input id="sun" type="text" name="sun" ></td>
	</tr>
	<tr>
		<td>습도</td>
		<td><input id="humidity" type="text" name="humidity" >%</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="file" id="file" name="file"></td>
	</tr>
</table>


</form>
<div class="text-center">
	<button type="button" class="btn btn-primary" id="submit">작성</button>
	<button class="btn btn-red" onclick="history.go(-1);">취소</button>
</div>
</div>
<c:import url="/WEB-INF/views/layout/footerm.jsp" />
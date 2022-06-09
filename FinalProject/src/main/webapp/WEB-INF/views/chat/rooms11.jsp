<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>

<c:import url="/WEB-INF/views/layout/headerm.jsp" />


<style type="text/css">

/* table, th { */
/* 	 */
/* } */


/* table.txc-table{ */
/* width: 100% */
/* table-layout:fixed; */
/* } */

/* table thead tr{ */
/* width:100% */
/* } */

/* .parent{  display: flex; */
/*   justify-content : center;} */

</style>


<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>



<div style="height: 50px"></div>
<div style="font-size:  2.5em; text-align:center"> 답변을 기다리는 채팅들 </div>
<div style="height: 50px"></div>
<div class="parent " >
<span>
	<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto; text-align:center; width: 80%">
	<thead>
		<tr>
		<th style="text-align: center; ">닉네임(회원아이디)</th>
		<th style="border-left: 1px black dashed; border-right: 1px black dashed; text-align: center; ">마지막 채팅 시간</th>
		<th style="text-align: center;">입장하기</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="ChatDto" varStatus="status">
		<tr>
		 	<td>${memList[status.index].nick} (${ChatDto.userID })</td>
		 	<td style="border-left: 1px black dashed; border-right: 1px black dashed; align=center">${ChatDto.chatDate }</td> 
			<td><a href="/chat/room11Adm/?roomId=${ChatDto.userID }">입장</a><td>	 	
		</tr>
		 	</c:forEach>
		<c:if test="${empty list  && empty memList }">
		 <tr>
			<td colspan='3'> 답변할 채팅 내역이 없습니다. </td>
		 </tr>	
		</c:if>
	</tbody>
	</table>
	<div style="height: 50px"></div>
	 
</span>
</div>
</body>


<c:import url="/WEB-INF/views/layout/footer.jsp" />

</html>


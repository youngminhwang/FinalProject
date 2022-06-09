<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<head>
<meta charset="UTF-8">

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
div{color: #688331}

</style>


<title>Insert title here</title>
</head>

<body>
<div style="text-align: center; font-size: 2.5em; margin-top:0.4em; margin-bottom: 0.4em">
예약이 수정되었습니다. 
</div> 
<div style="width:80%; margin: 0 auto; text-align: center; font-size: 1.5em">

	<div style="height: 1em"></div>
	예약일시: 
	<c:out value = "${fn: substring(resInfo.visitDate,0,10)} "/>
	
	<c:if test = "${ resInfo.visitTime eq 'morning'}">
	오전 </c:if>
	<c:if test = "${ resInfo.visitTime eq 'afternoon'}">
	오후 </c:if>
	<c:if test = "${ resInfo.visitTime eq 'night'}">
	야간 </c:if>
	<div style="height: 1em"></div>
	예약인원: 성인 ${ resInfo.adultMem} 명, 유아 ${ resInfo.childMem} 명, 우대 ${ resInfo.disabMem} 명
	<div style="height: 1em"></div>
	지불예정금액: <fmt:formatNumber type="number" pattern="0" value="${ resInfo.totalPrice}"/> 원
	<div style="height: 1em"></div>
	 <br>
	매표소에서 이 페이지 또는 아래의 QR 코드를 제시하세요.
	<br><br>
	<div>
	<img alt="예약정보QR코드" src="${ qrCodeUrl}" width="200" >
	</div>
	<br>
	정보가 다를 경우 관리자에게 문의하세요. 
	<br><br>
	
	<div>
		<form action="/garden/resModify" method="get">
		<input type="hidden" name="resNo" value="${ resInfo.reserveNo}">
		<button>수정하기</button>
		</form>
	</div>
	<div style="height: 1em"></div>
	<div>
		<button onclick="location.href='/main'">홈으로 돌아가기</button>
	</div>

</div>
</body>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

</html>
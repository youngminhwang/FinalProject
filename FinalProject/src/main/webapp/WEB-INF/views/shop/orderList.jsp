<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url ="../layout/header2.jsp" ></c:import>

<style>
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
*/

 section#content ul li { border:5px solid #ECF8E0; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 
 .thumb { float:left; width:180px; }
 .thumb img { width:180px; height:180px; }
 ul{list-style:none;}
</style>    


<div id="wrap-box-top">
	<div><a href="/shop/home"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;상품 홈</a></div>
	<div id="title-box">주문 목록</div>
	<div></div>
</div>
<div id="wrap-box">

	<section id="content">
 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  
  <li>
  <div>
  <div class="thumb">
    		<img src="<%=request.getContextPath() %>/upload/${orderList.imgStoredName }" 
			 alt="그림을 불러오지못함" width="50%" height="50%"><br>
  </div>
   <p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
   
   <p><span>주문일</span><fmt:formatDate pattern="yyyy-MM-dd" value="${orderList.orderDate}" /></p>
   
   <p><span>주문상태</span>${orderList.delivery}</p>
   
   <p><span>상품명</span>${orderList.gdsName}</p>
   
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
   
  </div>
  </li>
  </c:forEach>
 </ul>

</section>
</div>

<c:import url ="../layout/footer.jsp" ></c:import>
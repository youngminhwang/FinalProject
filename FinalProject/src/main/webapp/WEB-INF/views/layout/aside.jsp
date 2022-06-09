<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
 aside#aside li { position:relative; }
 aside#aside li:hover { background:#fff; }   
 aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
 aside#aside li:hover > ul.low { display:block; }
 aside#aside li:hover > ul.low li a { background:#ECF8E0; border:1px solid #ECF8E0; }
 aside#aside li:hover > ul.low li a:hover { background:#fff;}
 aside#aside li > ul.low li { width:180px; }
</style>

<aside>
 <ul>
  <li><a href="/admin/goods/register">상품 등록</a></li>
  <li><a href="/admin/goods/list">상품 목록</a></li>
  <li><a href="/admin/goods/orderList">주문 목록</a></li>
<!--   <a href=""><li>상품 소감</li></a> -->
  <li><a href="/admin/member/list">회원 목록</a></li>
  <li><a href="/admin/plant/insert">메인 식물 등록</a></li>
 </ul>
</aside>

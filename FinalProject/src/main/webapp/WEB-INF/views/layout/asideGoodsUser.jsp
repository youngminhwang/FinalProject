<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
aside#aside li { position:relative; }
aside#aside li:hover { background:#fff; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#ECF8E0; border:1px solid #ECF8E0; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }
</style>
</head>
<body>

<h3>카테고리</h3>

<aside>
 <ul>
  	<li><a href="">식물</a>
 		<ul class="low">
  			<li><a href="/shop/list?c=101&L=2">공기정화식물</a></li>
  			<li><a href="/shop/list?c=102&L=2">관엽식물</a></li>
  			<li><a href="/shop/list?c=103&L=2">수경식물</a></li>
  		</ul>
  	</li>
  	
  	<li><a href="/shop/list?c=200&L=1">원예도구</a></li>
  	<li><a href="/shop/list?c=300&L=1">비료</a></li>
</ul>
</aside>



</body>
</html>
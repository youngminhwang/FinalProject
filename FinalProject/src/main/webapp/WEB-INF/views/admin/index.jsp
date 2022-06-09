<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  ul { padding:0; margin:0; list-style:none;  } 

  div#root { width:90%; margin:0 auto; } 
 
/*   header#header { font-size:60px; padding:20px 0; }  */
/*   header#header h1 a { color:#000; font-weight:bold; }  */
 
/*   nav#nav { padding:10px; text-align:right; }  */
/*   nav#nav ul li { display:inline-block; margin-left:10px; }  */

 #container { padding:20px 0; border-top:2px solid #eee; }  
 #container::after { content:""; display:block; clear:both; } 
  aside { float:left; width:200px; } 
  div#container_box { float:right; width:calc(100% - 200px - 20px); } 
 
  aside{margin-top:30px;}
  aside ul li { text-align:center; margin-bottom:10px; width:100%;height:50px;border:1px solid #333;padding-top:9px;font-size:20px; } 
  aside ul li a { display:block; width:100%; padding:10px 0;} 
  aside ul li:hover { background:#eee; }
 
	footer#footer { background:#f9f9f9; padding:20px; } 
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>

<c:import url ="../layout/headerm.jsp" ></c:import>


<div id="wrap-box">
<section id="container">

	<aside>
 		<ul>
  		<c:import url ="../layout/aside.jsp" ></c:import>
 		</ul>
	</aside>
	
	<div id="container_box">
		<p>오늘도 물주기<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-droplet-half" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M7.21.8C7.69.295 8 0 8 0c.109.363.234.708.371 1.038.812 1.946 2.073 3.35 3.197 4.6C12.878 7.096 14 8.345 14 10a6 6 0 0 1-12 0C2 6.668 5.58 2.517 7.21.8zm.413 1.021A31.25 31.25 0 0 0 5.794 3.99c-.726.95-1.436 2.008-1.96 3.07C3.304 8.133 3 9.138 3 10c0 0 2.5 1.5 5 .5s5-.5 5-.5c0-1.201-.796-2.157-2.181-3.7l-.03-.032C9.75 5.11 8.5 3.72 7.623 1.82z"/>
  <path fill-rule="evenodd" d="M4.553 7.776c.82-1.641 1.717-2.753 2.093-3.13l.708.708c-.29.29-1.128 1.311-1.907 2.87l-.894-.448z"/>
</svg></p>
		<iframe width="600" height="350" src="https://www.youtube.com/embed/FwjhYuTGnkg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</section>
	

</div>


<c:import url ="../layout/footerm.jsp" ></c:import>

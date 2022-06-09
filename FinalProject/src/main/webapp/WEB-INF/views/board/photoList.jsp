<%@page import="web.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="web.dto.BoardFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/WEB-INF/views/layout/header2.jsp" />



<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/board/photoWrite"
	})
	
	
})

</script>

<style type="text/css">




.body {
  padding: 20px;
  font-family: sans-serif;
  background: #f2f2f2;
  float:left;
  background-color: #ffffff;
  width: 380px;
  height: 300px;
  


}

.grid-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  grid-gap: 1em;
}

img {
  width: 100%;
/*   height: 300px; */
  
}

.location-listing {
  position: relative;
  overflow: hidden;
}

.location-title {
   position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: rgba(255,255,255,0.5);
   
  /* typographic styles */
  color: white;
  font-size: 1.5em;
  font-weight: bold;
  text-decoration: none !important;
   
  /* position the text centrally*/
  display: flex;
  align-items: center;
  justify-content: center;
  
	/* hide the title by default */
	opacity: 0;
	transition: opacity .5s;
	
	z-index: 1;
	
}
 
.location-listing:hover .location-title {
  opacity: 1;
}

.location-image img {
 	filter: blur(0px);
  transition: filter 0.3s ease-in;
  transform: scale(1.1);
}
 
.location-listing:hover .location-image img {
  filter: blur(2px);
}

/* for touch screen devices */
@media (hover: none) { 
  .location-title {
    opacity: 1;
  }
  .location-image img {
    filter: blur(2px);
  }
}





</style>


<div class="container">

<div id="wrap-box-top">
	<div><a href="/main"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">사진게시판</div>
	<div></div>
</div><hr>




		<div class="child-page-listing">
		
		
		<c:forEach var="item" items="${fileList }">
	
	<div class="body">
	
			<div class="location-listing">
<%-- 		  	<a class="location-title" href="/board/photoView?boardno=${item.boardNo }"> --%>
		  	<div class="location-title" onclick='location.href="/board/photoView?boardno=${item.boardNo }"'>
		  	<c:if test="${item.btitle eq '' }">(not title)</c:if>${item.btitle }</div>
		  	<div class="location-image">
		  	<img style="height:300px" src="<%=request.getContextPath() %>/upload/${item.storedName }" 
			alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>

			</div>
			</div>
	
	</div> <!-- body end -->
			
		</c:forEach>

		 
		</div> <!-- child-page-listing end -->
		

		

</div><!-- .container -->

<br><br>
		<hr>

		<div class="clearfix"></div>
		<button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button>
		
		<span class="pull-right">total : ${paging.totalCount }</span>
		<div class="clearfix"></div>



<c:import url="./paging2.jsp" />
 


<c:import url="/WEB-INF/views/layout/footer2.jsp" />

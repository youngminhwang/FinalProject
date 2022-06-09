<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/headerm.jsp" ></c:import>

<style>
#container_box table {width: 900px;}
#container_box table th {font-size: 20px; font-weight: bold;
							text-align: center; padding: 10px; border-bottom: 2px solid #666;}
#container_box table tr:hover {background: #eee;}
#container_box table td { padding: 10px; text-align: center; }
#container_box table img {width: 150px; height: auto;}

 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 


/*  section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; } */
 aside { float:left; width:200px; }
/*  div#container_box { float:right; width:calc(100% - 200px - 20px); } */
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 


</style>

<script type="text/javascript">
$(document).ready(function(){
    
    //검색버튼 눌렀을 때 검색
    $("#btnSearch").click(function(){
        console.log("btnSearch clicked")
        location.href="/admin/goods/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
    })
    
    //검색창에서 enter키 눌렀을 때도 검색
    $("#search").keydown(function(e){
        if(e.keyCode == 13){//엔터키
            location.href="/admin/goods/list?search="+$("#search").val()+"&searchOpt="+$("#searchOpt").val();
        }
    })
})
</script>

<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	<div id="container_box" class="text-center">
	
	
		<table>
		
		    <div class="pull-right form-inline" style="margin-bottom:20px;">
		    <select id="searchOpt" style="height:34px;border:1px solid #ccc;border-radius:5px;">
		        <option value="gdsNum">상품번호</option>
		        <option value="gdsName">상품이름</option>
		    </select>
		    <input type="text" id="search" class="form-control">
		    <button id="btnSearch" class="btn btn-primary">검색</button>
		    </div>
		
 			<thead>
  				<tr>
   				<th>썸네일</th>
   				<th>번호</th>
   				<th>이름</th>
   				<th>카테고리</th>
   				<th>가격</th>
   				<th>수량</th>
   				<th>등록날짜</th>
  				</tr>
  				
 			</thead>
 			<tbody>	
  			<c:forEach items="${list}" var="list">
  			
  				<tr>
   				<td>
   					<c:if test="${not empty list }">
					<img src="<%=request.getContextPath() %>/upload/${list.imgStoredName }" 
			 			alt="그림을 불러오지못함" ><br>
					<a href="<%=request.getContextPath() %>/upload/${list.imgStoredName }"
			 			download="${list.imgOriginName }" >
					<%-- ${list.imgOriginName } --%>
					</a>
					</c:if>
   				</td>
   				<td>${list.gdsNum }</td>
   				<td>
   					<a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
   				</td>
   				<td>${list.cateName}</td>
   				<td>
   					<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
   				</td>
   				<td>${list.gdsStock}</td>
   				<td>
   					<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
   				</td>
  				</tr>   
  			</c:forEach>
 			</tbody>
 			
		</table>
		
	</div>
	
	        <!-- 상품 페이징 -->
    <c:if test="${not empty paging.search and not empty paging.searchOpt }">
        <c:set var="searchParam" value="&search=${paging.search }&searchOpt=${paging.searchOpt }" />
    </c:if>

    <div class="text-center">
        <ul class="pagination pagination-sm">
    
        <%-- 첫 페이지로 이동 --%>
        <c:if test="${paging.curPage ne 1 }">
            <li><a href="/admin/goods/list${searchParam }">&larr; 처음</a></li>    
        </c:if>
        
        <%-- 이전 페이징 리스트로 이동 --%>
        <c:choose>
        <c:when test="${paging.startPage ne 1 }">
            <li><a href="/admin/goods/list?curPage=${paging.startPage - paging.pageCount }${searchParam }">&laquo;</a></li>
        </c:when>
        <c:when test="${paging.startPage eq 1 }">
            <li class="disabled"><a>&laquo;</a></li>
        </c:when>
        </c:choose>
        
        <%-- 이전 페이지로 가기 --%>
        <c:if test="${paging.curPage > 1 }">
            <li><a href="/admin/goods/list?curPage=${paging.curPage - 1 }${searchParam }">&lt;</a></li>
        </c:if>
        
        <%-- 페이징 리스트 --%>
        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
        <c:if test="${paging.curPage eq i }">
            <li class="active"><a href="/admin/goods/list?curPage=${i }${searchParam }">${i }</a></li>
        </c:if>
        <c:if test="${paging.curPage ne i }">
            <li><a href="/admin/goods/list?curPage=${i }${searchParam }">${i }</a></li>
        </c:if>
        </c:forEach>
        
    
        <%-- 다음 페이지로 가기 --%>
        <c:if test="${paging.curPage < paging.totalPage }">
            <li><a href="/admin/goods/list?curPage=${paging.curPage + 1 }${searchParam }">&gt;</a></li>
        </c:if>
        
        <%-- 다음 페이징 리스트로 이동 --%>
        <c:choose>
        <c:when test="${paging.endPage ne paging.totalPage }">
            <li><a href="/admin/goods/list?curPage=${paging.startPage + paging.pageCount }${searchParam }">&raquo;</a></li>
        </c:when>
        <c:when test="${paging.endPage eq paging.totalPage }">
            <li class="disabled"><a>&raquo;</a></li>
        </c:when>
        </c:choose>
    
        <%-- 끝 페이지로 이동 --%>
        <c:if test="${paging.curPage ne paging.totalPage }">
            <li><a href="/admin/goods/list?curPage=${paging.totalPage }${searchParam }">끝 &rarr;</a></li>    
        </c:if>
        
        </ul>
    </div>
    <!-- 상품페이징 -->
    

</section>



<c:import url ="../../layout/footerm.jsp" ></c:import>
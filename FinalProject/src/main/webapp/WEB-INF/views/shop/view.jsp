<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url ="../layout/header2.jsp" ></c:import>




<style>

 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 /* ---------- */
 
 div#root { width:900px; margin:0 auto; }
 section#container { }
  section#content { float:right; width:700px; }

  section#container::after { content:""; display:block; clear:both; } 
 
 /* ---------- */
 aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
 aside#aside li { font-size:16px; text-align:center; }
 aside#aside li a { color:#000; display:block; padding:10px 0; }
 aside#aside li a:hover { text-decoration:none; background:#ECF8E0; }
 
 aside#aside li { position:relative; }
aside#aside li:hover { background:#fff; }   
aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
aside#aside li:hover > ul.low { display:block; }
aside#aside li:hover > ul.low li a { background:#ECF8E0; border:1px solid #ECF8E0; }
aside#aside li:hover > ul.low li a:hover { background:#fff;}
aside#aside li > ul.low li { width:180px; }  
 
  aside#aside { float:left; width:180px; }
 
 section#container { }
 

 
</style>

<style>
 div.goods div.goodsImg { float:left; width:350px; }
/* .orgImg{ width:500px; } */
 div.goods div.goodsImg img { width:350px; height:auto; }
 
 div.goods div.goodsInfo { float:right; width:330px; font-size:22px; }
 div.goods div.goodsInfo p { margin:0 0 20px 0; }
 div.goods div.goodsInfo p span { display:inline-block; width:100px; margin-right:15px; }
 
 div.goods div.goodsInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.goods div.goodsInfo p.cartStock button { font-size:26px; border:none; background:none; }
 div.goods div.goodsInfo p.addToCart { text-align:right; }
 div.goods div.gdsDes { font-size:18px; clear:both; padding-top:30px; }
</style>

<div id="wrap-box-top">
	<div><a href="/shop/home"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">상품상세조회</div>
	<div></div>
</div>
<div id="wrap-box">

<section id="container">
	<div id="container_box">
		
	<aside id="aside">
 		<ul>
  		<c:import url ="../layout/asideGoodsUser.jsp" ></c:import>
 		</ul>
	</aside>
		<section id="content">
		
		<form role="form" method="post">
 			<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
		</form>

		<div class="goods">
 			<div class="goodsImg">
				<c:if test="${not empty view }">
				<img src="<%=request.getContextPath() %>/upload/${view.imgStoredName }" 
			 		alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>
				<a href="<%=request.getContextPath() %>/upload/${view.imgStoredName }">
				</a>
				</c:if>
 			</div>
 
 		<div class="goodsInfo">
  			<p class="gdsName"><span>상품명</span>${view.gdsName}</p>
  
  			<p class="cateName"><span>카테고리</span>${view.cateName}</p>
  
  			<p class="gdsPrice">
   				<span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" /> 원
  			</p>
  
  			<p class="gdsStock">
   				<span>재고 </span><fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" /> EA
  			</p>
  			
  			<c:if test="${view.gdsStock != 0}">
  
  			<p class="cartStock">
 				<span>구입 수량</span>
 				<button type="button" class="plus">+</button>
 					<input type="number" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
 				<button type="button" class="minus">-</button>
 
				 <script>
				  $(".plus").click(function(){
				   var num = $(".numBox").val();
				   var plusNum = Number(num) + 1;
				   
				   if(plusNum >= ${view.gdsStock}) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(plusNum);          
				   }
				  });
				  
				  $(".minus").click(function(){
				   var num = $(".numBox").val();
				   var minusNum = Number(num) - 1;
				   
				   if(minusNum <= 0) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(minusNum);          
				   }
				  });
				 </script>
 
			</p>
			</c:if>
			
			<c:if test="${view.gdsStock == 0 }">
				<p>상품 수량이 부족합니다.</p>
			</c:if>
  			
  			<p class="addToCart">
 			<button type="button" class="addCart_btn">장바구니에 담기</button>
 
			 <script>
			  $(".addCart_btn").click(function(){
			   var gdsNum = ${view.gdsNum};
			   var cartStock = $(".numBox").val();
			      
			   var data = {
			     gdsNum : gdsNum,
			     cartStock : cartStock
			     };
			   
			   $.ajax({
			    url : "/shop/view/addCart",
			    type : "post",
			    data : data,
			    success : function(result){
			    	
			    	if(result == 1) {
					     alert("상품을 장바구니에 담았습니다!");
			    	     $(".numBox").val("1");
			    	     
			    	    } else if(result == 2) {
			    	     alert("이미 장바구니에 담겨 있는 상품입니다! 장바구니에서 확인해주세요.");
			    	     $(".numBox").val("1");
			    	    	
			    	    } else {
			    	     alert("회원만 이용할 수 있는 서비스입니다. 로그인 후, 다시 시도해주세요.")
			    	     $(".numBox").val("1");
			    	}
			    	
			    },
			    error : function(){
			     alert("요청 처리 중, 문제가 발생해 장바구니에 담지 못했습니다.");
			    }
			    });
			  });
			 </script>
			</p>
 		</div>
 
 			<div class="gdsDes">${view.gdsDes}<br><br>
 			</div>
 			<img src="<%=request.getContextPath() %>/upload/${view.imgStoredName2 }" 
			 	alt="그림을 불러오지못함" width="100%" height="100%" class="oriImg2">
 			
		</div>
		</section>
	</div>

</section>
</div>
 
<c:import url ="../layout/footer.jsp" ></c:import>

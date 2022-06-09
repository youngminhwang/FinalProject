<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<c:import url ="../layout/header2.jsp" ></c:import>

<style>
/*
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
*/
 .orderInfo { border:5px solid #ECF8E0; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 ul{list-style:none;}
 .button{text-align: right;}
</style>

   


<div id="wrap-box-top">
	<div><a href="/shop/home"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;상품 홈</a></div>
	<div id="title-box">주문목록 상세보기</div>
	<div></div>
</div>
<div id="wrap-box">

	<section id="content">
	
	<!-- <script>
	IMP.init("imp61196601");
	</script> -->

	 <div class="orderInfo">
  		<c:forEach items="${orderView}" var="orderView" varStatus="status">
   
   		<c:if test="${status.first}">
    		<p><span>수령인</span>${orderView.orderRec}</p>
    		<p><span>주소</span>(${orderView.addr1}) ${orderView.addr2} ${orderView.addr3}</p>
    		<p><span>전화번호</span>${orderView.phone}</p>    		
    		<p><span>결제 금액</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
    		<p><span>결제 수단</span>신용카드</p>
    		<p><span>승인 번호</span>${orderView.applyNum}</p>
    		<p><span>주문 상태</span>${orderView.delivery}</p>
    		<div class="button">
    		<!-- <button  id="cancelPay">결제 취소</button> -->
    		
    		 <!-- <script>
    			
    			 $(document).ready(function(){ 
    				 
    				 IMP.init("imp61196601");
    				 
    				$("#cancelPay").click(function(e){
    				   
    					/* $.ajax({
    							url: "/shop/cancelPay",
    							type:"post",
    							//datatype:"json",
    							contentType : 'application/json; charset = utf-8',
    							data : {
    								"orderId" : "${orderView.orderId}",
    								"impUid" : "${orderView.impUid}",
    								"merchantUid" : "${orderView.merchantUid}",
    								"paidAmount" : "${orderView.paidAmount}",
    								"applyNum" : "${orderView.applyNum}",
    								"cancel_request_amount" : "${orderView.paidAmount}", //환불금액
    								"reason": "테스트 결제 환불", //환불사유
    								//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
    								//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
    								//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
    							}
    						}).done(function(){ //환불 성공
    							
    							alert("토큰 발급 완료");  */
    								
    							/* app.post('/shop/cancelPay', async (req, res, next) => { */
    								
    							 try { 
    									
    								var getCancelData;
    									
    								async function refund(){
		    							getCancelData = await axios({
		    						          url: "https://api.iamport.kr/payments/cancel",
		    						          method: "post",
		    						          headers: {
		    						            "Content-Type": "application/json",
		    						            "Authorization": access_token // 아임포트 서버로부터 발급받은 엑세스 토큰
		    						          },
		    						          data: {
		    						            reason : "환불테스트", // 가맹점 클라이언트로부터 받은 환불사유
		    						            imp_uid : ${orderView.impUid}, // imp_uid를 환불 `unique key`로 입력
		    						            amount: ${orderView.paidAmount}, // 가맹점 클라이언트로부터 받은 환불금액
		    						          }

		    							});
		    							
		    							const response = getCancelData.data; // 환불 결과
		    							console.log(response);
    								}
		    							/* const { response } = getCancelData.data; // 환불 결과 */
    								/* } */
    							 }  catch {
    								 
    							 }
    						
    						/* }).fail(function(){
    							alert("토큰발급실패 : ");
    						});//ajax */
    					 
    				}); //cancelPay 클릭
    			 });  //doc.ready
    			
			
    	
    			
    		</script> -->
    		
    		
    		
    		</div>
  		 </c:if>
   
  		</c:forEach>
 	</div>
 
 	<ul class="orderView">
  		<c:forEach items="${orderView}" var="orderView">     
  		<li>
  		
   		<div class="thumb">
    		<img src="<%=request.getContextPath() %>/upload/${orderView.imgStoredName }" 
			 alt="그림을 불러오지못함" width="50%" height="50%"><br>
   		</div>
   		
   		<div class="gdsInfo">
    		<p>
     		<span>상품명</span>${orderView.gdsName}<br />
     		<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
     		<span>구입 수량</span>${orderView.cartStock} 개<br />
     		<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
    		</p>
   		</div>
  		</li>     
  		</c:forEach>
 	</ul>
	</section>
</div>

<c:import url ="../layout/footer.jsp" ></c:import>
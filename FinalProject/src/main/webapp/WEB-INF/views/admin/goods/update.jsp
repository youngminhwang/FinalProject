<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url ="../../layout/headerm.jsp" ></c:import>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">
function submitContents(elClickedObj) {
	oEditors.getById["gdsDes"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}
</script> 


<script type="text/javascript">
$(document).ready(function() {
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		
		//스마트 에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnUpdate") )
		
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
	
	/* if( ${empty goods} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
	}) */
	
});
</script>

<style>
 ul { padding:0; margin:0; list-style:none;  }

 div#root { width:90%; margin:0 auto; }
 
 
 nav#nav { padding:10px; text-align:right; }
 nav#nav ul li { display:inline-block; margin-left:10px; }

/* section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
 section#container::after { content:""; display:block; clear:both; }  */
 aside { float:left; width:200px; }
 div#container_box { float:right; width:calc(100% - 200px - 180px); }
 
 aside ul li { text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;}
 aside ul li a:hover { background:#eee; }
 
 .inputArea { margin:10px 0; }
 select { width:100px; }
 label { display:inline-block; width:70px; padding:5px; }
/*  label[for='gdsDes'] { display:block; }  */
 input { width:150px; }
 textarea#gdsDes { width:400px; height:180px;}
 
  .select_img img {margin: 20px 0;}
  .select_img2 img {margin: 20px 0;}
 p{display:inline-block;}
 
</style>

	<div id="wrap-box-top">
	<div><a href="/admin/goods/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;상품 리스트</a></div>
	<div id="title-box">상품 상세보기</div>
	<div></div>
	</div>
<div id="wrap-box">

<section id="container">

	<aside>
		<c:import url ="../../layout/aside.jsp" ></c:import>
	</aside>
	
	<div id="container_box">
		
		<form action="/admin/goods/update" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="gdsNum" value="${goods.gdsNum }" />
 
 			<div class="inputArea"> 
 				<label>1차 분류</label>
 				<select class="category1">
  					<option value="">전체</option>
 				</select>

 				<label>2차 분류</label>
 				<select class="category2" name="cateCode">
  					<option value="">전체</option>
 				</select>
			</div>

			<div class="inputArea">
 				<label for="gdsName">상품명</label>
 				<input type="text" id="gdsName" name="gdsName" value="${goods.gdsName }"/>
			</div>

			<div class="inputArea">
 				<label for="gdsPrice">상품가격</label>
 				<input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice }" />
			</div>

			<div class="inputArea">
 				<label for="gdsStock">상품수량</label>
 				<input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock }" />
			</div>

			<div class="inputArea">
 				<label for="gdsDes">상품소개</label>
 				<textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes }</textarea>
			</div>
			
 		<%-- 	<div class="inputArea">
 				<label for="originFile">기존파일</label>
 				
 				<!-- el은 첫번째 문자를 소문자로 해주면 에러가 나지않는다. ImgStoredName -> X, imgStoredName O -->
				<c:if test="${not empty goods }">
				<img src="<%=request.getContextPath() %>/upload/${goods.imgStoredName }" 
			 		alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>
				<a href="<%=request.getContextPath() %>/upload/${goods.imgStoredName }"
			 		download="${goods.imgOriginName }" >
					${goods.imgOriginName }
				</a>
				</c:if>
				<span id="deleteFile">X</span>
			</div>
 			

				<div id="newFile">
				<hr>
				<label for="file">새로운 첨부파일</label>
				<input type="file" id="file" name="file">
				<div class="select_img"><img src="" /></div>
				<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
				</div>
 
 			<script>
 			//어떤 이미지인지 미리보기
  			$("#newFile").change(function(){
  				
  				//앞에께 true인 경우, 뒤에꺼 반환 // 앞에께 false인 경우, 앞에꺼 반환 
   				if(this.files && this.files[0]) {
    				var reader = new FileReader;
    				reader.onload = function(data) {
     					$(".select_img img").attr("src", data.target.result).width(500);        
    				}
    			reader.readAsDataURL(this.files[0]);
   				}
  			});
 			</script> 
 			
			</div> --%>
			
			<!-- el은 첫번째 문자를 소문자로 해주면 에러가 나지않는다. ImgStoredName -> X, imgStoredName O -->
			<div>
			<c:if test="${not empty goods }">
			<p>썸네일 이미지</p>
			<img src="<%=request.getContextPath() %>/upload/${goods.imgStoredName }" 
			 	alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>
			<p>설명 이미지</p>
			<img src="<%=request.getContextPath() %>/upload/${goods.imgStoredName2 }" 
			 	alt="그림을 불러오지못함" width="50%" height="50%" class="oriImg"><br>
			</c:if>
			</div>
			
			<div class="inputArea">
 				<label for="ImgOriginName"></label>
 				<p>새 썸네일이미지</p>
				 <input type="file" id="ImgOriginName" name="file" />
 			<div class="select_img"><img src="" /></div>
 				<label for="ImgOriginName"></label>
 				<p>새 설명이미지</p>
				 <input type="file" id="ImgOriginName2" name="file" />
 			<div class="select_img2"><img src="" /></div>
 			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
 
 			<script>
 			//어떤 이미지인지 미리보기
  			$("#ImgOriginName").change(function(){
  				
  				//앞에께 true인 경우, 뒤에꺼 반환 // 앞에께 false인 경우, 앞에꺼 반환 
   				if(this.files && this.files[0]) {
    				var reader = new FileReader;
    				reader.onload = function(data) {
     					$(".select_img img").attr("src", data.target.result).width(500);        
    				}
    			reader.readAsDataURL(this.files[0]);
   				}
  			});
 			
  			$("#ImgOriginName2").change(function(){
  				
  				//앞에께 true인 경우, 뒤에꺼 반환 // 앞에께 false인 경우, 앞에꺼 반환 
   				if(this.files && this.files[0]) {
    				var reader = new FileReader;
    				reader.onload = function(data) {
     					$(".select_img2 img").attr("src", data.target.result).width(500);        
    				}
    			reader.readAsDataURL(this.files[0]);
   				}
  			});
 			</script>
 			
			</div>

			<div class="inputArea">
 				<button type="button" id="btnUpdate" class="btn btn-primary">완료</button>
 				<button type="button" id="btnCancel" class="btn btn-warning">취소</button>
			</div>
			
			
 
		</form>
		
	</div>


</section>
</div>
<script>
// 가격과 수량에서 숫자가 아닌 데이터는 받지 않기
//상품 가격과 상품 수량에 숫자가 아닌 다른 문자를 입력하려고하면, 곧바로 지워지게됨
var regExp = /[^0-9]/gi;

$("#gdsPrice").keyup(function(){ numCheck($(this)); });
$("#gdsStock").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 var tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}
</script>


<script>

//	컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

//	1차 분류 셀렉트 박스에 삽입할 데이터 준비

//	jsondata에서 level값이 1인 경우에만 cate1Obj에 추가하고, 추가한 데이터를 cate1Arr에 추가한다 
//이렇게 추가한 값을 cate1Select에 추가한다
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object(); //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
		/* console.log(cate1Obj);
		console.log(cate1Arr); */
	}
}

//	1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");
}



$(document).on("change", "select.category1", function(){

	var cate2Arr = new Array();
	var cate2Obj = new Object();
	 
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
	  
		if(jsonData[i].level == "2") {
	   		cate2Obj = new Object();  //초기화
	   		cate2Obj.cateCode = jsonData[i].cateCode;
	   		cate2Obj.cateName = jsonData[i].cateName;
	   		cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   		cate2Arr.push(cate2Obj);
	 	}
	}
	 
	var cate2Select = $("select.category2");

	//기존에 있던 데이터 삭제
	cate2Select.children().remove();
	 
	$("option:selected", this).each(function () {
		
		var selectVal = $(this).val();
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		//1차 분류값인 selectVal과 cate2Arr[i].cateCodeRef를 비교하여 동일할 경우에만 2차카테고리가 보임
		for(var i=0; i<cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}
		
	})
	 
});
</script> 


<script>
var select_cateCode = '${goods.cateCode}';
var select_cateCodeRef = '${goods.cateCodeRef}';
var select_cateName = '${goods.cateName}';


// 2차 카테고리 값이 있다면
if(select_cateCodeRef != null && select_cateCodeRef != '') {
	console.log("1");
 $(".category1").val(select_cateCodeRef);
 $(".category2").val(select_cateCode);
 $(".category2").children().remove();
 $(".category2").append("<option value='"
       + select_cateCode + "'>" + select_cateName + "</option>");
} else { // 값이 없다면
	console.log("2");
 $(".category1").val(select_cateCode);
 //$(".category2").val(select_cateCode);
 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
 $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
}  
</script>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "gdsDes"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script> 


<c:import url ="../../layout/footerm.jsp" ></c:import>
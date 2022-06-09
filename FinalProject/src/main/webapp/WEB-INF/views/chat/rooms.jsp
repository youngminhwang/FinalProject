<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
  <style type="text/css">
  
  .btn-primary { 
  background-color: #99CC66;
  display: inline-block;
  margin: auto 0
   }
  
  .chatList {
  z-index: 2;
  text-align: center;
  font-size: large;
  font:bolder;
  color: #fff;
  padding: 0.7em; 
  background-color: #99CC66;
  } 
  
    .modal-backdrop {
        z-index: -1;
    }
  
   .modal-body{
   margin: auto 0;
   }

  </style>	
  <script type="text/javascript"> 
  
  $(document).ready(function(){
	  	if('${id}' == '') {
	  		alart
	  	}
	  
	  
	     if (self.name != 'reload') {
	         self.name = 'reload';
	         self.location.reload(true);
	     }
	     else self.name = ''; 
  })
  
	function chkNull(){
		var roomName =$("#roomName").val();
		var nameLength = roomName.trim().length
			if(nameLength == 0  
				|| roomName == null || roomName == undefined) {
				console.log("roomName isnull ? "+roomName)
				 alert("Please write the name.")
				return false // 제목이 있으므로 submit 가능하다.
			} else { 
				console.log("roomName"+roomName)
				alert(roomName + "방이 개설되었습니다.")
				return true
			}
	}

</script>
</head>
<body>

<!-- 샘플jsp 적용 시작-->

<div id="wrap-box-top">
	<div><a href="/diary/list"><span class="glyphicon glyphicon-arrow-left"></span>&nbsp;이전 페이지</a></div>
	<div id="title-box">채팅하기</div>
	<div></div>
</div>
<div id="wrap-box">


<!-- 샘플jsp 적용 종료 -->


  <div class=" chatList">
    참여 가능한 채팅방
  </div>
<div class="list-group">
<c:forEach items="${list }" var="room" >
  <a href="/chat/room?roomId=${room.roomId}" class="list-group-item list-group-item-action">${room.roomName}</a>
</c:forEach>
</div>

<div style="text-align:center">
<!-- Button trigger modal -->
<button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  채팅방 개설하기 
</button>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">채팅방 열기</h5>
        <button type="btn btn-secondary" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
        <div style="text-align: center">
        	<div style="font-size: large; font: bold;"> 개설할 채팅방의 이름을 입력하세요. </div>
        	<div style="padding: 0.3em 0"></div>
	        <form action="/chat/room" method="post" onsubmit="return chkNull()" > 
			<input type="text" value="" name="roomName" id="roomName"> 
			<div style="padding: 0.7em 0"></div>
	    	<button name="createBtn" class="btn-create" style="border:0; padding: 6px 12px; border-radius: 4px;">개설</button>
		</form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </div>
    </div>
  </div>
</div>

<!-- 이하 샘플jsp 적용 -->

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />



</body>
</html>
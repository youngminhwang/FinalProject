<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:import url="/WEB-INF/views/layout/header.jsp" />	
<!DOCTYPE html>
<html>
<!-- SOCKJS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.0/sockjs.min.js"></script>
<!-- STOMP -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   

    <style>
        .chat_wrap { border:3px solid #999; padding:5px; font-size:13px; color:#333}
        .chat_wrap .inner{background-color:#acc2d2; border-radius:5px; padding:10px; overflow-y:scroll;height: 400px;}
        .chat_wrap .item{margin-top:15px}
        .chat_wrap .item:first-child{margin-top:0px}
        .chat_wrap .item .box{ max-width:none; position:initial}
        .chat_wrap .item .box::before{content:""; position:absolute; left:-8px; top:9px; border-top:0px solid transparent; border-bottom:8px solid transparent;border-right:8px solid #fff;}
        .chat_wrap .item .box .msg {background:#fff; border-radius:10px; padding:8px; text-align:left}
        .chat_wrap .item .box .time {font-size:11px; color:#999; position:inherit; padding-left:5px; right: -75px; bottom:5px; width:70px}
        .chat_wrap .item .mymsg{text-align:right}
        .chat_wrap .item .mymsg .box::before{left:auto; right:-8px; border-left:8px solid #fee600; border-right:0;}
        .chat_wrap .item .mymsg .box .msg{background:#fee600}
        .chat_wrap .item .mymsg .box .time{right:auto; left:-75px}
        .chat_wrap .item .box{transition:all .3s ease-out; margin:0 0 0 20px;opacity: 7}
        .chat_wrap .item .mymsg .box{transition:all .3s ease-out; margin:0 20px 0 0;}
        .chat_wrap .item.on .box{margin:0; opacity: 1;}

        input[type="text"]{border:0; width:85%;background:#ddd; border-radius:5px; height:30px; padding-left:5px; box-sizing:border-box; margin-top:5px}
        input[type="text"]::placeholder{color:#999}
  
		.btn-primary { 
		  background-color: #99CC66;
		  display: inline-block;
		  margin: auto 0;
		  border: 0;
		 
		   }
		   
     .modal-backdrop {
       z-index: -1;
 	  }   
  
    </style>

<script type="text/javascript">

$(document).ready(function(){
	//????????? ????????? ?????? ?????? ?????? 
	//const username = ${sessionScope.testuser}
	var username ="${id}"
	var namelength = username.length;
	console.log(username)
	var msg = $("#messages");
	console.log(msg.val())
	
 	if(username==null){
	alart('??????????????? ???????????????')	
	}
	
	//-----------------------------------------
	// ??????????????? ?????? ?????????
	var sockJS = new SockJS("/chat")
	var stomp = Stomp.over(sockJS);
	

   var roomId = '${roomId}';
   
	stomp.connect({},function(){
		console.log("stomp ??????" + roomId)
		//subscribe(path, callback)
		stomp.subscribe("/sub/chat/room11"+roomId, function(chat){
  		   var content = JSON.parse(chat.body)
			var chatLog = content.chatLog
			var writer = content.userID;
	 		var message = content.chatLog
			var str = writer + ":" + message 
			console.log(chatLog)

            if(writer === username){
                str = "<div class=' item box msg'>";
                str += "<div class='mymsg box'>";
                str +=  writer + " : " + message 
                str += "<span class='time'>"
                str += currentTime()
                str += "</span>";
                str += "</div></div></div></div>";
                $("#inner").append(str);
            }
            else{
            	   str = "<div class=' item box '>";
                   str += "<div class='msg box'>";
                   str +=  writer + " : " + message 
                   str += "<span class='time'>"
                   str += currentTime()
                   str += "</span>";
                   str += "</div></div></div></div>";
                   $("#inner").append(str);
            }

			console.log("chat"+str)
		})//subscribe end
		
		//send(path, header, message)
		stomp.send('/pub/chat/enter11', {}, 
				JSON.stringify({roomId: roomId, 
					userID: username,
					chatLog: '?????? ?????????????????????.'
					}))
		
	})//connect end
	
    
    var currentTime = function(){
        var date = new Date();
        var hh = date.getHours();
        var mm = date.getMinutes();
        var apm = hh >12 ? "??????":"??????";
        var ct = apm + " "+hh+":"+mm+"";
        return ct;
    }
	

	//??????
	function onClose(e){
//		clearInterval(websocket.interval);
		$.ajax({
			url: "/chat/exit11",
			type: "get",
			data: {roomId: roomId, username:username},
			success: console.log("session deleted") ,
			error:	console.log("session delete error")
		})
		stomp.disconnect()
		console.log("onClose()")
		window.location.replace("/main")
	}
	
	 function onError(e){
		console.log("onError()")
		alart('????????? ?????????????????????')
		history.go(-1)
	} 
		
// 		----------------------
//DOM ???????????? ??????


	 $("#sendButton").click(function(e){
		 var msg = $("#messages")
		 console.log("messages "+msg)
         stomp.send('/pub/chat/message11', {}, 
 				JSON.stringify({roomId: roomId, 
 					userID: username,
 					chatLog: msg.val()
 					}))
         msg.value = '';
	 })
	 
	  $("#disconn").click(function(){
		function pro1(){
			stomp.send('/pub/chat/exit11', {}, 
					JSON.stringify({roomId: roomId, 
						userID: username,
						chatLog: '?????? ?????????????????????.'
						}))
			console.log("here1")
		}
		
		
		function pro2(){
			console.log("here2")
			
			 $.ajax({
					url: "/chat/logdown",
					type: "post",
					async: false,
					data:{userID:username, roomId:roomId}, //username??? ????????? ????????? var 
// 					dataType: "json",
	                success: function (data) {
	                    var blob = new Blob([data], { type: "application/octet-stream" });
	 					var fileName = "ChatLog.txt";
	 					
	                    var isIE = false || !!document.documentMode;
	                    if (isIE) {
	                        window.navigator.msSaveBlob(blob, fileName);
	                    } else {
	                        var url = window.URL || window.webkitURL;
	                        link = url.createObjectURL(blob);
	                        
	                        var a = $("<a />");
	                        a.attr("download", fileName);
	                        a.attr("href", link);
	                        
	                        $("body").append(a);
	                        a[0].click();
	                        a.remove();
	                    }
	                    pro3()
	                }
					,error:function(){
						console.log("????????????")
						pro3();
					}
					 })
		}
			 
		function pro3() {
			console.log("here3")
			if (typeof window !== 'undefined') { alert('????????? ???????????????.') }
			onClose();	// ?????? ?????? ?????? ?????? ??????
}

		
		if(!confirm("???????")){ // ????????????
			forcheckSaveDiv.click() 
		} else { // ????????? 
			pro1();
			pro2();
	    	onClose();
		}		
	 
	  })//disconn end
	
	  $("#forcheckSaveDiv").click(function(){
          		if (confirm("???????")){ //?????????
     		    	onClose();
          		}
	  })	
	  
	
	$.ajax({
		url: "/chat/getPastChat",
		type: "get",
		data: {roomId: roomId},
		dataType: "json",
		success:function(pastChat){
				//?????? ??????
				pastChat = Object.values(pastChat);
				pastChat = Object.values(pastChat)[0]
				
				for(var i=0; i<pastChat.length; i++){
				var writer = pastChat[i].userID
		 		var message = pastChat[i].chatLog
		 		var time = pastChat[i].chatDate
				var str = writer + ":" + message 
					
		            if(writer === username){
		                str = "<div class=' item box msg'>";
		                str += "<div class='mymsg box'>";
		                str +=  writer + " : " + message 
		                str += "<span class='time'>"
		                str += time
		                str += "</span>";
		                str += "</div></div></div></div>";
		                $("#inner").append(str);
		            }
		            else{
		            	   str = "<div class=' item box '>";
		                   str += "<div class='msg box'>";
		                   str +=  writer + " : " + message 
		                   str += "<span class='time'>"
		                   str += time
		                   str += "</span>";
		                   str += "</div></div></div></div>";
		                   $("#inner").append(str);
		            }
				}
	  $("#inner").append("-------------?????? ?????? ??????-------------");
				
		},
		
		 error: console.log("error")
	})
	
})

</script>


<div id="wrap-box-top">
	<div></div>
	<div id="title-box">1:1 ??????</div>
	<div></div>
</div>
<div id="wrap-box">
<div style="text-align: center; padding: 0.5em; background-color:#99CC66; font-size: 1.5em; font: bolder;">
<label>[OnLine] ${roomId} ?????? ?????? ?????? </label>
</div>

<div class="chat_wrap">
	<div id="inner" class="inner">
		<div>
		</div>
	</div>
</div>
<div>
		<input type="text" id="messages" placeholder="???????????? ???????????????.">
		<button type="button" id="sendButton" style="width: 10%; padding: 0 0" >??????</button>
		<div id="forcheckSaveDiv"></div> <!-- ????????? ??? div -->
</div>

<div style="height: 1.3em">
</div>
<div style="text-align: center">
	<button type="button" class="btn btn-primary" id="disconn" >????????? ?????????</button>
	<div id="participants"></div>
</div>		
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" />	ml>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="../resources/js/sockjs.min.js"></script>
<html>

<span id="recMs" name="recMs" style="float:right;cursor:pointer;margin-right:10px;color:pink;"><img src="/resources/img/msgicon.png" style="width:15px;"></span>

<body>
    <form id="chatForm">
        <div class="chat_start_main">
            상담 CHAT
        </div>
        <div class="chat_main" style="display:none;">
            <div class="modal-header" style="height:20%;">
                상담 CHAT 
            </div>
            <div class="modal-content" id="chat" style="height:60%;">
                
            </div>
            <div class="modal-footer">
                <input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>    
            </div>
        </div>
<!--         <button class="">send</button> -->
    </form>
    
    
<script type="text/javascript">
var socket = null;
var sock = new SockJS("/message");
socket =sock;
$(document).ready(function(){
    if(${login} == true)
            connectWS();
});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
            var splitdata =e.data.split(":");
            if(splitdata[0].indexOf("recMs") > -1)
                $("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
            else
                $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
    }
    
    /* $("#board1").click(function(){
        location.href="/board/main_board.do";
    }); */
 
$("#chatForm").submit(function(event){
        event.preventDefault();
            sock.send($("#message").val());
            $("#message").val('').focus();    
    });    
</script>
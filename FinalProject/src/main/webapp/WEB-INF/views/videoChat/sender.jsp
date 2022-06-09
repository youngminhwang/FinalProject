<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sender</title>


<script>


//요청받을 아이디
var receiverId;
//내 아이디
let myId = '${sessionScope.id }';
	
var eventData
const webSocket = new WebSocket("ws://localhost:8088/videows/video")

webSocket.onmessage = (event) => {
	eventData = JSON.parse(event.data);
    receiverId = eventData.senderId;
    handleSignallingData(JSON.parse(event.data))
    console.log(JSON.parse(event.data))
}

function handleSignallingData(data) {
    switch (data.type) {
        case "store_offer":
        	console.log("---offer---")
        	console.log(data.offer)
        	console.log("---offer---")
            peerConn.setRemoteDescription(data.offer)
            createAndSendAnswer()
            break;
        case "store_candidate":
        	console.log("---candidate---")
        	console.log(data.candidate)
        	console.log("---candidate---")
            peerConn.addIceCandidate(data.candidate)
            break;
        case "noLogin":
        	alert("상대방이 로그인 상태가 아닙니다.")
        	location.href='/videoChat/sender'
    }
}

function createAndSendAnswer () {
    peerConn.createAnswer((answer) => {
        peerConn.setLocalDescription(answer)
        sendData({
         	receiverId: receiverId,
         	senderId: myId,
            type: "send_answer",
            answer: answer
        })
    }, error => {
        console.log(error)
    })
}

function sendData(data) {
    webSocket.send(JSON.stringify(data))
}


let localStream
let peerConn
let username

function joinCall() {
	
	receiverId = document.getElementById("username-input").value;
	sendData({
		receiverId: receiverId,
		senderId: myId,
	})
    document.getElementById("video-call-div").style.display = "inline"

//     navigator.mediaDevices.getUserMedia({
//         video: {
//             frameRate: 24,
//             width: {
//                 min: 480, ideal: 720, max: 1280
//             },
//             aspectRatio: 1.33333
//         },
//         audio: true
//     }, (stream) => {
//         localStream = stream
//         document.getElementById("local-video").srcObject = localStream

//         let configuration = {
//             iceServers: [
//                 {
//                     "urls": ["stun:stun.l.google.com:19302", 
//                     "stun:stun1.l.google.com:19302", 
//                     "stun:stun2.l.google.com:19302"]
//                 }
//             ]
//         }

//         peerConn = new RTCPeerConnection(configuration)
//         peerConn.addStream(localStream)

//         peerConn.addEventListener('connectionstatechange', event => {
// 		   	console.log(peerConn.connectionState)
// 			if (peerConn.connectionState === 'connected') {
// 		        console.log("Peers connected!")
// 		    }
// 		});
        
//         peerConn.onaddstream = (e) => {
//             document.getElementById("remote-video")
//             .srcObject = e.stream
//         }

//         peerConn.onicecandidate = ((e) => {
//             if (e.candidate == null)
//                 return;
            
//             sendData({
// 	         	receiverId: receiverId,
// 	         	senderId: myId,
//                 type: "send_candidate",
//                 candidate: e.candidate
//             })
//         })

//     }, (error) => {
//         console.log(error);
//     })
    
//----------------------------------------------------------
    
    const constraints = {
    'video': true,
    'audio': true
	}
	navigator.mediaDevices.getUserMedia(constraints)
	    .then(stream => {
	        console.log('Got MediaStream:', stream);
	 	    localStream = stream
	 	    document.getElementById("local-video").srcObject = localStream
	        
	     let configuration = {
	     iceServers: [
	         {
	             "urls": ["stun:stun.l.google.com:19302", 
	             "stun:stun1.l.google.com:19302", 
	             "stun:stun2.l.google.com:19302"]
	         }
	     ]
	 }
	
	 peerConn = new RTCPeerConnection(configuration)
	 peerConn.addStream(localStream)
	
	 peerConn.addEventListener('connectionstatechange', event => {
		   	console.log(peerConn.connectionState)
			if (peerConn.connectionState === 'connected') {
		        console.log("Peers connected!")
		    }
		});
	 
	 peerConn.onaddstream = (e) => {
	     document.getElementById("remote-video")
	     .srcObject = e.stream
	 }
	
	 peerConn.onicecandidate = ((e) => {
	     if (e.candidate == null)
	         return;
	     
	     sendData({
	      	receiverId: receiverId,
	      	senderId: myId,
	         type: "send_candidate",
	         candidate: e.candidate
	     })
	 })
 	    
    })
    .catch(error => {
        console.error('Error accessing media devices.', error);
    });
}

let isAudio = true
function muteAudio() {
    isAudio = !isAudio
    localStream.getAudioTracks()[0].enabled = isAudio
}

let isVideo = true
function muteVideo() {
    isVideo = !isVideo
    localStream.getVideoTracks()[0].enabled = isVideo
}





</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
body{
	background:#ECF8E0;
}
#sendDiv{
	position:absolute;
 	top:50%; 
	margin-left:30%;
}
#video-call-div {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: none;
}

#local-video {
    position: absolute;
    top: 0;
    left: 0;
    margin: 16px;
    border-radius: 16px;
    max-width: 20%;
    max-height: 20%;
    background: #ffffff;
}

#remote-video {
    background: #000000;
    width: 100%;
    height: 100%;
}

.call-action-div {
    position: absolute;
    left: 45%;
    bottom: 32px;
}

button {
    cursor: pointer;
}
input {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 2px solid black;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

</style>
</head>
<body>

    <div id="sendDiv">
        <input placeholder="상대방 아이디 입력.." type="text" id="username-input" />
        <button onclick="joinCall();" class="btn btn-success">통화 걸기</button>
        <button onclick="location.href='/';" class="btn btn-info">메인페이지로 이동</button>
    </div>
    
    <div id="video-call-div">
        <video muted id="local-video" autoplay></video>
        <video id="remote-video" autoplay></video>
        <div class="call-action-div">
            <button onclick="muteVideo()">화면 끄기</button>
            <button onclick="muteAudio()">오디오 끄기</button>
            <button onclick="location.href='/'">나가기</button>
        </div>
    </div>
</body>

</html>
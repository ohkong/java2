<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/chat/chatform.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅화면</title>
</head>
<body>
<div style="width:100%;">
	<textarea rows="10" cols="50" readonly="readonly" 
		id="messageWindow" style="width:80%;"></textarea><br>
	<input id="inputMessage" type="text" style="width:80%;" onkeydown="keyin()">
	<input type="button" value="전송" onclick="send()">
</div>
<script type="text/javascript">
	//textarea 태그
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket //웹소켓 서버와 접속
				("ws://192.168.0.118:8080${path}/chatting"); //자신 컴퓨터의 ip 확인후 입력
	var inputMessage = document.getElementById("inputMessage");
	//오류 발생시
	webSocket.onerror = function(event){
		onError(event);
	}
	//처음 접속 성공.
	webSocket.onopen = function(event){
		onOpen(event);
		alert("즐거운 채팅. 비속어 금지");
	}
	//서버로부터 메세지 수신시 발생되는 이벤트.
	webSocket.onmessage = function(event){
		onMessage(event);
	}
	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "연결 성공\n";
	}
	function onError(event){
		alert("연결 실패 : " + event.data)
	}
	function send(){
		textarea.value += "${sessionScope.login} :"
							+ inputMessage.value + "\n";
		webSocket.send('${sessionScope.login}:' +inputMessage.value);
		inputMessage.value = "";
	}
	function keyin(){
		if(event.keyCode ==13){ //enter키 코드값
			send()
		}
	}
</script>
</body>
</html>

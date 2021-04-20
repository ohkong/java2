<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/chat/chatform.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä��ȭ��</title>
</head>
<body>
<div style="width:100%;">
	<textarea rows="10" cols="50" readonly="readonly" 
		id="messageWindow" style="width:80%;"></textarea><br>
	<input id="inputMessage" type="text" style="width:80%;" onkeydown="keyin()">
	<input type="button" value="����" onclick="send()">
</div>
<script type="text/javascript">
	//textarea �±�
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket //������ ������ ����
				("ws://192.168.0.118:8080${path}/chatting"); //�ڽ� ��ǻ���� ip Ȯ���� �Է�
	var inputMessage = document.getElementById("inputMessage");
	//���� �߻���
	webSocket.onerror = function(event){
		onError(event);
	}
	//ó�� ���� ����.
	webSocket.onopen = function(event){
		onOpen(event);
		alert("��ſ� ä��. ��Ӿ� ����");
	}
	//�����κ��� �޼��� ���Ž� �߻��Ǵ� �̺�Ʈ.
	webSocket.onmessage = function(event){
		onMessage(event);
	}
	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "���� ����\n";
	}
	function onError(event){
		alert("���� ���� : " + event.data)
	}
	function send(){
		textarea.value += "${sessionScope.login} :"
							+ inputMessage.value + "\n";
		webSocket.send('${sessionScope.login}:' +inputMessage.value);
		inputMessage.value = "";
	}
	function keyin(){
		if(event.keyCode ==13){ //enterŰ �ڵ尪
			send()
		}
	}
</script>
</body>
</html>

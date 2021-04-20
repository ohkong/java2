// /WebContent/ajax2.js
var ajax = {}	//객체
ajax.xhr = {}	//객체
ajax.xhr.Request = function(url, params, callback, method){	//생성자
	this.url = url;	//멤버변수
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();	//멤버메서드
}
//prototype : 멤버 구현
ajax.xhr.Request.prototype = {
	getXmlHttpRequest : function() {
		if(window.ActiveXObject){
			try{
				return new ActiveXObject("Msxml12.XMLHTTP");
			}catch(e){
				try{
					return new ActiveXObject("MicroSoft.XMLHTTP");
				}catch(e){return null;}
			}
		}else if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}else{
			return null;
		}
	},
	send : function() {
		this.req = this.getXmlHttpRequest();
		var httpMethod = this.method?this.method:"GET";
		if(httpMethod != "GET" && httpMethod != "POST"){
			httpMethod = "GET";
		}
		var httpParams = 
		(this.params == null || this.params == '')?null:this.params;
		var httpUrl = this.url;
		if(httpMethod == "GET" && httpParams != null){
			httpUrl = httpUrl + "?" + httpParams;
		}
		this.req.open(httpMethod,httpUrl,true);
		this.req.setRequestHeader
					("Content-Type","application/x-www-form-urlencoded");
		var request = this;	//this 객체 : ajax.xhr.Request 
		this.req.onreadystatechange = function(){	//콜백함수 등록
			request.onStateChange.call(request);
		}
		this.req.send(httpMethod=="POST"?httpParams:null);
	},
	onStateChange : function(){
		//this.callback : 매개변수로 전달된 콜백함수 이름
		//this.req : ajax 객체
		this.callback(this.req); //callback 함수 호출
	}
}
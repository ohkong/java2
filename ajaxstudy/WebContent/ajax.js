// ajaxstudy/WebContent/ajax.js
var ajax = null;	// 전역변수 선언
function getAjaxObject(){
	if(window.ActiveXObject){	//익스플로러?
		try{
			return new ActiveXObject("Msxm12.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e2){
				return null;
			}
		}
	} else if (window.XMLHttpRequest){	//그외 브라우저
		return new XMLHttpRequest();	//ajax 실행을 위한 객체. 웹표준
	}else{
		return null;
	}
}
//"hello.jsp","name=홍길동",helloFromServer,"POST"
function sendRequest(url,params,callback,method){
	ajax = getAjaxObject();	//XMLHttpRequest 객체 생성
	var httpMethod = method?method:"GET";
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	//httpMethod : GET || POST
	var httpParams = (params == null || params =='')?null:params;
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	}
	//ajax 준비.
	//true : 비동기 방식으로 설정
	ajax.open(httpMethod,httpUrl,true);
	ajax.setRequestHeader	//요청 header 부분 설정. 기본설정
			("Content-Type","application/x-www-form-urlencoded");
	//onreadystatechange : 콜백함수 설정.
	//콜백함수 : 서버에서 응답이 온경우 자동으로 호출되는 함수
	//			서버에서 응답이 오면 ajax 객체의 상태가 변경됨
	//			ajax 객체의 상태가 변경시 호출됨.
	ajax.onreadystatechange = callback;
	ajax.send(httpMethod=="POST"?httpParams:null);
}
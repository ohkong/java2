<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title><decorator:title /></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<script type="text/javascript"
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<decorator:head />
<script type="text/javascript"
	src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
</head>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>Menu</button>
  <span class="w3-bar-item w3-right">
  <c:if test="${empty sessionScope.login}">
  	�α����� �ʿ��մϴ�.
  	<a href="${path}/main/member/loginForm.me">�α���</a>
  	<a href="${path}/main/member/joinForm.me">ȸ������</a>
  </c:if>
  <c:if test="${!empty sessionScope.login}">
  	${sessionScope.login}���� ȯ���մϴ�.&nbsp;&nbsp;
  	<a href="${path}/main/member/info.me?id=${sessionScope.login}">�� ����</a>
  	<a href="${path}/main/member/logout.me">�α׾ƿ�</a>
  </c:if>
  </span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
 <div class="w3-container">
    <h5>�޴�</h5>
  </div>
  <a href="${path}/main/member/main.me" class="w3-bar-item w3-button w3-padding"><i class="fa fa-home fa-fw"></i>&nbsp; Ȩȭ��</a><br>
  <c:if test="${sessionScope.login=='admin'}">
  <a href="${path}/main/member/list.me" class="w3-bar-item w3-button w3-padding"><i class="fa fa-certificate fa-fw"></i>&nbsp; ȸ������</a>
  </c:if>
  <hr>
  
  <div class="w3-container w3-row">
    <c:if test="${!empty sessionScope.login}">
      <img src="${path}/main/member/picture/${sessionScope.picture}" class="w3-circle" style="width:100%">
      </c:if>
       <c:if test="${empty sessionScope.login}">
      <span>�α��ν� ������ ǥ�õ˴ϴ�.</span>
      </c:if>
      <br>
    
  </div>
  <hr>
 
  <div class="w3-bar-block">
  	<!-- ${path}/main/member/main.me -->
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" 
    			onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>Close Menu</a>
    <a href="${path}/main/board/game/list.do?btype=1" class="w3-bar-item w3-button w3-padding"><i class="fa fa-globe fa-fw"></i>&nbsp; ��������/��� �Խ���</a>
    <a href="${path}/main/board/tournament/list.do?btype=2" class="w3-bar-item w3-button w3-padding"><i class="fa fa-briefcase fa-fw"></i>&nbsp; ��ȸ �ҽ�</a>
    <a href="${path}/main/board/trade/list.do?btype=3" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>&nbsp; �ŷ� �Խ���</a>
    <a href="${path}/main/board/free/list.do?btype=4" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i>&nbsp; ���� �Խ���</a>
  </div>
</nav>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" 
			style="cursor:pointer" title="close side menu" id="myOverlay">
			
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
  	
   </header>

<!-- 
	<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-padding-16">
        <div class="w3-container w3-border w3-border-white w3-padding-16">
        
        
      </div>
      </div>
    </div>
    <div class="w3-quarter">
    	<div class="w3-container w3-padding-16">
          <div class="w3-container w3-border w3-border-white w3-padding-16">
        
        
      	  </div>
      </div>
     </div>
    </div>
  <hr>
 -->
    
  
  
  
  <div class="w3-container">
  <decorator:body />
  </div>
  <hr>

  
  <hr>
  <br>
  

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
  
  </footer>

  <!-- End page content -->
  <div>
  <div class="w3-light-grey w3-center w3-padding-24"></div>
</div>
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>

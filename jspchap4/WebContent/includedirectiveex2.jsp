<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--  4/WebContent/includedirectiveex2.jsp  
 	includedirectiveex1.jsp 페이지에 포함되는 페이지 
  --%>
<hr>
<h3>includedirectiveex2.jsp 페이지 입니다.<br>
includedirectiveex1.jsp 호출시 포함되는 페이지 입니다.<br>
두개의 페이지가 같은 서블릿으로 변경 되므로 변수가 공유됩니다.<br>
msg : <%=msg %>
</h3>
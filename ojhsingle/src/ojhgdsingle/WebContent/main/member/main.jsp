<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȭ��</title>
</head>
<body>
<form action="main.me" method="post" name="f">
<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-half">
      <div class="w3-container w3-padding-16">
     
      <input type="hidden" name="btype" value="1">
      	<table class="w3-table-all"><caption>���ӰԽ��� ���</caption>
   <tr><th width = "8%">��ȣ</th><th width="50%" class="w3-center">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
<c:forEach var="b" items="${list1}">
   <tr><td>${boardnum1}</td>
    <c:set var="boardnum1" value="${boardnum1+1}"/>
      <td style = "text-align:left">${b.title}</td>
      <td>${b.id}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td> 
</c:forEach>
</table>

      </div>
    </div>
    <div class="w3-half">
    	<div class="w3-container w3-padding-16">
          
      <input type="hidden" name="btype" value="2">
      	<table class="w3-table-all"><caption>��ȸ�Խ��� ���</caption>
   <tr><th width = "8%">��ȣ</th><th width="50%" class="w3-center">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
<c:forEach var="b" items="${list2}">
   <tr><td>${boardnum2}</td>
    <c:set var="boardnum2" value="${boardnum2+1}"/>
      <td style = "text-align:left">${b.title}</td>
      <td>${b.id}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td> 
</c:forEach>
</table>

      </div>
    </div>
</div>

<div class="w3-row-padding w3-margin-bottom">
    <div class="w3-half">
      <div class="w3-container w3-padding-16">
    
      <input type="hidden" name="btype" value="3">
      	<table class="w3-table-all"><caption>�ŷ��Խ��� ���</caption>
   <tr><th width = "8%">��ȣ</th><th width="50%" class="w3-center">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
<c:forEach var="b" items="${list3}">
   <tr><td>${boardnum3}</td>
    <c:set var="boardnum3" value="${boardnum3+1}"/>
      <td style = "text-align:left">${b.title}</td>
      <td>${b.id}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td> 
</c:forEach>
</table>

      </div>
    </div>
    <div class="w3-half">
    	<div class="w3-container w3-padding-16">
      
      <input type="hidden" name="btype" value="4">
      	<table class="w3-table-all"><caption>�����Խ��� ���</caption>
   <tr><th width = "8%">��ȣ</th><th width="50%" class="w3-center">����</th>
      <th width="14%">�ۼ���</th><th width="17%">�����</th>
<c:forEach var="b" items="${list4}">
   <tr><td>${boardnum4}</td>
    <c:set var="boardnum4" value="${boardnum4+1}"/>
      <td style = "text-align:left">${b.title}</td>
      <td>${b.id}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td> 
</c:forEach>
</table>

      </div>
    </div>
</div>
</form>
</body>
</html>
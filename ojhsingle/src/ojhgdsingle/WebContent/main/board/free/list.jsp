<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판 목록 보기</title>
<script type="text/javascript">
	function listdo(page){
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>
<body>
<form action="list.do" method="post" name="sf">
	<input type="hidden" name="btype" value="4">
	<div style="display : flex; justify-content : center;">
		<input type="hidden" name="pageNum" value="1">
		<select name="column">
			<option value="">선택하세요</option>
			<option value="title">제목</option>
			<option value="id">작성자</option>
			<option value="content">내용</option>
			<option value="title,id">제목+작성자</option>
			<option value="title,content">제목+내용</option>
			<option value="id,content">작성자+내용</option>
			<option value="title,id,content">제목+작성자+내용</option>
		</select>
	<script>document.sf.column.value="${param.column}";</script>
	<input type="text" name="find" value="${param.find}" style="width:50%;">
	<input type="submit" value="검색">
	</div>
</form>
<table class="w3-table-all"><caption>자유게시판 목록</caption>
<c:if test="${boardcount ==0}">
   <tr><td colspan = "5">등록된 게시글이 없습니다.</td></tr>
</c:if>
<c:if test="${boardcount >0}">
   <tr><td colspan = "5" style = "text-align:right">글 개수:${boardcount}</td></tr>
   <tr><th width = "8%">번호</th><th width="50%">제목</th>
      <th width="14%">작성자</th><th width="17%">등록일</th>
      <th width="11%">조회수</th></tr>
<c:forEach var="b" items="${list4}">
   <tr><td>${boardnum}</td>
   <c:set var="boardnum" value="${boardnum-1}"/>
   	<c:if test="${!empty b.file1}">
      <td style = "text-align:left">
      <a href ="file/${b.file1 }"
      style="text-decoration:none;">@</a>
      <a href="info.do?num=${b.num}&btype=${param.btype}">${b.title}</a></td>
      </c:if>
      <c:if test="${empty b.file1}">&nbsp;&nbsp;&nbsp;
      <td style = "text-align:left">
      <a href="info.do?num=${b.num}&btype=${param.btype}">${b.title}</a></td>
      </c:if>
      <td>${b.id}</td>
      <td><fmt:formatDate var="rdate" value="${b.regdate}"
               pattern="yyyy-MM-dd"/>
               <c:if test="${today == rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="HH:mm"/>
               </c:if>
               <c:if test="${today != rdate }">
               <fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
               </c:if></td>
      <td>${b.readcnt}</td></tr> 
</c:forEach>
      
   <tr><td colspan = "5" class="w3-center">
      <c:if test="${pageNum <= 1 }">[이전]</c:if>
      <c:if test="${pageNum > 1 }">
      <a href="javascript:listdo(${pageNum -1})">[이전]</a></c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
         <c:if test="${a==pageNum}">[${a}]</c:if>
         <c:if test="${a!=pageNum}">
         <a href = "javascript:listdo(${a})">[${a}]</a></c:if>
      </c:forEach>
      <c:if test="${pageNum >= maxpage }">[다음]</c:if>
      <c:if test="${pageNum < maxpage }">
      <a href="javascript:listdo(${pageNum +1})">[다음]</a>
      </c:if>
      </td></tr>
   </c:if>
   <tr><td colspan = "5" style="text-align:right">
   <input type="button" value="글쓰기" onclick="location.href='writeForm.do?btype=${param.btype}'"></td></tr>
</table>

</body>
</html>  
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/picture.jsp
	opener 화면에 결과 전달. => javascript
	현재 화면 close() => javascript
--%>
<script type="text/javascript">
   img = opener.document.getElementById("pic");
   img.src = "picture/${fname}";
   //db 저장을 위한 파라미터 설정
   opener.document.f.picture.value="${fname}";
   self.close();
</script>
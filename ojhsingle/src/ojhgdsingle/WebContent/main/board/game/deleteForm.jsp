<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- /WebContent/model2/board/deleteForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խñ� ���� ȭ��</title>

<script type="text/javascript">
//    function inputcheck(f){
//       if(f.pass.value==""){
//          alert("�Խñ� ��й�ȣ�� �Է��ϼ���")
//          f.pass.focus();
//          return false;
//       }
//       return true;
//    }
</script>
</head>
<body>
<form action="delete.do" method="post" onsubmit="return inputcheck(this)">
<input type="hidden" name="num" value="${param.num}">
<input type="hidden" name="btype" value="1">
<table>
   <caption>�������� �Խñ� ���� ȭ��</caption>
      <tr><td>�Խñ� ��й�ȣ</td>
         <td><input type="password" name="pass"></td></tr>
      <tr><td colspan="2"><input type="submit" value="�Խñ� ����"></td></tr>
</table>
</form>
</body>
</html>
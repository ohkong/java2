<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/model2/member/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
<script>
function allchkbox(chk){
	var allchk = chk.checked; //��ü ���ð� , true, false
	//getElementsByName("name") : name �Ӽ��� ����  "mailchk"�� �±׵�. �迭
	// <input name = "mailchk" ....>
		document.getElementsByName("mailchk").forEach
		(function(item,index){
			//item="mailchk" �� �±� �Ѱ�
			if(allchk)	//��ü ����  true
				item.setAttribute("checked",true);
			else	// ���� ���� false
				item.removeAttribute("checked");
		})
}
/*
function allchkbox(f){
	var mailchk = document.getElementsByName("mailchk");
	if(f.checked == true){
		for(var i=0; i<mailchk.length;i++){
			mailchk[i].checked = true;
		}
	}else{
		for(var i=0; i<mailchk.length;i++){
			mailchk[i].checked = false;
		}
	}
}
*/

//jquery�� �̿��Ͽ� allchkbox �����ϱ�
function allchkbox2(chk){
	$("input[name=mailchk]").prop("checked",chk.checked)
}
</script>
</head>
<body>
<form action="mailform.me" method="post">
<table class="w3-table-all w3-border"><caption>ȸ�� ���</caption>
	<tr class="w3-blue"><th>���̵�</th><th>����</th><th>�̸�</th>
	<th>����</th><th>��ȭ</th><th>�̸���</th><th>&nbsp;</th>
	<th><input type="checkbox" name="allchk" onchange="allchkbox2(this)"></th>
	</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td><a href="info.me?id=${m.id}">${m.id}</a></td>
				<td><img src="picture/sm_${m.picture}" width="20" height="30"></td>
				<td>${m.name}</td><td>${m.gender==1?"��":"��"}</td>
				<td>${m.tel}</td>
				<td>${m.email}</td>
				<td><a href="updateForm.me?id=${m.id}">[����]</a>
					<c:if test="${ m.id != 'admin'}">
						<a href="deleteForm.me?id=${m.id}">[����Ż��]</a>
					</c:if>
				</td>
				<td><input type="checkbox" name="mailchk" value="${m.email}"></td>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="w3-center">
			<input type="submit" value="��������"></td></tr>
</table>
</form>
</body>
</html>

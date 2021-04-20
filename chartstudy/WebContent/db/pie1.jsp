<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /20201222/WebContent/pie1.html --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js">
</script>
<style>
 canvas{	
 	-moz-user-select : none;	
 	-webkit-user-select : non;	
 	-ms-user-select : none;				
 }
</style>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
	url="jdbc:mariadb://localhost:3307/classdb"
	user="scott" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
	select name, count(*) cnt from board
	group by name
	having count(*) > 1
	order by cnt desc
</sql:query>
</head>
<body>
<div style="width:75%; boder:1px solid black;">
	<canvas id="canvas"></canvas>
</div>
<script type="text/javascript">
var randomColorFactor = function(){
	return Math.round(Math.random() * 255);
}
var randomColor = function(opacity){
	return "rgba(" + randomColorFactor() + "," 
			+ randomColorFactor() + ","
			+ randomColorFactor() + ","
			+ (opacity || '.3') + ")";
};
var config = {
		type:'pie',
		data:{
			datasets:[{
				data:[<c:forEach items="${rs.rows}" var="m">
					"${m.cnt}",</c:forEach>],
				backgroundColor:[<c:forEach items="${rs.rows}" var="m">
					randomColor(1),</c:forEach>]
			}],
			labels:[<c:forEach items="${rs.rows}" var="m">
			"${m.name}",</c:forEach>]
		},
		options:{
			responsive : true,
			legend : {display:true},
			title : {
				display:true, 
				text:'글쓴이 별 게시판 등록 건수',
				position : 'bottom'
			}
		}
};
window.onload = function(){
	var ctx = document.getElementById('canvas').getContext('2d');
	new Chart(ctx,config);
}
</script>
</body>
</html>
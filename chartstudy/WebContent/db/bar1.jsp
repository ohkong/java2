<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/db/bar1.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>막대/선 그래프로 게시글 작성자의 건수 출력하기</title>
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
<div style="width:75%">
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
var chartData = {
		labels:[<c:forEach items="${rs.rows}" var="m">
		"${m.name}",</c:forEach>],
		datasets:[{
			type:'line',
			borderWidth:2,
			borderColor:[<c:forEach items="${rs.rows}" var="m">
			randomColor(1),</c:forEach>],
			label:'건수',
			fill:false,
			data:[<c:forEach items="${rs.rows}" var="m">
				"${m.cnt}",</c:forEach>],
		},{
			type:'bar',
			label:'건수',
			backgroundColor:[<c:forEach items="${rs.rows}" var="m">
			randomColor(1),</c:forEach>],
			data:[<c:forEach items="${rs.rows}" var="m">
			"${m.cnt}",</c:forEach>],
			borderWidth:2
		}]
};
window.onload = function(){
	var ctx = document.getElementById('canvas').getContext('2d');
	new Chart(ctx,{
		type:'bar',
		data:chartData,
		options:{
			responsive : true,
			title : {display:true, text:'게시판 등록 건수'},
			legend : {display:false},
			scales : {
				xAxes:[{
					display : true,
					scaleLabel:{
						display : true,
						labelString : "게시물 작성자"
					},
				stacked : true
				}],
				yAxes:[{
					display : true,
					scaleLabel:{
						display : true,
						labelString : "게시물 작성 건수"
					},
				stacked : true
				}]
			}
			
		}
	})
}
</script>
</body> 
</html>
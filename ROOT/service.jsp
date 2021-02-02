<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>service</title>
<style>
	a {
		color:#7F7F7F;
		text-decoration:none;
		margin-left: 15px;
		margin-right:15px;
		font-size: 10px;
		text-align: center;
	}
	a:hover {
		color:#545454;
	}
</style>
<script>
	document.mailFrm.submit();
</script>
</head>
<body>
	<table align="right" style="text-decoration:none;">
		<tr>
			<td><a href="#" onClick="window.open('http://mail.company.com/','_blank','width=800,height=800')">MAIL</a></td>
			<td><a href="#" onClick="window.open('http://cloud.se.company.com/','_blank','width=800,height=800')">CLOUD</a></td>
			<td><a href="#" onClick="window.open('http://ncloud.se.company.com/','_blank','width=800,height=800')">NCLOUD</a></td>
		</tr>
	</table>
</body>
</html>

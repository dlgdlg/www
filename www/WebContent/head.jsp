<%@ page contentType="text/html; charset=utf-8"%>
<%
	  String cPath = request.getContextPath();
%>
<html>
<head>
<title>head</title>
<style>
	body {
		margin-top:20px;
		text-align: center;
		minwidth:800px;
		minheight: 50px;
	}
	body b{
		color: black;
		font-size:30px;
		text-weight: bold;
	}
	body p {
		color: #7F7F7F;
		font-size: 15px;
		text-weight: bold;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<a href="<%=cPath%>/index.jsp" target="_parent" onFocus="this.blur();"><b>COMPANY</b></a>
	<p>KITRI</p>
</body>
</html>
<%@ page contentType="text/html; charset=euc-kr"%>
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
		color: #ABABAB;
		font-size: 10px;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<a href="<%=cPath%>/www/index.jsp" target="_parent" onFocus="this.blur();"><b>COMPANY</b></a>
	<p>BONOBONO</p>
</body>
</html>
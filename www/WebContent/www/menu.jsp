<%@ page contentType="text/html; charset=utf-8"%>
<%
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<style>
	body {
		text-align: center;
		text-decoration: none;
	}
	body a{
		color: #ABABAB;
		margin-left:30px;
		margin-right:30px;
		text-decoration: none;
	}
	body a:hover{
		text-weight: bold;
		color: #7F7F7F;
		text-decoration: none;
	}
</style>
</head>
<body>
	<a href="<%=cPath%>/www/menu/intro.jsp" target="content">회사소개</a>
	<a href="<%=cPath%>/www/menu/info.jsp" target="content">채용정보</a>
	<a href="<%=cPath%>/www/board/list.jsp" target="content">고객센터</a>
	<a href="http://wiki.company.com" target="content">위키</a>
</body>
</html>
<%@ page contentType="text/html; charset=euc-kr"%>
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
	<a href="<%=cPath%>/www/menu/intro.jsp" target="content">ȸ��Ұ�</a>
	<a href="<%=cPath%>/www/menu/info.jsp" target="content">ä������</a>
	<a href="<%=cPath%>/www/board/list.jsp" target="content">��������</a>
	<a href="http://wiki.company.com" target="content">��Ű</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="mMgr" class="www.MemberMgr1"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<title>checkid</title>
</head>
<body bgcolor="white">
	<div align="center">
		<br/><b><%=id%></b>
		<%
			if(result) {
				out.println("는 이미 존재하는 ID 입니다.<p>");
				
			} else{
				out.println("는 사용 가능한 ID 입니다.<p>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>
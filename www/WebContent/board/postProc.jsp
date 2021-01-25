<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bMgr" class="www.BoardMgr"/>
<%
	  bMgr.insertBoard(request);
	  response.sendRedirect("list.jsp");
%>
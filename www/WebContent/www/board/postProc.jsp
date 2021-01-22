<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bMgr" class="www.BoardMgr"/>
<%
	  bMgr.insertBoard(request);
	  response.sendRedirect("list.jsp");
%>
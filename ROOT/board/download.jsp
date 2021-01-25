<%@ page contentType="application;charset=utf-8"%>
<jsp:useBean id="bMgr" class="www.BoardMgr" />
<%
	  bMgr.downLoad(request, response,out,pageContext);
%>
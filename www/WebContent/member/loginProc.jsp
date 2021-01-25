<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="mMgr1" class="www.MemberMgr1"/>
<%
	  request.setCharacterEncoding("euc-kr");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pass");
	  String url = cPath+"/www/right.jsp";
	  String msg = "로그인에 실패 하였습니다.";
	  boolean result = mMgr1.loginMember(id,pass);
	  System.out.println(result);
	  if(result){
		  session.setAttribute("idKey",id);
			Cookie cookie = new Cookie("idKey", id);
			cookie.setMaxAge(60);
			cookie.setPath("/");
			cookie.setDomain(".company.com");
			response.addCookie(cookie);
	  }
%>
<script>
	<% if(!result) { %>
		alert("<%=msg%>");
	<% } %>
	top.document.location.reload(); 
	location.href="<%=url%>";
</script>

<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr1" class="www.MemberMgr1"/>
<%
	  request.setCharacterEncoding("euc-kr");
	  String cPath = request.getContextPath();
	  String id = request.getParameter("id");
	  String pass = request.getParameter("pass");
	  String url = cPath+"/www/right.jsp";
	  String msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  System.out.println("LoginProc.jsp�� ����Ϸ�!");
	  boolean result = mMgr1.loginMember(id,pass);
	  System.out.println(result);
	  if(result){
		  session.setAttribute("idKey",id);
			Cookie cookie = new Cookie("idKey", id);
			cookie.setMaxAge(60);
			cookie.setPath("/");
			cookie.setDomain("cloud.company.com");
			response.addCookie(cookie);
	    msg = "�α��ο� ���� �Ͽ����ϴ�.";
	  }
%>
<script>
	alert("<%=msg%>");
	top.document.location.reload(); 
	location.href="<%=url%>";
</script>
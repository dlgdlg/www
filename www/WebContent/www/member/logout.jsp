<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	session.invalidate(); //���� ����
	
	Cookie[] cookies = request.getCookies();
	if(cookies!=null) {
		for(Cookie tempCookie : cookies){
			if(tempCookie.getName().equals("idKey")){
				tempCookie.setMaxAge(0);
				tempCookie.setPath("/");
				tempCookie.setDomain(".company.com");
				response.addCookie(tempCookie);
			}
		}
	}
      	
%>
<script>
   alert('�α׾ƿ� �Ǿ����ϴ�.');
   top.document.location.reload(); 
   location.href="<%=request.getContextPath()%>/www/right.jsp"; <!-- ó�� â �ٽ� ��Ÿ�� -->
</script>
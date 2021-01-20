<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	session.invalidate(); //세션 해제
	
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
   alert('로그아웃 되었습니다.');
   top.document.location.reload(); 
   location.href="<%=request.getContextPath()%>/www/right.jsp"; <!-- 처음 창 다시 나타남 -->
</script>
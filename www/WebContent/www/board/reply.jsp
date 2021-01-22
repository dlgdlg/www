<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="bBean" class="www.BoardBean" scope="session"/>
<%
	  String nowPage = request.getParameter("nowPage");
	  String subject = bBean.getSubject();
	  String content = bBean.getContent(); 
		request.setCharacterEncoding("utf-8");
	  
	  Cookie[] cookies = request.getCookies();
	  if(cookies != null) {
		  for(Cookie tempCookie : cookies) {
			  if(tempCookie.getName().equals("idKey")) {
					session.setAttribute("idKey", tempCookie.getValue());
			  	}
		  	}
	  	}
	 	String id = (String) session.getAttribute("idKey");
%>
<html>
<head>
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function passInputCheck() {
	if((document.post.pass.value == "") || (document.post.pass.value == null)) {
		alert("비밀번호를 입력해주세요.");
		document.post.pass.focus();
		return false;
		
	} else {
		postFrm.submit();
	}
}
</script>
</head>
<body bgcolor="white">
<div align="center">
<br><br>
 <table width="460" cellspacing="0" cellpadding="3">
  <tr>
   <td bgcolor="#E0E0E0" height="21" align="center">REPLY</td>
  </tr>
</table>
<form name="post" method="post" action="replyProc.jsp" >
<table width="527" cellspacing="0" cellpadding="7">
 <tr>
  <td align="center">
   <table border="0">
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
		<% if(id !=null) { %>
					<input type="text" name="name" size="51" maxlength="15" value=<%=id%> readonly></td>
				<% } else { %>
					<input type="text" name="name" size="51" maxlength="15"></td>
				<% } %>
    </tr>
    <tr>
     <td width="20%">제 목</td>
     <td width="80%">
	  <input type="text" name="subject" size="51" value="답변 : <%=subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td width="20%">내 용</td>
     <td width="80%">
	  <textarea name="content" rows="12" cols="50">
      	<%=content %>
      	========답변 글을 쓰세요.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td width="20%">비밀 번호</td> 
     <td width="80%">
	  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr size="1"></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <input type="submit" value="답변등록"  onClick="return passInputCheck()">
      <input type="reset" value="다시쓰기">
      <input type="button" value="뒤로" onClick="history.back()"></td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bBean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bBean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bBean.getDepth()%>">
</form> 
</div>
</body>
</html>

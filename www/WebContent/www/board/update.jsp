<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="www.BoardBean"%>
<% 
		request.setCharacterEncoding("utf-8");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bBean = (BoardBean)session.getAttribute("bBean");
	  String subject = bBean.getSubject();
	  String name = bBean.getName(); 
	  String content = bBean.getContent();
	  
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
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="white">
<div align="center">
<br><br>
<table width="460" cellspacing="0" cellpadding="3">
  <tr>
   <td bgcolor="#E0E0E0"  height="21" align="center">EDIT</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="updateProc.jsp" >
<table width="70%" cellspacing="0" cellpadding="7">
 <tr>
  <td align="center">
   <table border="0">
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input type="text" name="name" value="<%=name%>" size="51" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td width="20%">제 목</td>
     <td width="80%">
	  <input type="text" name="subject" size="51" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td width="20%">내 용</td>
     <td width="80%">
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td width="20%">비밀 번호</td> 
     <td width="80%"><input type="password" name="pass" size="15" maxlength="15">
      수정시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr size="1"></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</body>
</html>

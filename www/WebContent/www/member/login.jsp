<%@ page contentType="text/html; charset=utf-8"%>
<%
	  request.setCharacterEncoding("euc-kr");
	  
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
<title>Login</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력하시오.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pass.value == "") {
			alert("비밀번호를 입력하시오.");
			document.loginFrm.pass.focus();
			return;
		}
		document.loginFrm.action = "member/loginProc.jsp";
		document.loginFrm.submit();
	}
</script>
<style>
	.login {
		width:100px;
	}
</style>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
 <div class="login" align="center" style="width: 100%;">
		<%
			if (id != null) { 
		%>
		<table>
			<tr>
				<td><b><%=id%></b> 님</td>
				<td><a href="member/logout.jsp">LOGOUT</a></td>
			</tr>
		</table>
		<p>--------------------------------------
		<p>
			<table>
				<tr>
					<td><a href="#" onClick="window.open('http://mail.company.com/','_blank','width=800,height=800')">MAIL</a></td>
					<td> / </td>
					<td><a href="#" onClick="window.open('http://cloud.company.com/','_blank','width=800,height=800')">CLOUD</a></td>
					<td> / <td>
					<td><a href="#" onClick="window.open('http://ncloud.company.com/','_blank','width=800,height=800')">NCLOUD</a></td>
				</tr>
			</table>
			<%} else {%>
		<form name="loginFrm" method="post" action="member/loginProc.jsp">
			<table>
				<tr>
					<td align="left" colspan="2"><h4>LOGIN</h4></td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" value="" size="15"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="password" name="pass" value="" size="15"></td>
				</tr>
				<tr align="right">
					<td colspan="2">
						<input type="button" value="LOGIN" onclick="loginCheck()">
					</td>
				</tr>
			</table>
		</form>
		<%}%>
	</div>
</body>
</html>

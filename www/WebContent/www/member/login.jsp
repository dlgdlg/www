<%@ page contentType="text/html; charset=EUC-KR"%>
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
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pass.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pass.focus();
			return;
		}
		document.loginFrm.action = "member/loginProc.jsp";
		document.loginFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
 <div align="center">
		<%
			if (id != null) { //로그인을 성공
		%>
		<table>
			<tr>
				<td><b><%=id%></b> 님</td>
				<td><a href="member/logout.jsp">로그아웃</a></td>
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
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="LOGIN" onclick="loginCheck()">&nbsp;
						</div>
					</td>
				</tr>
			</table>
		</form>
		<%}%>
	</div>
</body>
</html>

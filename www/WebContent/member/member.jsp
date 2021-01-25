<%@ page contentType="text/html;charset=utf-8"%>
<jsp:useBean id="mMgr" class="www.MemberMgr1"/>
<%
	String id = null;
	boolean result = false;
	boolean dup = false;
%>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function idCheck(id) {
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
	function confirm() {
		if(document.regFrm.id.value == "" || document.regFrm.id.value == null) {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		if(document.regFrm.pass.value == "" || document.regFrm.pass.value == null) {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		if(document.regFrm.repass.value == "" || document.regFrm.repass.value == null){
			alert("확인용 비밀번호를 입력해 주세요.")
			return false;
		}
		if(document.regFrm.pass.value != document.regFrm.pass.repass.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			document.regFrm.pass.value = "";
			document.regFrm.repass.value = "";
			return false;
		}
	}
</script>
</head>
<body bgcolor="white" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="white">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#E0E0E0">
								<td colspan="3"><font color="black"><b>SIGN UP</b></font></td>
							</tr>
							<tr>
								<td width="20%" align="center">ID</td>
								<td width="70%">
									<input type="text" name="id" size="50"
									value=""><input type="button" value="ID중복확인"
									onClick="idCheck(this.form.id.value)"></td>
							</tr>
							<tr>
								<td align="center">PASSWORD</td>
								<td><input type="password" name="pass" size="50" value=""></td>
							</tr>
							<tr>
								<td align="center">CHECK PASS</td>
								<td><input type="password" name="repass" size="50" value=""></td>
							</tr>
							<tr>
								<td align="center">GROUP</td>
								<td>
									<select name="group">
										<option value="users" selected>users
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit"value="회원가입"  onClick="return confirm()"> &nbsp; &nbsp; 
									<input type="reset" value="다시쓰기"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

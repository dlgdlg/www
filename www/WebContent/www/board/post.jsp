<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String id = (String) session.getAttribute("idKey");
%>
<html>
<head>
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function passInputCheck() {
	if((document.postFrm.pass.value == "") || (document.postFrm.pass.value == null)) {
		alert("��й�ȣ�� �Է����ּ���.");
		document.postFrm.pass.focus();
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
<table width="80%" cellspacing="0" cellpadding="3">
	<tr>
		<td bgcolor="#E0E0E0" height="25" align="center">WRITE</td>
	</tr>
</table>
<br>
<form name="postFrm" method="post" action="postProc.jsp" enctype="multipart/form-data">
<table width="80%" cellspacing="0" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table border="0" width="100%" align="center">
			<tr>
				<td width="10%">�� ��</td>
				<td width="90%">
				<% if(id !=null) { %>
					<input type="text" name="name" size="51" maxlength="15" value=<%=id%> readonly></td>
				<% } else { %>
					<input type="text" name="name" size="51" maxlength="15"></td>
				<% } %>
			</tr>
			<tr>
				<td width="10%">�� ��</td>
				<td width="90%">
				<input type="text" name="subject" size="51" maxlength="30"></td>
			</tr>
			<tr>
				<td width="10%">�� ��</td>
				<td width="90%"><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td width="10%">��� ��ȣ</td>
				<td width="90%"><input type="password" name="pass" size="51" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td width="10%">����ã��</td> 
     			<td width="90%" ><input type="file" name="filename" size="51" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>����Ÿ��</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="���" onClick="return passInputCheck()">
					 <input type="reset" value="�ٽþ���">
					 <input type="button" value="����Ʈ" onClick="javascript:location.href='list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>
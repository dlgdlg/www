<%@ page contentType="text/html; charset=utf-8" %>
<%
    String strTitle = "COMPANY";
	  String cPath = request.getContextPath();
%>
<html>
<head>
<title><%=strTitle%></title>
<style>
	.frs {
		min-width: 800px;
		min-height: 800px;
	}
	.content {
		min-width: 640px;
	}
	.right {
		min-width: 160px;
	}
	
</style>
</head>
<body>
	<div class="frs">
		<div>
			<iframe name="service" height="50" width="100%" src="<%=cPath%>/www/service.jsp" style="border:1px solid #BFBFBF;" scrolling="no"></iframe>
		</div>
		<div>
			<iframe name="head" height="100" width="100%" src="<%=cPath%>/www/head.jsp" style="border:1px solid #BFBFBF;" scrolling="no"></iframe>
		</div>
		<div>
			<iframe name="menu" height="30" width="100%" src="<%=cPath%>/www/menu.jsp" style="border:1px solid #BFBFBF; text-align: center;" scrolling="no"></iframe>
		</div>
		<div>
			<table style="border-collapse: collapse;">
				<tr>
					<td style="width: 80%;">
						<iframe class="content" name="content" height="600" width="100%" src="<%=cPath%>/www/content.jsp"></iframe>
					</td>
					<td style="width: 20%;">
						<iframe clas="right" name="right" height="600" width="100%" src="<%=cPath%>/www/right.jsp" scrolling="auto"></iframe>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<iframe name="copy" height="50" width="100%" src="<%=cPath%>/www/copy.jsp" style="border:1px solid #BFBFBF;" scrolling="no"></iframe>
		</div>
	</div>
</body>
</html>
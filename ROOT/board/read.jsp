<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="www.BoardBean"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<jsp:useBean id="bMgr" class="www.BoardMgr" />
<%
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  BoardBean bBean = bMgr.getBoard(num);//게시물 가져오기
	  String name = bBean.getName();
	  String subject = bBean.getSubject();
      String regdate = bBean.getRegdate();
	  String content = bBean.getContent();
	  String filename = bBean.getFilename();
	  int filesize = bBean.getFilesize();
	  String ip = bBean.getIp();
	  int count = bBean.getCount();
	  session.setAttribute("bBean", bBean);//게시물을 세션에 저장
%>
<html>
<head>
<title>board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list(){
	 	document.listFrm.action="list.jsp";
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
	function checkId() {
		if("<%=name%>" != "<%=id%>") {
			alert("아이디가 일치하지 않습니다.");
			return false;
		}
	}
	function checkLogin() {
		if(<%=id%> == null){
			alert("로그인을 하지 않았습니다.");
			return false;
		}
	}
</script>
</head>
<body bgcolor="white">
<br><br>
<table align="center" width="70%" border=0 cellspacing="3" cellpadding="0">
 <tr>
  <td colspan="2">
   <table border="1px" cellpadding="3" cellspacing="0" width=100%> 
    <tr> 
  <td align="center" bgcolor="#EEEEEE" width="10%"> 이 름 </td>
  <td bgcolor="white"><%=name%></td>
  <td align="center" bgcolor="#EEEEEE" width=10%> 등록날짜 </td>
  <td bgcolor="white"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#EEEEEE"> 제 목</td>
    <td bgcolor="white" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#EEEEEE">첨부파일</td>
     <td bgcolor="white" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br><pre><%=content%></pre><br></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr size="1">
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" onclick="return checkId()">수 정</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>" onclick="return checkLogin()">답 변</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" onclick="return checkId()">삭 제</a> ]<br>
  </td>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals("null"))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
</body>
</html>
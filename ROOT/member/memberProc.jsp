<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mMgr" class="www.MemberMgr1"/>
<jsp:useBean id="mBean" class="www.MemberBean"/>
<jsp:setProperty name="mBean" property="*"/>
<%
	boolean result = mMgr.insertMember(mBean);
	if(result){
%>
<script type="text/javascript">
		location.href="../content.jsp";
</script>
<%
	}else{
%>
<script type="text/javascript">
		history.back();
</script>
<%
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="user" class="mc_delivery.MemberDTO" />
<jsp:setProperty property="*" name="user"/>
<c:set var="login" value="${dao.login(user)}" />
<c:if test="${login != null}">
<%
	session.setAttribute("login", pageContext.getAttribute("login"));
	session.setMaxInactiveInterval(600);	// 아무것도 안하고 600초 지나가면 세션이 만료됨
%>
	<c:redirect url="/index.jsp" />
</c:if>
	<c:if test="${login == null }">
</c:if>

<script>
 	const login = ${empty session.login}	// true or false
 	if(login){
 		alert('로그인 실패')
 		location.href = '${cpath}/index.jsp'
 	}
</script>

</body>
</html>
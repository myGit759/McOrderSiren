<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
	<jsp:useBean id="user" class="mc_delivery.MemberDTO" />
	<jsp:setProperty property="*" name="user" />
	
	<c:set var="row" value="${dao.insert_mem(user) }"/>
	
	<c:if test="${row != 0 }">
		<c:redirect  url="index.jsp"/>
	</c:if>
	
	<c:if test="${row == 0 }">
		<c:redirect url="join.jsp?false=duple"/>
	</c:if>
</body>
</html>
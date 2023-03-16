<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${dao.delete_mem(login.idx) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/logout.jsp" />
</c:if>

<c:if test="${row == 0 }">
	<h3>탈퇴 실패</h3>
<a href="mypage.jsp"><button>돌아가기</button></a>
</c:if>

</body>
</html>
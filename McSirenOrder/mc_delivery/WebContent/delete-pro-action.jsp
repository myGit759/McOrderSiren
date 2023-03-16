<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${dao.delete_pro(param.idx) }" />

<c:if test="${row != 0 }">
	<c:redirect url="/list_pro.jsp" />
</c:if>

<c:if test="${row == 0 }">
	<h3>삭제 실패</h3>
<a href="${cpath }/list_pro.jsp"><button>돌아가기</button></a>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
<fieldset>
	<legend>비밀번호 찾기</legend>
	<c:if test="${param.password == param.passwordCheck }">
		<c:set var="row" value="${dao.update_memPassword(param.idx, param.password) }" />
		<h3>비밀번호가 변경되었습니다</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
	<c:if test="${param.password != param.passwordCheck }">
		<h3>변경 실패 : 새 비밀번호 확인 오류</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
</fieldset>
</section>

</body>
</html>
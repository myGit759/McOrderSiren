<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.findOne_mem(param.email, param.id, param.name) }" />

<section>
<c:if test="${dto != null }">
<fieldset>
	<legend>비밀번호 찾기</legend>
	<form method="POST" action="findPassword-action.jsp">
		<p><input type="hidden" name="idx" value="${dto.idx }"></p>
		<p><input type="password" name="password" placeholder="새 비밀번호 입력" required autofocus></p>
		<p><input type="password" name="passwordCheck" placeholder="새 비밀번호 확인" required autofocus></p>
		<p><input type="submit" value="수정"></p>
	</form>
</fieldset>
</c:if>

<c:if test="${dto == null }">
<fieldset>
	<legend>비밀번호 찾기</legend>
	<h3>잘못된 정보 입력</h3>
	<a href="${cpath }"><button>홈으로</button></a>
</fieldset>
</c:if>
</section>

</body>
</html>
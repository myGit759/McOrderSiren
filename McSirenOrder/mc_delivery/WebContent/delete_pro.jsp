<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
<section>
<fieldset>
	<legend>
		<h3>삭제하시겠습니까?</h3>
		<a href="${cpath}/delete-pro-action.jsp?idx=${param.idx }"><button>삭제하기</button></a>
	</legend>
</fieldset>
</section>
</main>
</body>
</html>
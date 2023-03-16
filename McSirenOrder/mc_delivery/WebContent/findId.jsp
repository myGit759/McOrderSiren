<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
<fieldset>
	<legend>아이디 찾기</legend>
	<form method="POST" action="findId-action.jsp">
		<p><input type="email" name="email" placeholder="이메일" required autofocus></p>
		<p><input type="submit" value="찾기"></p>
	</form>
</fieldset>
	
</section>
</body>
</html>
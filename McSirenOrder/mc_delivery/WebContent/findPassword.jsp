<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>

<fieldset>
	<legend>비밀번호 찾기</legend>
	<form method="POST" action="findPassword-form.jsp">
		<p><input type="email" name="email" placeholder="이메일" required autofocus></p>
		<p><input type="text" name="id" placeholder="아이디" required></p>
		<p><input type="text" name="name" placeholder="이름" required ></p>
		<p><input type="submit" value="찾기"></p>
	</form>
</fieldset>
</section>

</body>
</html>
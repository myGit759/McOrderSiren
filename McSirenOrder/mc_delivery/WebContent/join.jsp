<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="join">
	<form action="join-action.jsp" method="POST">
		<p>
			<input type="text" name="id" placeholder="ID" required autofocus>
			<span class="<%=request.getParameter("false") != null ? "duple" : "fst" %>">아이디 중복</span>
		</p>
		<p><input type="password" name="password" value="${user.password }" placeholder="Password" required>
		<p><input type="text" name="name" value="${user.name }" placeholder="성함" required></p>
		<p><input type="text" name="phonenum" value="${user.phonenum }" pattern="[0-9]+[-]+[0-9]+[-]+[0-9]+" placeholder="H.P(010-xxxx-xxxx)" required></p>
		<p><input type="text" name="email" value="${user.email }" placeholder="이메일 주소" required></p>
		<p>
			<select name="gender" required>
				<option value="">====성별 선택====</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
		</p>
		<p><input type="number" name="age" value="${user.age }" placeholder="나이" required></p> 
		<p><input type="submit" value="가입신청"></p>
	
	</form>
</section>
</body>
</html>
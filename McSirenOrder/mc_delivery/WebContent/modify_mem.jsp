<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne_mem(param.idx) }" />

<main>
<aside>
<c:if test="${login.id == 'admin' }">
	<nav>
		<ul>
			<li>마이페이지</li>
			<li><a href="${cpath }/list_mem.jsp">회원 관리</a></li>
			<li><a href="${cpath }/list_pro.jsp">제품 관리</a></li>
			<li><a href="${cpath }/list_ord.jsp">주문 내역 관리</a></li>
		</ul>
	</nav>
</c:if>

<c:if test="${login.id != 'admin' }">
	<nav>
		<ul>
			<li>마이페이지</li>
			<li><a href="${cpath }/pointCharge.jsp">포인트 충전</a></li>
		</ul>
	</nav>
</c:if>
</aside>

<section>
<h3>회원 수정</h3>
<form method="POST" action="modify_mem-action.jsp">
	<p><input type="number" name="idx" placeholder="idx" value="${dto.idx }" readonly></p>
	<p><input type="text" name="id" value="${dto.id }"  readonly></p>
	<p><input type="text" name="password" value="${dto.password }" ></p>
	<p><input type="text" name="name" value="${dto.name }"></p>
	<p><input type="text" name="phonenum" value="${dto.phonenum }" placeholder="휴대전화 번호"></p>
	<p><input type="text" name="email" value="${dto.email }" placeholder="이메일 주소"></p>
	<p>
		<select name="gender" required>
				<option>====성별 선택====</option>
				<option ${dto.gender == 'M' ? 'selected' : '' } value="M">남자</option>
				<option ${dto.gender == 'F' ? 'selected' : '' } value="F">여자</option>
		</select>
	</p>
	<p><input type="number" name="age" value="${dto.age }"></p>
	<p><input type="submit" value="수정"></p>
</form>
</section>
</main>
</body>
</html>
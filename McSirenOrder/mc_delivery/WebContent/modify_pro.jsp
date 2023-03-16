<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

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
<c:set var="dto" value="${dao.selectOne_pro(param.idx) }" />
<section>
<h3>제품 수정</h3>
<form method="POST" action="modify_pro-action.jsp">
	<p><input type="number" name="idx" placeholder="idx" value="${dto.idx }" readonly></p>
	<p><input type="text" name="category" value="${dto.category }" placeholder="카테고리"></p>
	<p><input type="text" name="name" value="${dto.name }" placeholder="제품명"></p>
	<p><input type="number" name="price" value="${dto.price }" placeholder="가격"></p>
	<p><input type="text" name="imgPath" value="${dto.imgPath }" placeholder="imgPath"></p>
	<p><input type="submit" value="수정"></p>
</form>
</section>
</main>
</body>
</html>
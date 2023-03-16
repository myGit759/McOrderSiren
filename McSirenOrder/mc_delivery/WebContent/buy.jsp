<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<main>

<aside>
	<nav>
		<ul>
			<li>일반메뉴</li>
			<li><a href="">추천 메뉴</a></li>
			<li><a href="menuPage_Burger.jsp">버거</a></li>
			<li><a href="">스낵 & 사이드</a></li>
			<li><a href="">음료</a></li>
		</ul>
	</nav>
</aside>

<section>
<fieldset style="width:500px">
	<legend>장바구니</legend>
	<c:if test="${basketItems != null}">
	<div id="basketOrder" style="width:300px;">
		<div class="head">
			<div>상품이름</div>
			<div>금액</div>
		</div>
		<hr>
		<c:forEach var="item" items="${basketItems }">
		<c:set var="dto" value="${dao.selectOne_pro(item) }" /> 
		<div class="item">
			<div>${dto.name }</div><div>${dto.price }원</div>
		</div>
		</c:forEach>
		<hr>
		<div class="head">
			<div>총 금액</div><div>${basketSales }원</div>
		</div>
	</div>
</c:if>
</fieldset>
<a href="buy-action.jsp"><button>주문하기</button></a>
</section>
</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const login = ${empty login}
	
	if(login) {
		alert('로그인 한 이후 이용할 수 있습니다')
		location.href = '${cpath}/index.jsp'
	}
</script>

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
<fieldset>
	<legend>주문 완료</legend>
	
	<c:if test="${login.point < basketSales }">
		<h3>주문 실패 : 잔액 부족</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
	<c:if test="${login.point > basketSales }">
		<c:set var="dto" value="${dao.use_memPoint(login,basketSales) }" />
		<c:set var="row" value="${dao.insert_ord(login.idx, basketSales) }" />
		${dao.countUp_pro(basketItems) }
		<c:remove var="basketSales"/>
		<c:remove var="basketItems"/>
 		<c:set var="login" value="${dao.selectOne_mem(login.idx) }" scope="session"/> 
		<h3>주문이 완료되었습니다</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
</fieldset>
</section>

</main>


</body>
</html>
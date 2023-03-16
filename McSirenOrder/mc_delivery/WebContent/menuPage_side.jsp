<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<aside>
	<nav>
		<ul>
			<li>일반메뉴</li>
			<li><a href="${cpath }/menuPage_recommend.jsp">추천 메뉴</a></li>
			<li><a href="${cpath }/menuPage_Burger.jsp">버거</a></li>
			<li><a href="${cpath }/menuPage_side.jsp">스낵 & 사이드</a></li>
			<li><a href="${cpath }/menuPage_drink.jsp">음료</a></li>
		</ul>
	</nav>
	<c:if test="${basketItems != null}">
	<div id="basket">
		<table class="basket">
		<thead>
			<tr>
				<th>상품이름</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${basketItems }">
			<c:set var="dto" value="${dao.selectOne_pro(item) }" /> 
			<tr>
				<td>${dto.name }</td>
				<td>
					${dto.price }원
					<div class="close"><a href="deleteBasketList.jsp?idx=${dto.idx }">X</a></div>
				</td>
			</tr>
			</c:forEach>
			
			<tr class="price">
				<td>총 금액</td>
				<td>${basketSales }</td>
			</tr>
			<tr>
				<td colspan="2"><a href="${cpath }/buy.jsp?"><button>주문하기</button></a></td>
			</tr>
		</tbody>
	</table>
	</div>
</c:if>
</aside>

<section>
	<div id="wrap">
	<c:forEach var="pt" items="${dao.selectList_proByCat('사이드') }">
	<div class="item">
	<a class="item" href="addItem-action.jsp?idx=${pt.idx }"><button>추가하기</button></a>
	<div class="back">
		<div class="img">
			<img src="img/${pt.imgPath }" width="150">
		</div>
		<div>${pt.name }</div>
		<div>${pt.price }원</div>
	</div>
	</div>
	</c:forEach>
</div>
</section>
</main>

</body>
</html>
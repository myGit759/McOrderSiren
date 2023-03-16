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
			<li><a href="${cpath }/orderList_mem.jsp">주문내역</a></li>
			<li><a href="${cpath }/pointCharge.jsp">포인트 충전</a></li>
		</ul>
	</nav>
</c:if>
</aside>

<section>
<fieldset>
	<legend>포인트 충전</legend>
	
	<p>현재 포인트: ${login.point } 포인트</p>
	<p>　</p>
	<p>충전할 금액</p>
	<form method="POST" action="pointCharge-action.jsp">
	<input type="hidden" name="idx" value="${login.idx }">
		<p>
			<select name="point">
				<option>====금액====</option>
				<option value="5000">5,000</option>
				<option value="10000">10,000</option>
				<option value="20000">20,000</option>
				<option value="30000">30,000</option>
				<option value="40000">40,000</option>
				<option value="50000">50,000</option>
			</select>
		</p> 
		<p><input type="submit" value="충전"></p>
	</form>
	
	
</fieldset>
</section>
</main>
</body>
</html>
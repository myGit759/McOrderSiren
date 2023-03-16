<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<aside>
<c:if test="${login.id == 'admin' }">
	<nav>
		<ul class="main">
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
<p>
</p>
<table>
	<thead>
		<tr>
			<th>주문번호</th>
			<th>주문날짜</th>
			<th>회원번호</th>
			<th>금액</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="dto" items="${dao.selectList_ordForMem(login.idx) }" >
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.ord_date }</td>
			<td>${dto.mem_idx }</td>
			<td>${dto.sales }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</section>
</main>

</body>
</html>
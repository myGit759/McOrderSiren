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

<section>
<p>
	<span><a href="list_ord.jsp"><button>전체</button></a></span>
	<span><a href="date_yearly.jsp"><button>연도별</button></a></span>
	<span><a href="date_monthly.jsp"><button>월별</button></a></span>
	<span><a href="date_daily.jsp"><button>일자별</button></a></span>
	<span><a href="date_between.jsp"><button>기간별</button></a></span>
</p>
<form method="POST">
	<p>
		<input type="month" name="date">
		<input type="submit" value="조회">
	</p>
</form>
<h3>${param.date}
<c:if test="${not empty param.date}">
 월
</c:if>
</h3>

<table>
	<thead>
		<tr>
			<th>idx</th>
			<th>주문날짜</th>
			<th>회원번호</th>
			<th>금액</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="dto" items="${dao.selectList_ord_monthly(param.date) }" >
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.ord_date }</td>
			<td>${dto.mem_idx }</td>
			<td>${dto.sales }</td>
		</tr>
		</c:forEach>
		<tr class="totalSales">
			<th colspan="3">${param.date } 매출</th>
			<th>${dao.monthlySales(param.date)}</th>
		</tr>
	</tbody>
</table>
</section>
</main>

</body>
</html>
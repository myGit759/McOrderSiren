<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.update_memPoint(login,param.point) }" />

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
	
	<c:if test="${dto == 0 }">
		<h3>충전 실패</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
	<c:if test="${dto != 0 }">
 	<c:set var="login" value="${dao.selectOne_mem(param.idx) }" scope="session"/> 

		<h3>충전 완료</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
</fieldset>
</section>
</main>

</body>
</html>
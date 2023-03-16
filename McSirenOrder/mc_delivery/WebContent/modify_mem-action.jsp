<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="user" class="mc_delivery.MemberDTO" />
<jsp:setProperty property="*" name="user"/>
<c:set var="row" value="${dao.update_mem(user) }" />

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
<c:if test="${row != 0 }">
<c:set var="login" value="${dao.selectOne_mem(login.idx) }" scope="session"/> 
	<h3>수정 성공</h3>
	<a href="${login.id == 'admin' ? 'list_mem.jsp' : 'index.jsp' }"><button>돌아가기</button></a>
</c:if>
<c:if test="${row == 0 }">
	<h3>수정 실패</h3>
	<a href="${login.id == 'admin' ? 'list_mem.jsp' : 'index.jsp' }"><button>돌아가기</button></a>
</c:if>
</section>
</main>
</body>
</html>
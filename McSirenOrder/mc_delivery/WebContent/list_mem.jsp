<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mc_delivery.*"%>
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
<section class="memSec">
<table class="memTable">
	<thead>
		<tr>
			<th>idx</th>
			<th>id</th>
			<th>password</th>
			<th>name</th>
			<th>phonenum</th>
			<th>email</th>
			<th>gender</th>
			<th>point</th>
			<th>age</th>
			<th>옵션</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach var="dto" items="${dao.selectList_mem() }" >
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.id }</td>
			<td>${dto.password }</td>
			<td>${dto.name }</td>
			<td>${dto.phonenum }</td>
			<td>${dto.email }</td>
			<td>${dto.gender }</td>
			<td>${dto.point }</td>	
			<td>${dto.age }</td>
			<td><a href="${cpath }/modify_mem.jsp?idx=${dto.idx}"><button>수정</button></a></td>
			<td><a href="${cpath }/delete_mem.jsp?idx=${dto.idx}"><button>탈퇴</button></a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</section>
</main>


</body>
</html>
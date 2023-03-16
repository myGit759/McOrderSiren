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

<section class="proSec">
<p>
	<span><a href="${cpath }/list_pro.jsp"><button>제품번호순</button></a></span>
	<span><a href="${cpath }/list_proByCount.jsp"><button>누적판매량순</button></a></span>
</p>
<table class="proTable"> 
	<thead>
		<tr>
			<th>idx</th>
			<th>category</th>
			<th>name</th>
			<th>price</th>
			<th>imgPath</th>
			<th>이미지</th>
			<th>누적 판매량</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${dao.selectList_pro() }">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.category }</td>
			<td>${dto.name }</td>
			<td>${dto.price }</td>
			<td>${dto.imgPath }</td>
			<td><img src="img/${dto.imgPath }" width="100"></td>
			<td>${dto.count }</td>
			<td><a href="${cpath }/modify_pro.jsp?idx=${dto.idx}"><button>수정</button></a></td>
			<td><a href="${cpath }/delete_pro.jsp?idx=${dto.idx}"><button>삭제</button></a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</section>
</main>

</body>
</html>
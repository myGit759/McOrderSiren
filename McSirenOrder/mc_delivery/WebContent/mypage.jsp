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
<table>
	<tr>
		<td>id</td>
		<td>${login.id}</td>
	</tr>
	<tr>
		<td>pw</td>
		<td>${login.password}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${login.name }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${login.phonenum }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${login.email }
	</tr>
	<tr>
		<td>성별</td>
		<td>${login.gender }
	</tr>
	<tr>
		<td>포인트</td>
		<td>${login.point }
	</tr>	
	<tr>
		<td>나이</td>
		<td>${login.age }</td>
	</tr>
</table>

<p>
	<a href="${cpath }/modify_mem.jsp?idx=${login.idx}"><button>수정</button></a>
	<a href="${cpath }/delete_mem.jsp?idx=${login.idx}"><button>탈퇴</button></a>
</p>
</section>

</main>

</body>
</html>








</body>
</html>
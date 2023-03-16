<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="dto" value="${dao.selectOne_memByEmail(param.email) }" />
<section>
<fieldset>
	<legend>아이디 찾기</legend>
	
	<c:if test="${dto == null }">
		<h3>등록된 정보가 없습니다</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
	<c:if test="${dto != null }">
		<h3>아이디는 ${dto.id } 입니다</h3>
		<a href="${cpath }"><button>홈으로</button></a>
	</c:if>
	
</fieldset>
	
</section>
</body>
</html>
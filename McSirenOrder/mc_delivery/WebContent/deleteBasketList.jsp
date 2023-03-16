<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	String del = (String)request.getParameter("idx");
	int delI = Integer.parseInt(del);
	McDAO dao = McDAO.getInstance();
	ArrayList<String> basketItems = (ArrayList<String>)session.getAttribute("basketItems");
	int basketSales = (int)session.getAttribute("basketSales");
	for(int i = 0; i < basketItems.size(); i++){
		String s = basketItems.get(i);
		if(del.equals(s)){
			int idx = basketItems.indexOf(s);
			basketItems.remove(idx);
			break;
		}
	}
	if(basketItems == null){
		session.removeAttribute("basketItems");
		session.removeAttribute("basketSales");
	}else{
		ProductDTO dto = dao.selectOne_pro(delI);
		session.setAttribute("basketItems", basketItems);
		basketSales -= dto.getPrice();
		session.setAttribute("basketSales", basketSales);
		response.sendRedirect("menuPage.jsp");
	}
%>


</body>
</html>
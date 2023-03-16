<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<%	
	String add = (String)request.getParameter("idx");
	int i = Integer.parseInt(add);
	McDAO dao = McDAO.getInstance();
	
	ArrayList<String> basketItems = (ArrayList<String>)session.getAttribute("basketItems");
	if(basketItems == null) {
		basketItems = new ArrayList<String>();
		basketItems.add(add);
		session.setAttribute("basketItems", basketItems);
		
		ProductDTO dto = dao.selectOne_pro(i);
		int basketSales = dto.getPrice();
		session.setAttribute("basketSales", basketSales);
		
	}else{
		basketItems.add(add);
		session.setAttribute("basketItems", basketItems);
		
		ProductDTO dto = dao.selectOne_pro(i);
		int basketSales = (int)session.getAttribute("basketSales");
		basketSales += dto.getPrice();
		session.setAttribute("basketSales", basketSales);
	}
	response.sendRedirect("menuPage.jsp");
%>
</body>
</html>
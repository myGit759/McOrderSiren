<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mc_delivery.*, java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${McDAO.getInstance() }" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>맥도리아 사이렌 오다</title>

<style>
section div#wrap {
	width: 900px;
	display: flex;
	flex-flow: wrap;
}

section div.item {
	width: 200px;
	margin: 10px;
	padding: 10px;
	border: 1px solid #dadada;
	text-align: center;
}

section div.item a.item {
	visibility: hidden;
}

section div.item:hover {
	background-color: white;
}

section div.item:hover div.back {
	opacity: 0.2
}

section div.item:hover a.item {
	visibility: visible;
	position: relative;
	top: 44%;
	z-index: 2;
}

section div.item:hover a.item button {
	background-color: #d60405;
	color: #ffc423;
	font-weight: bold;
	border: 1px solid #d60405;
}

section div.item:hover a.item button:hover {
	cursor: pointer;
}

body {
	flex-wrap: wrap;
	width: 1000px;
	margin: auto;
}

header {
	display: flex;
	justify-content: center;
	padding: auto;
	margin: auto;
}

div.header {
	display: flex;
	justify-content: center;
	box-shadow: 10px 10px 10px #dadada;
	border-radius: 10px;
	width: 100%;
}

div.logo {
	display: flex;
	width: 25%;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
	justify-content: center;
	background-color: white;
}

div.headMenu {
	display: flex;
	width: 75%;
	align-items: center;
	justify-content: center;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	background-color: #616161;
}

div.headMenu li {
	display: flex;
	width: 33%;
	height: 100%;
	align-items: center;
	justify-content: center;
	color: white;
	box-sizing: border-box;
}

div.headMenu li:nth-child(1) {
	border-right: 1px solid #858585;
}

div.headMenu li:nth-child(2) {
	border-right: 1px solid #858585;
	border-left: 1px solid #343434;
}

div.headMenu li:nth-child(3) {
	border-left: 1px solid #343434;
}

div.headMenu ul {
	width: 100%;
	display: flex;
	list-style: none;
	height: 100%;
	align-items: center;
}

div.header a {
	text-decoration: none;
	color: white;
}

div.header li:hover {
	cursor: pointer;
}

div.header li:hover a {
	color: #dadada;
}

div.login {
	width: 300px;
	height: 500px;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background-color: white;
	box-shadow: 0 8px 32px 0 black;
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 300px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
}

div.top {
	margin: 10px 0;
	text-align: right;
}

p.fst {
	visibility: hidden;
}

p.loginError {
	visibility: visible;
	color: red;
}

span.find a {
	text-decoration: none;
	color: black;
}

div.header  div.headMenu  ul  ul {
	all: unset;
	margin-top: 10px;
	margin-left: -1px;
	display: none;
	position: absolute;
}

div.header  div.headMenu  ul li:hover  ul {
	display: block;
	background-color: #616161;
	margin-top: 110px;
	margin-left: 5px;
}

div.header  div.headMenu  ul li:hover  li {
	width: 240px;
}

div.header  div.headMenu  ul li li:hover {
	cursor: pointer;
	background-color: #f5f5f5;
}

div.header  div.headMenu  ul li li:hover  a {
	color: #616161;
}

button.login {
	display: none;
}

span.login {
	display: none;
}

main {
	width: 1500px;
	display: flex;
	margin: 20px auto;
}

aside {
	width: 13%;
	border-right: 1px solid brown;
}

section {
	margin-left: 10px;
	width: 50%;
}
section.memSec {
	margin-left: 10px;
	width: 80%;
}
section.proSec {
	margin-left: 10px;
	width: 80%;
}

aside nav {
	text-align: center;
	background-color: #ffc423;
}

aside nav ul > li:nth-child(1) {
	display: inline-block;
	padding: 10px;
	text-decoration: none;
	color: black;
	border-bottom: 1px black double;
}

aside nav a {
	display: inline-block;
	padding: 10px;
	text-decoration: none;
	color: #a25716;
}

table {
	border-collapse: collapse;
	text-align: center;
	border-right: 0;
}

thead {
	background-color: #ffc422;
}

th, td {
	padding: 5px 10px;
	border: 1px solid black;
}

section.join span.duple {
	visibility: visible;
	color: red;
}

section.join span.fst {
	visibility: hidden;
}

section.service {
	width: 1000px;
}

div.page-service {
	background-color: white;
	padding: 5px 20px;
	border: 1px solid black;
}

table tbody>tr:hover {
	background-color: #f5f6f7;
	cursor: pointer;
	background-color: #dadada;
}

table.memTable thead>tr>th:nth-child(10), table.memTable thead>tr>th:nth-child(11)
	{
	display: none;
}

table.memTable tbody>tr>td:nth-child(10), table.memTable tbody>tr>td:nth-child(11)
	{
	visibility: hidden;
	border: none;
	background-color: #f3f3f3;
}

table.memTable tbody>tr:hover>td:nth-child(10), table.memTable tbody>tr:hover>td:nth-child(11)
	{
	padding: 0;
	vertical-align: middle;
	border: none;
	visibility: visible;
	background-color: #f3f3f3;
}

table.proTable thead>tr>th:nth-child(8) {
	display: none;
}

table.proTable tbody>tr>td:nth-child(8), table.proTable tbody>tr>td:nth-child(9)
	{
	visibility: hidden;
	border: none;
	background-color: #f3f3f3;
}

table.proTable tbody>tr:hover>td:nth-child(8), table.proTable tbody>tr:hover>td:nth-child(9)
	{
	padding: 0;
	vertical-align: middle;
	border: none;
	visibility: visible;
	background-color: #f3f3f3;
}

div#basket {
	position: sticky;
	top: 20px;
	left: 200px;
	width: 93%;
	border: 5px solid #ffc423;
}

div.content>div.login p {
	color: black;
}

div#basket table.basket {
	border: 2px solid red;
	position: relative;
	font-size: 12px;
}

div#basket table.basket tr.price {
	border-top: 2px solid black;
	background-color: #dadada;
}

div#basketOrder  div.item {
	all: unset;
	display: flex;
	justify-content: space-between;
}

div#basketOrder  div.head {
	all: unset;
	display: flex;
	justify-content: space-around;
	font-weight: bold;
}
div#basket tbody tr td{
	position: relative;
}
div#basket tbody tr div.close {
	position: absolute;
	top: 0;
	right: 0;
	visibility: hidden;
}
div#basket tbody tr div.close a{
	font-weight: bold;
	color:red;
	text-decoration: none;
	padding:auto;
	margin: auto;
	vertical-align: middle;
}

div#basket tbody tr:hover div.close {
	display: flex;
	visibility: visible;
	position: absolute;
	top: 0;
	right: 0;
	background-color: #ffc423;
	width: 25px;
	height: 25px;
	justify-content: center;
	align-items: center;
}

</style>
</head>
<body style="background-color: #f3f3f3">
	<div class="top">
		<button id="btn-modal" class="${empty login ? 'logout' : 'login'}">로그인</button>
		<span class="${empty login ? 'login' : 'logout'}">
			${login.name }님 반갑습니다!
		</span>
		<span><a
			style="text-decoration: none;"
			href="${cpath }/logout.jsp">
			<button class="${empty login ? 'login' : 'logout'}">로그아웃</button>
		</a></span>
	</div>
	<header>
<div class="header">
	<div class="logo">
		<a href="${cpath }"><img src="${cpath }/img/logo.png" height="50px"></a>
	</div>
	<div class="headMenu">
		<ul>
			<li onClick="location.href='${cpath }/menuPage.jsp'"><a href="${cpath }/menuPage.jsp">메뉴</a></li>
			<li onClick="location.href='${cpath }/mypage.jsp'"><a href="${cpath }/mypage.jsp">마이페이지</a></li>
			<li>기타정보
				 <ul>
				 	<li><a href="${cpath }/service.jsp">이용약관</a></li>
				 	<li><a href="${cpath }/privacy.jsp">개인정보 처리방침</a></li>
				 	<li><a href="http://www.mcdonalds.co.kr/uploadFolder/page/p_menu.jsp?staticLinkId=17&locale=ko">영양정보/원산지 정보</a></li>
				 </ul>
			</li>
		</ul>
	</div>
</div>
</header>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="close-area">X</div>
			<div class="content">
				<div class="login">
					<form method="POST" action="login-action.jsp">
						<p>아이디</p>
						<p>
							<input type="text" name="id" required>
						</p>
						<p>비밀번호</p>
						<p>
							<input type="password" name="password" required>
						</p>
						
						<span>
							<input type="submit" value="로그인">
						</span>
					</form>
					<a href="join.jsp"><button>회원가입</button></a>
					<div style="text-align: center;">
						<span class="find">
							<a href="findId.jsp">아이디 찾기</a>
						</span>
						<span>　　</span>
						<span class="find">
							<a href="findPassword.jsp">비밀번호 찾기</a>
						</span>
						<hr>
					</div>
					
					<div>
						<a href="회원가입"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>

	const modal = document.getElementById("modal")
	function modalOn() {
	    modal.style.display = "flex"
	}
	function isModalOn() {
	    return modal.style.display === "flex"
	}
	function modalOff() {
	    modal.style.display = "none"
	}
	const btnModal = document.getElementById("btn-modal")
	btnModal.addEventListener("click", e => {
	    modalOn()
	})
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modalOff()
	})
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modalOff()
	    }
	})
	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	})
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="common/test.css" rel="stylesheet"> 
<title>회원</title>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원 관리 ver1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			<li><a href="<%=rPath%>/member-list.jsp">회원목록 조회/수정</a></li>
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
			<li><a href="<%=rPath%>/">홈으로</a></li>
		</ul>
	</nav>
	
	<section>
		<h3>쇼핑몰 회원관리 프로그램</h3>
	</section>
		
	<footer> 저작권 대충~ </footer>
</body>

<script>

jQuery(function($) {
	$("body").css("display", "none");
	$("body").fadeIn(2000);
	$("a.transition").click(function(event) {
		event.preventDefault();
		linkLocation = this.href;
		$("body").fadeOut(1000, redirectPage);
	});
	function redirectPage() {
		window.location = linkLocation;
	}
});
</script>
</html>
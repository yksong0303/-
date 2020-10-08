<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBPKG.Connector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 조회/수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="common/test.css" rel="stylesheet">
</head>
<body>
	<header> 쇼핑몰 회원관리 ver 1.0 </header>
	<nav>
		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			<li><a href="<%=rPath%>/member-list.jsp">회원등록조회/수정</a></li>
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
			<li><a href="<%=rPath%>/">홈으로</a></li>
		</ul>
	</nav>
	<section id="h2">
		<%
			Connection con = Connector.getConnection();
		String sql = "select met.custname,met.GRADE,mot.CUSTNO,sum(mot.price) as price from  money_tbl_02 mot ,member_tbl_02 met WHERE mot.custno=met.CUSTNO group by mot.custno,met.CUSTNAME,met.GRADE order by price DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		%>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원명</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("custno")%></td>
				<td><%=rs.getString("custname")%></td>
				<td><%=rs.getString("grade")%></td>
				<td><%=rs.getString("price")%></td>
			</tr>
			<br>

			<%
				}
			%>
		</table>

	</section>
	<footer> copylight by umjoonsik </footer>
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
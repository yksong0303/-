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
<title>회원 목록 조회/수정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="common/test.css" rel="stylesheet">
</head>
<body>
	<header>
		<h1>쇼핑몰 회원 관리 ver1.0</h1>
	</header>

		<ul>
			<li><a href="<%=rPath%>/member-insert.jsp">회원등록</a></li>
			<li><a href="<%=rPath%>/member-list.jsp">회원목록 조회/수정</a></li>
			<li><a href="<%=rPath%>/member-sales.jsp">회원매출조회</a></li>
			<li><a href="<%=rPath%>/">홈으로</a></li>
		</ul>
	

	<section>
		<h3>회원 목록 조회/수정</h3>
		<%
			Connection con = Connector.getConnection();//sql접속

		String sql = "select custno, custname,phone,address,to_char(joindate,'YYYY-MM-DD') as JOINDATE,"
				+ " decode(grade, 'A','VIP','B','일반','C','직원') as GRADE" + " ,city from member_tbl_02 order by custno ";
		PreparedStatement ps = con.prepareStatement(sql);//쿼리 작성
		ResultSet rs = ps.executeQuery();//준비 및 실행
		%>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>전화번호</td>
				<td>지역</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>도시코드</td>
		
			</tr>
			<%
				while (rs.next()) { //null이 나올때까지 while문 돌림
			%>
			<tr>
				<th><%=rs.getInt("custno")%></th>
				<th><%=rs.getString("custname")%></th>
				<th><%=rs.getString("phone")%></th>
				<th><%=rs.getString("address")%></th>
				<th><%=rs.getString("joindate")%></th>
				<th><%=rs.getString("grade")%></th>
				<th><%=rs.getString("city")%></th>
				
			</tr>
			
			<%
				}
			%>
		</table>
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
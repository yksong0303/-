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
<title>홈쇼핑 회원정보수정</title>
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
			request.setCharacterEncoding("utf-8");
		if (request.getParameter("custname") != null) {
			String custno = request.getParameter("custno");
			String custname = request.getParameter("custname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String joindate = request.getParameter("joindate");
			String grade = request.getParameter("grade");
			String city = request.getParameter("city");
			String sql = "update member_tbl_02\r\n" + 
					"set custname=?,\r\n" + 
					"phone=?,\r\n" + 
					"address=?,\r\n" + 
					"joindate=?,\r\n" + 
					"grade=?,\r\n" + 
					"city=?\r\n" + 
					"where custno=?";
			Connection con = Connector.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, custname);
			ps.setString(2, phone);
			ps.setString(3, address);
			ps.setString(4, joindate);
			ps.setString(5, grade);
			ps.setString(6, city);
			ps.setString(7, custno);
			int result = ps.executeUpdate();
			if (result == 1) {
				out.write("<script>");
				out.write("alert('회원 수정이 완료 되었습니다!')");
				out.write("</script>");
			}
		}
		%>
		<%
			Connection con = Connector.getConnection();
		String sql = "select custno,custname,phone,address,";
		sql += "to_char(joindate,'YYYY-MM-DD') as joindate,";
		sql += " grade,";
		sql += " city from member_tbl_02 where custno=?";

		PreparedStatement ps = con.prepareStatement(sql);
		String custno = request.getParameter("custno");
		ps.setString(1, custno);
		ResultSet rs = ps.executeQuery();
		String custname="";
		String phone="";
		String address="";
		String joindate="";
		String grade="";
		String city="";
		if (rs.next()) {
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getString("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
		}
		%>


		<form method="post">
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno"
						value="<%=request.getParameter("seq_custno.nextval")%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" id="custname" value="<%=rs.getString("custname")%>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" id=""  value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" id=""  value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" id=""  value="<%=rs.getString("joindate")%>"></td>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<td><input type="text" name="grade" id=""  value="<%=rs.getString("grade")%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" id=""  value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<th colspan="2"><button>수정</button> <a
						href="<%=rPath%>/list.jsp"><button>조회</button></a></th>
				</tr>
			</table>
		</form>

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
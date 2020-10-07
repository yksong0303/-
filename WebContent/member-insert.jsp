<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.Connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
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
	<h3>홈쇼핑 회원 등록</h3>
<%
request.setCharacterEncoding("utf-8");
if(request.getParameter("custname")!=null){
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	String sql = "insert into member_tbl_02 (custno, custname, phone, address, joindate, grade, city)\r\n" + 
			" VALUES(seq_custno.nextval,?,?,?,?,?,?)";
	Connection con = Connector.getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, custname);
	ps.setString(2, phone);
	ps.setString(3, address);
	ps.setString(4, joindate);
	ps.setString(5, grade);
	ps.setString(6, city);
	int result = ps.executeUpdate();
	if(result==1){
		out.write("<script>");
		out.write("alert('회원 등록이 완료 되었습니다!')");
		out.write("</script>"); 
	}
}

%>	
	<form method="post">
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<td><input type="text" name="custno" value="<%=request.getParameter("seq_custno.nextval")%>"></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" id="custname" required oninvalid="this.setCustomValidity('이름좀 알려주셈')"></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone" id="" required></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" id="" required></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" id="" required></td>
			</tr>
			<tr>
				<th>고객등급(A:VIP,B:일반,C:직원)</th>
				<td><input type="text" name="grade" id="" required></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" id="" required></td>
			</tr>
			<tr>
				<th colspan="2"><button>등록</button>
				<button>조회</button></th>
			</tr>
		</table>
	</form>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<style>
body {
	background-color: whitesmoke;
	margin: 0;
	padding: 0;
}

header {
	background-color: #2E2E2E;
	color: white;
	padding: 20px;
	text-align: center;
}

h2 {
	margin: 0;
	color: #F7FE2E;
}

nav {
	background-color: #424242;
	text-align: center;
	padding: 10px;
}

nav a {
	text-decoration: none;
	color: white;
	margin: 0 10px;
}

section {
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	border-radius: 10px;
	width: 80%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

caption {
	font-size: 18px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #424242;
	color: white;
}

td {
	background-color: #f9f9f9;
}

td a {
	text-decoration-line: none;
	color: black;
}

footer {
	background-color: #424242;
	color: white;
	text-align: center;
	padding: 20px;
	position: fixed;
	bottom: 0;
	width: 100%;
}

footer div{
widht:20px;
display:flex;
}
</style>
</head>
<body>

	<header>
		<h2>GUNfitness</h2>
	</header>

	<nav>
		<span> <a href="회원등록.jsp"> 새 회원 등록 </a>
		</span> <span> <a href="https://www.instagram.com/1226lgh69/"
			target="_blank"> 사장님인스타 </a>
		</span>
	</nav>

	<section>

		<table>
			<caption>회원조회</caption>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
				<td>번호</td>
				<td>수정 / 삭제</td>
			</tr>

			<%
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:testdb";
			String user = "scott";
			String password = "tiger";

			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url, user, password);

				String sql = "select * from  mTbl order by 1";
				PreparedStatement pst = con.prepareStatement(sql);

				ResultSet rs = pst.executeQuery();

				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="updateForm.jsp?mId=<%=rs.getString(1)%>">수정</a> /
					<a href="deleteAction.jsp?mId=<%=rs.getString(1)%>">삭제</a></td>
			</tr>

			<%
			}

			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>
		</table>

	</section>

	<footer>
		<div> GUNfitness </div>
		<div> © 2024 GUNfitness </div>
		<div> (주)건피트니스 | 대표 이건희 </div>
	</footer>
</body>
</html>






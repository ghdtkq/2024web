<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="java.sql.*" %>	
	
<%

 String mId  = request.getParameter("mId");

 String driver = "oracle.jdbc.driver.OracleDriver";
 String url = "jdbc:oracle:thin:@localhost:1521:testdb";
 String user = "scott";
 String password = "tiger";	
 
 
 String  mName ="";
 String  mGender="";
 String  mAge ="";
 String  mTel="";
	
			
	try {
		//1. 드라이버 로드 (객체생성)
		Class.forName(driver);			
		//2. 데이터베이스 연결
		Connection  con = DriverManager.getConnection(url, user, password);
		
		//3. 문장얻어오기 
	 
		String sql  ="select * from  mtbl where mId  =?";
		PreparedStatement  pst =con.prepareStatement(sql);
		pst.setString(1, mId);	 //왼쪽 물음표부터 	 
		
		//5.실행 ( executeQuery()-조회,  executeUpdate()- 나머지 등록, 변경, 삭제)
		ResultSet  rs =pst.executeQuery();	
		
		//
		if( rs.next()) {	
			 
			mName  = rs.getString(2);
			mGender = rs.getString(3);
			mAge  = rs.getString(4);
			mTel = rs.getString(5);
		} 			
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

%>	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>

<style>
body {
	background-color: whitesmoke;
	margin: 0;
	padding: 0;
}
 
.wrap {
	width: 500px;
	margin: 30px auto;
	background-color: white;
	border: 1px solid whitesmoke;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	text-align: center;
}
 
.line {
	margin-bottom: 10px;
	text-align: center;
	width: 100%;
}
.line1, .line5 {
	text-align: center;
}

input[type="text"] {
	width: 80%;
	padding: 10px;
	border: 1px solid silver;
	font-size: 15px;
}

 button {
	width: 70px;
	height: 40px;
	background-color: #333;
	color: white;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

button:hover {
	background-color: #555;
}
  
</style>
</head>
<body>

<form  name="frm" action="updateAction.jsp"  method="post">
	<div  class="wrap">
		 <div class="line1">
			   <h2> 학생정보 조회 </h2>
		</div>
	
		<div class="line">
			<div class="col1">아이디</div>
			<div class="col2"><input type="text"  name="mId" value=""  readonly="readonly"></div>	
		</div>
		
	
		<div class="line">
			<div class="col1">이름</div>
			<div class="col2"><input type="text" name="mName" value=""></div>	
		</div>
		
	    <div class="line">
			<div class="col1">성별</div>
			<div class="col2"><input type="text" name="mGender"  value="" readonly="readonly" ></div>	
		</div>	
		
		<div class="line">
			<div class="col1">나이</div>
			<div class="col2"><input type="text" name="mAge" value=""></div>	
		</div>
		
	    <div class="line">
			<div class="col1">전화번호</div>
			<div class="col2"><input type="text" name="mTel"  value=""></div>	
		</div>	
		
		<div class="line5">
		<!--  form 안에 있는 버튼은 submit 지정,(action에 지정된 페이지로 이동함) -->	
		 <button>변경</button>		 
		</div>
	</div>
</form>

</body>
</html>




<script>

	 let frm = document.frm;
	 
	 frm.mId.value="<%=mId%>";
	 frm.mName.value="<%=mName%>";
	 frm.mGender.value="<%=mGender%>";	 
	 frm.mAge.value="<%=mAge%>";
	 frm.mTel.value="<%=mTel%>";	
	 
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.sql.*" %>	
 
    


<%


request.setCharacterEncoding("utf-8");

String mId =  request.getParameter("mId");;
String mName =  request.getParameter("mName");
String mGender  = request.getParameter("mGender");
String mAge =  request.getParameter("mAge");
String mTel  = request.getParameter("mTel");

out.println( mId);
out.println( mName);
out.println(mGender);
out.println( mAge);
out.println(mTel);


String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:testdb";
String user = "scott";
String password = "tiger";	

		
try {
	 
	Class.forName(driver);		 
	Connection  con = DriverManager.getConnection(url, user, password);	
	 
	 
	String sql  =" update mtbl 	set  mName=?, mAge=?, mTel=?  where mId= ?";
	PreparedStatement  pst =con.prepareStatement(sql);
	pst.setString(1, mName);
	pst.setString(2, mAge);	
	pst.setString(3, mTel);
	pst.setString(4, mId);	
    int cnt  =pst.executeUpdate();  // 등록, 변경, 삭제	
	 		
	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


response.sendRedirect("memberList.jsp");
%>

    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  변경완료 !!
</body>
</html>
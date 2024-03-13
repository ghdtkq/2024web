<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@  page import="java.sql.*" %>
    


<%

 String mId  =request.getParameter("mId");
 out.println(mId);
 
 	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "scott";
	String password = "tiger";	
	
			
	try {
		 
		Class.forName(driver);		 
		Connection  con = DriverManager.getConnection(url, user, password);
	 
		String sql  =" delete from mtbl where mId  =?";
		PreparedStatement  pst =con.prepareStatement(sql);
		pst.setString(1, mId);	 //왼쪽 물음표부터 		
		 
		int cnt= pst.executeUpdate()	;		 			

	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	// 재요청 
	response.sendRedirect("memberList.jsp");
	//응답코드(출력)는 무시된다. 응답되지 않는다 .
%>    




    
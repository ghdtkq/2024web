<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.sql.*" %> 
 
 <%
   
 //request 넘어온 값이 한글인경우 
 //
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
 
 
 	Connection con=null;
 	PreparedStatement pst = null; 
	try{ 
		//데이터베이스 연결정보
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		String url="jdbc:oracle:thin:@localhost:1521:testdb";
		String user="scott";
		String password="tiger";
		
		 
		Class.forName(driver); 		 
		con= DriverManager.getConnection(url, user, password);		 
		if( con == null) {  System.out.println(" 연결실패");} 
		 
		String sql ="insert  into mtbl values (?,?,?,?,?)";  
		pst = con.prepareStatement(sql);
		
		pst.setString(1, mId);
		pst.setString(2, mName);
		pst.setString(3, mGender);	
		pst.setString(4, mAge);
		pst.setString(5, mTel);	
		
		int cnt  =pst.executeUpdate();
		System.out.println( cnt + "개수만큼 등록되었습니다");
		 
		 
	}catch(Exception e){
		e.printStackTrace();
	}
	finally{ //자원의 반납		 
		if( pst != null) pst.close();
		if( con != null) con.close();
	}
   
    out.println( "등록되었습니다");
    
     response.sendRedirect("memberList.jsp");
 %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets session, userID, name, role, level, email, and password
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("ID");
String username = request.getParameter("name");
String role = request.getParameter("role");
String level = request.getParameter("level");
String email = request.getParameter("email");
String password = request.getParameter("psw");

  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
//gets database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

	//updates user information based on above parameters
	String sql = "Update users set userName=?, userEmail=?, informationType=?, userPassword = ?, userRole=? where userID = +"+id;
	PreparedStatement ps =conn.prepareStatement(sql);
	ps.setString(1,username);
	ps.setString(2,email);
	ps.setString(3, level);
	ps.setString(4, password);
	ps.setString(5, role);
	int i = ps.executeUpdate();
	response.sendRedirect("../index.html");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>

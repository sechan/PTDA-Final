<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets email and password
String email = request.getParameter("email");
String password = request.getParameter("psw");

  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//gets database credentials
String url="jdbc:mysql://127.0.0.1:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

//gets all user information if login credentials match
String sql = "SELECT * FROM users WHERE userEmail = ? AND userPassword = ?";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, email);
ps.setString(2, password);

ResultSet rs = ps.executeQuery();

//if there are no matches incorrect credentials
if(!rs.next())
{
	out.println("Incorrect username or password");
}
//else set session information and redirect to home page
else
{
	out.println("Successful login");
	 sess.setAttribute("ID", rs.getString("userID"));
	 sess.setAttribute("type", rs.getString("userRole"));
	 response.sendRedirect("../index.html");
}
  } catch(Exception e) {
    out.println(e.getMessage());
  }
%>

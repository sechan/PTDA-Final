<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets username, age, role, level, diagnostic information, email, password, and escapes all apostrophes
String username = request.getParameter("name");
String age = request.getParameter("age");
String role = request.getParameter("role");
String level = request.getParameter("level");
String diagnostic = request.getParameter("diagnostic");
String email = request.getParameter("email");
String password = request.getParameter("psw");
username = username.replace("'", "\\'");
diagnostic = diagnostic.replace("'", "\\'");
email = email.replace("'", "\\'");
password = password.replace("'", "\\'");

  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//gets database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

Statement st=conn.createStatement();
	//inserts information into users table and redirects to homepage
	int i=st.executeUpdate("insert into users(userName, userPassword, userEmail, informationType, diagnosisType, stageType, userRole)values('"+username+"','"+password+"','"+email+"','"+level+"','"+diagnostic+"','"+diagnostic+"','"+role+"')");
	response.sendRedirect("../index.html");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>

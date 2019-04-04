<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>


<%
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("ID");
try {
	String responses = request.getParameter("responseField");
	String vals = request.getParameter("valueField");

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);


String sql = "INSERT INTO summaries(results, Users_userID, questionValues, status) values ('"+responses+"','"+id+"','"+vals+"', 'complete')";

Statement st = conn.createStatement();

int i = st.executeUpdate(sql);

response.sendRedirect("summary.jsp");

  } catch(Exception e) {
    out.println(e.getMessage());
  }

%>
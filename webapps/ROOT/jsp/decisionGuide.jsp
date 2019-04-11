<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>


<%
//gets session and user ID
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("ID");
try {
	//gets responses and question values and IDs
	String responses = request.getParameter("responseField");
	String vals = request.getParameter("valueField");
	String ids = request.getParameter("idField");

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//gets database credentails
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

//inserts the information from the decision guide into the decision guide table
String sql = "INSERT INTO summaries(results, Users_userID, questionValues, questionID, status) values ('"+responses+"','"+id+"','"+vals+"', '"+ids+"', 'complete')";

Statement st = conn.createStatement();

int i = st.executeUpdate(sql);

//redirects to summary page
response.sendRedirect("summary.jsp");

  } catch(Exception e) {
    out.println(e.getMessage());
  }

%>

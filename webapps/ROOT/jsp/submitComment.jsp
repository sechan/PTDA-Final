<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
HttpSession sess = request.getSession();
String currentUser = (String)sess.getAttribute("ID");
String inputText = request.getParameter("commentText");
String postID = request.getParameter("postID");
String posterID = request.getParameter("posterID");
inputText = inputText.replace("'", "\\'");
out.println(inputText);
  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

Statement st=conn.createStatement();

	int i=st.executeUpdate("insert into comments(commenterID, commentContent, postID, posterID, timeStamp)values('"+currentUser+"','"+inputText+"','"+postID+"','"+posterID+"',CURRENT_DATE)");
	
	response.sendRedirect("forumPosts.jsp");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>
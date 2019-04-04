<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
HttpSession sess = request.getSession();
String currentUser = (String)sess.getAttribute("ID");
String inputText = request.getParameter("inputText");
inputText = inputText.replace("'", "\\'");
String title = request.getParameter("postTitle");
title = title.replace("'", "\\'");
  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

Statement st=conn.createStatement();

	int i=st.executeUpdate("insert into posts(posterID, postContent, Title, timeStamp)values('"+currentUser+"','"+inputText+"','"+title+"',CURRENT_DATE)");
	
	response.sendRedirect("forumPosts.jsp");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets session, userID, title, and post text, escapes any apostrophes to prevent error
HttpSession sess = request.getSession();
String currentUser = (String)sess.getAttribute("ID");
String inputText = request.getParameter("inputText");
inputText = inputText.replace("'", "\\'");
String title = request.getParameter("postTitle");
title = title.replace("'", "\\'");
  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//gets database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

Statement st=conn.createStatement();
	//inserts information into posts table
	int i=st.executeUpdate("insert into posts(posterID, postContent, Title, timeStamp)values('"+currentUser+"','"+inputText+"','"+title+"',CURRENT_DATE)");
	//redirect to forums page
	response.sendRedirect("forumPosts.jsp");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>

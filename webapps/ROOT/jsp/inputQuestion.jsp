<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets question text, treatment type, question value, and escapes any apostrophes
String inputText = request.getParameter("newQuestion");
String questionType = request.getParameter("treatment");
inputText = inputText.replace("'", "\\'");
int value = Integer.parseInt(request.getParameter("value"));

  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//gets database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

Statement st=conn.createStatement();
	//inserts information into questions table
	int i=st.executeUpdate("insert into questions(questionText, suggestedTreatment, value)values('"+inputText+"','"+questionType+"','"+value+"')");
	
	//redirects to home page
	response.sendRedirect("../index.html");
  }
  catch(Exception e) {
    out.println(e.getMessage());
  }
%>

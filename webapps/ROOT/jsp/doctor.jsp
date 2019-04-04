<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%

HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("ID");
String userType = (String)sess.getAttribute("type");

if(!userType.equals("doctor"))
{
	out.println("you are not a doctor!");
}

else
{
	response.sendRedirect("../html/doctor.html");
}

%>
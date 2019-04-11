<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//gets session, user type
HttpSession sess = request.getSession();
String userType = (String)sess.getAttribute("type");

if(!userType.equals("doctor"))
{
	out.println("you are not a doctor!");
}
//if user type is doctor allow them to see the doctor portal
else
{
	response.sendRedirect("../html/doctor.html");
}

%>

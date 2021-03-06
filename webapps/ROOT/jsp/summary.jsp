<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Summary</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="manifest" href="../site.webmanifest">
    <link rel="apple-touch-icon" href="../icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

    <script type="text/javascript" src="https://cdn.emailjs.com/sdk/2.3.2/email.min.js"></script>
    <script type="text/javascript">
      (function(){
        emailjs.init("user_LlpLsb43ejpGbDfbPEpdL");
      })();
    </script>

</head>
<body>

<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Add your site or application content here -->
<script src="../js/vendor/modernizr-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
<script src="../js/plugins.js"></script>
<script src="../js/textHandler.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>


<!-- Basic Navigation -->
    <div class="container">
    <nav class="navbar">
    <a href="../index.html" class="w3-button w3-bar-item">Home</a>
    <a href="decision.jsp" class="w3-button w3-bar-item">Decision Guide</a>
    <a href="summary.jsp" class="w3-button w3-bar-item">Summary</a>
    <a href="forumPosts.jsp" class="w3-button w3-bar-item">Forums</a>
    <a href="doctor.jsp" class="w3-button w3-bar-item">Doctor Portal</a>
    <div class="dropdown">
    <button class="dropbtn w3-bar-item">More</button>
    <div class="dropdown-content">
    <a href="../html/register.html" class="w3-button w3-bar-item">Sign Up</a>
    <a href="../html/login.html" class="w3-button w3-bar-item">Sign In</a>
    <a href="../html/contact.html" class="w3-button w3-bar-item">Contact</a>
    </div>
    </div>
    </nav>
    </div>
  <%
  //gets session and userID
HttpSession sess = request.getSession();
String userID = (String)sess.getAttribute("ID");

  try {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//get database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

//get summary information from the specified user
String sql = "SELECT * FROM summaries WHERE Users_userID = ?";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, userID);

ResultSet rs = ps.executeQuery();

out.println("<div class='postContent'><div id = 'content'>");
while(rs.next())
{
//pares the information from the database
	String num = rs.getString("summaryID");
	String results = rs.getString("results");
	results = results.replace("[", "");
	results = results.replace("]", "");
	results = results.replace("\"", "");
	
	String values = rs.getString("questionValues");
	values = values.replace("[", "");
	values = values.replace("]", "");
	values = values.replace("\"", "");
	
	String ids = rs.getString("questionID");
	ids = ids.replace("[", "");
	ids = ids.replace("]", "");
	ids = ids.replace("\"", "");

	
	int sum = 0;
	String data [] = results.split(",");
	String questionVals [] = values.split(",");
	String questionIDs [] = ids.split(",");
	for(int i = 0; i < data.length; i++)
	{
		// get the current question
		String query = "SELECT questionText FROM questions WHERE questionID = ?";
		PreparedStatement ps2 = conn.prepareStatement(query);
		ps2.setInt(1, Integer.parseInt(questionIDs[i]));
		
		ResultSet rs2 = ps2.executeQuery();
		//print the current question on screen
		while(rs2.next())
		{
		out.println("<p>"+rs2.getString("questionText")+"</p>");		
		}
		//print the response to the current question
		out.println("<p>Response: "+data[i]+"</p>");
		//add the value to the overall score
		sum += Integer.parseInt(data[i])*Integer.parseInt(questionVals[i]);
	}
	String suggestion = "Surgery";
	//if a positive score suggest medication
	if(sum >= 0)
	{
		suggestion = "Medication";
	}
	//print the overall score and suggested treatment
	out.println("<hr>");
	out.println("<p id = 'summaryTest' >Summary number: "+num+"</p> <p>Overall Score: "+sum+"</p><p>Suggested Treatment: "+suggestion+"</p></div>");
}
	//html to export and email copy of summary
	out.println("</div>");
	out.println("<div id = 'editor'></div>");
	out.println("<hr>");
	out.println("<div class='createPostComment'><button id = 'cmdTxt'> Export to TXT </button></div>");
	out.println("<br>");
	out.println("<form id = 'contact-form'>");
	out.println("<input type = 'hidden' name = 'contact_number'>");
	out.println("<div class='createPostComment'><label>Name</label></div>");
	out.println("<div class='createPostComment'><input type = 'text' name = 'user_name'></div>");
	out.println("<div class='createPostComment'><label>Email</label></div>");
	out.println("<div class='createPostComment'><input type = 'text' name = 'user_email'></div>");
	out.println("<div class='createPostComment'><label>Message</label></div>");
	out.println("<div class='createPostComment'><textarea style='display:none' class='emailMessage' id='emailMessage' name='text'></textarea></div>");
	out.println("<div class='createPostComment'><input type = 'submit' id = 'cmdEmail' value = 'Send Email'></div>");
	out.println("</form>");
  } catch(Exception e) {
    out.println(e.getMessage());
  }
%>

</body>
</html>


<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!doctype html>
<html class="no-js" lang="">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title></title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="manifest" href="../site.webmanifest">
  <link rel="apple-touch-icon" href="../icon.png">
  <!-- Place favicon.ico in the root directory -->

  <link rel="stylesheet" href="../css/normalize.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/index.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
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
<script src="../js/main.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
 <style type="text/css">
    #likert { text-align:center; }
    #likert td { width: 70px; }
 </style>

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
	  try {

			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			//get database credentials
			String url="jdbc:mysql://localhost:3306/mydb";
			String user="root";
			String pword="root";

			Connection conn = DriverManager.getConnection(url, user, pword);

			//select all post information
			String sql = "SELECT * FROM posts";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			out.println("<table class = 'gridtable' style = 'width: 100%'>");
			out.println("<tr><th>Posts</th><th>Date Posted</th></tr>");
//print each post's title, timestamp, and id as a link to the post itself
while(rs.next())
{
	String currentTitle = rs.getString("Title");
	String datePosted = rs.getString("timeStamp");
	String post = rs.getString("postID");
	out.println("<tr> <td> <a href = 'singlePost.jsp?postID="+post+"' class = 'button'>"+currentTitle+"</submit></td><td>"+datePosted+"</td></tr>");
}
  } catch(Exception e) {
    out.println(e.getMessage());
  }
	
	%>
  <br>

  <a href = "../html/newPost.html" id="createPostBtn">Create a Post</a>
</body>

</html>

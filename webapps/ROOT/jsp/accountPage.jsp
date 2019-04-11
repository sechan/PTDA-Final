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
  <a href="accountPage.jsp" class="w3-button w3-bar-item">My Account</a>
  <a href="../html/contact.html" class="w3-button w3-bar-item">Contact</a>
  </div>
  </div>
  </nav>
  </div>

  <center>
    <h4><strong>Click on any element to update your information</strong><h4>
  </center>
  <hr>

	<% 
	  try {
	  		//gets user session and user ID
			HttpSession sess = request.getSession();
			String id = (String)sess.getAttribute("ID");
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			
			//gets database credentials
			String url="jdbc:mysql://localhost:3306/mydb";
			String user="root";
			String pword="root";

			Connection conn = DriverManager.getConnection(url, user, pword);

			//queries from users table by userID
			String sql = "SELECT * FROM users WHERE userID = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();

//gets user email, name, information type
while(rs.next())
{
	String name = rs.getString("userName");
	String email = rs.getString("userEmail");
	String informationType = rs.getString("informationType");
	
	//links to change account information
	out.println("<div class='createPostComment'><a href = 'changeName.jsp' class = 'button'><b>Name: </b>"+name+"</submit></div><br>");
	out.println("<div class='createPostComment'><a href = 'changeEmail.jsp' class = 'button'><b>Email Address: </b>"+email+"</submit></div><br>");
	out.println("<div class='createPostComment'><a href = 'changeInformation.jsp' class = 'button'><b>Information Type: </b>"+informationType+"</submit></div><br>");
	out.println("<div class='updateProfile'><a href = 'changePassword.jsp' class = 'button'><b>Change Password</b></submit></div><br>");
	out.println("<div class='updateProfile'><a href = '../html/updateProfile.html' class = 'button'><b>Update Entire Profile</b></submit></div><br>");

}
  } catch(Exception e) {
    out.println(e.getMessage());
  }
	
	%>
  <hr>

</body>

</html>

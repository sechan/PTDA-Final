<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
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
  <hr>
<!-- place to enter new password-->
  <form action="../jsp/updateProfile.jsp">
    <div>
      <div class="container">
      <h1>Change Password</h1>
      <p>Please enter your new password</p>
  </div>
  <hr>
      <div class="postComment">
      <label for="psw"><b>Password:</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

      <label for="psw-repeat"><b>Repeat Password:</b></label>
      <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
  </div>
	  <%


  try {
  //get session and user id
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("ID");
Class.forName("com.mysql.jdbc.Driver").newInstance(); 

//get database credentials
String url="jdbc:mysql://localhost:3306/mydb";
String user="root";
String pword="root";

Connection conn = DriverManager.getConnection(url, user, pword);

//query from users table by id
String sql = "SELECT * FROM users WHERE userID = ?";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, id);

ResultSet rs = ps.executeQuery();

//update hidden field with other user information
while(rs.next())
{
	out.println("<input type = 'hidden' id ='email' name = 'email' value = "+rs.getString("userEmail")+">");
	out.println("<input type = 'hidden' id ='name' name = 'name' value = "+rs.getString("userName")+">");
	out.println("<input type = 'hidden' id ='level' name = 'level' value = "+rs.getString("informationType")+">");
	out.println("<input type = 'hidden' id ='role' name = 'role' value = "+rs.getString("userRole")+">");
}
  } catch(Exception e) {
    out.println(e.getMessage());
  }
	  
	  %>

      <div class="postComment">
  <button type="button" class="cancelbtn" onclick="location.href='accountPage.jsp'">Cancel</button>
  <button type="submit" class="signupbtn" >Submit</button>
      </div>
    </div>
  </form>
</body>
</html>

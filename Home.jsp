<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Simple HTML HomePage</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="./login.css">
  <!-- <script src="script.js"></script> -->
<script>function toggleLogin() {
    var logo = document.getElementById('logo');
    // var loginButton = document.querySelector('button[onclick="toggleLogin()"]');
    var loginButton = document.getElementById('logo');
    var links = document.querySelectorAll('.disabled-link');
  
    if (loginButton.innerText === 'Login') {
      logo.innerText = 'User Dummy Logo';
      loginButton.innerText = 'Logout';
  
      for (var i = 0; i < links.length; i++) {
        links[i].classList.remove('disabled-link');
      }
    } else {
      logo.innerText = 'CMS';
      loginButton.innerText = 'Login';
  
      for (var i = 0; i < links.length; i++) {
        links[i].classList.add('disabled-link');
      }
    }
  }
  </script>
</head>

<body>
  <header class="header">
    <a href="#" class="logo">CMS</a>
    <nav class="nav-items">
      <a href="login.html">Home</a>
      <div class="dropdown">
        <button  class="dropbtn" onclick="return false;">Actions</button>
          <div class="dropdown-content">
            <a href="register.jsp" >New Member Registration</a>
            <a href="update.jsp" >Update Member</a>
            <a href="claim.jsp" >New Claim Request </a>
            <a href="searchClaim.html" >Search Claim </a>
            <a href="processClaim.html" >Process Claim </a>
          </div>
        </div>
        <div class="user" id="user">
          <a href="#" class="user-link"></a>
          <div class="user-img-wrapper">
            <img src="useravatar.png" alt="User 1" style="width: 50px; height: auto;" />
          </div>
          <div class="user-dropdown">
            <a href="login.html">Log Out</a>
          </div>
        </div>
        
          <script>
            const userLink = document.querySelector('.user-link');
            const userDropdown = document.querySelector('.user-dropdown');
            
            userLink.addEventListener('click', () => {
              userDropdown.style.display = 'block';
            });
            
            document.addEventListener('click', (event) => {
              if (!userLink.contains(event.target) && !userDropdown.contains(event.target)) {
                userDropdown.style.display = 'none';
              }
            });
            </script>
      <!-- <button class="special-button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button> -->
      <div id="id01" class="modal">
  
  <form class="modal-content animate" action="/action_page.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <h2>User LogIn</h2>
    </div>

    <div class="container">
      <label for="uname"><b>Email ID</b></label>
      <input type="text" placeholder="Enter Email ID" name="uname" id="uname" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
      <!-- <button class="special-button" type="submit">Login</button> -->
      <input type="button" class="special-button" type="submit" onclick="check(this.form)" value="Login"/>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>
    <script language="javascript">
 function check(form)
 {

 if(form.userid.value && form.pswrd.value)
  {

alert("Welcome to CLAIM MANAGEMENT HUB");
var userid = document.getElementById("userid").value;
document.write("Welcome " + userid);

   }
   else
   {
    alert("Error Password or Username");
    }
   }

   </script>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Register</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>
</form>
<script language="javascript">
  function check(form)
  {
 
  if(form.uname.value && form.psw.value)
   {
 
 alert("Welcome to CLAIM MANAGEMENT HUB");
 
 var userid = document.getElementById("uname").value;
 document.write("Welcome " + userid);
 window.location.href = "claim.html";
    }
    else
    {
     alert("Error Password or Username");
     }
    }
 
    </script>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
    </nav>
  </header>
  <main>
    <div class="intro">
      <h1>Claims Management</h1>
      <p>"Streamline your claims, stress-free."</p>
      <!-- <button>Log In</button> -->
    </div>


   
<!--       <img src="https://images.unsplash.com/photo-1596495578065-6e0763fa1178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80" alt="me"> -->
 <!-- <img scr="background.jpg" alt="me" width="460" height="345">  -->


  </main>
  <footer class="footer">
    <div class="copy">&copy; 2023 Developer</div>
    <div class="bottom-links">
      <div class="links">
        <span>More Info</span>
        <a href="#">Home</a>
        <div class="dropdown">
          <button class="dropbtn">Actions</button>
          <div class="dropdown-content">
            <a href="register.jsp" >New Member Registration</a>
            <a href="update.jsp" >Update Member</a>
            <a href="claim.jsp" >New Claim Request </a>
             <a href="searchClaim.html" >Search Claim </a>
             <a href="processClaim.html" >Process Claim </a>
          </div>
        </div>
        <a href="#">About</a>
        <a href="#">Contact</a>
      </div>
      
      <div class="links">
        <span>Social Links</span>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
      </div>
      <div class="info1">
        <p>Created by: John Doe</p>
        <p>Created date: May 23, 2023</p>
        <p>Updated by: Jane Smith</p>
        <p>Updated date:<p id="Updated_DateTime">Updated date:</p></p>
      </div>
      
      
      <script>
        const date = new Date(document.lastModified);
        document.getElementById("Updated_DateTime").innerHTML = date;
        </script>
    </div>
  </footer>
</body>
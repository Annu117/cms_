<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Claims Management System</title>
    <link rel="stylesheet" href="processClaim.css">
    <link rel="stylesheet" href="login.css">
    </head>
  <body>
      <header class="header">
    <a href="#" class="logo">CMS</a>
    <nav class="nav-items">
      <a href="login.html">Home</a>
      <div class="dropdown">
        <button  class="dropbtn" onclick="return false;">Actions</button>
          <div class="dropdown-content">
           <!-- <a href="#" >New Member Registration</a> -->
          <a href="update.jsp" >Update Member</a>
          <a href="claim.jsp" >New Claim Request </a>
           <a href="searchClaim.html" >Search Claim </a>
           <a href="processClaim.html" >Process Claim </a>
          </div>
        </div>
      <button class="special-button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
      <div id="id01" class="modal">
  <form class="modal-content animate" action="/action_page.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <!-- <img scr="background.jpg" alt="me" width="460" height="345"> -->
      <h2>User LogIn</h2>
    </div>
    <div class="container">
      <label for="uname"><b>Email ID</b></label>
      <input type="email" placeholder="Enter Email ID" name="uname" id="uname" required>
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
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

// alert("Welcome to CLAIM MANAGEMENT HUB");
var userid = document.getElementById("userid").value;
document.write("Welcome " + userid);

   }
   else
   {
    alert("Wrong Password or EmailId Entered");
    }
   }

   </script>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <!-- <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Register</button> -->
      <button type="button"  class="cancelbtn" onclick="alert();">Register</button>
      <script type="text/javascript">
      function alert(){
      swal("Member added sucessfully with "+memberId);
      </script>
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
 
//  alert("Welcome to CLAIM MANAGEMENT HUB");
 
 var userid = document.getElementById("uname").value;
 document.write("Welcome " + userid);
 window.location.href = "Home.html";
    }
    else
    {
      alert("Invalid Email ID or Password entered!");
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
   
    <form action="register" method="get">
      <h1 id="member-registration-form" style="color: rgb(9, 9, 87); font-size: 24px;">Member Registration Form</h1>
      <input type = "hidden" id = "status" value = <%= request.getAttribute("status") %>>
      <input type = "hidden" id = "member" value = <%= request.getAttribute("member") %>>  
      <label for="firstName">First Name</label>
      <input type="text" name="firstName" pattern="[A-Za-z]+" required><br>
      <label for="lastName">Last Name</label>
      <input type="text" name="lastName" pattern="[A-Za-z]+" required><br>
      <label for="dob">Date of Birth</label>
      <!-- <input type="date" name="dob" pattern="\d{2}-\d{2}-\d{4}" required><br> -->
      <input type="date" id="dob" name="dob" required><br>
      <script src="date.js">
       </script>
      <label for="address">Address</label>
      <textarea id="address" name="address" rows="5" cols="30"></textarea><br>
      <label for="contactNumber">Contact Number</label>
      <input type="tel" name="contact" name="contact" pattern="[0-9]{10}" maxlength="10" required>
      <label for="email">Email Address</label>
      <input type="email" name="email" required><br>
      <label for="gender">Gender</label>
      <input type="radio" name="gender" value="male" required>Male
      <input type="radio" name="gender" value="female" required>Female<br><br>
      <label for="nomineeCount">Nominee Count</label>
      <select name="nomineeCount">
        <option value="" disabled selected>-Please Select-</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
      </select><br>
      <label for="insuranceType">Insurance Type</label>
      <select name="insuranceType" id="insuranceType" oninput="calculateClamaibleAmount()" required>
        <option value="" disabled selected>-Please Select-</option>
        <option value="vehicle">Vehicle</option>
        <option value="home">Home</option>
        <option value="life">Life</option>
      </select><br>
       <label for="insuredAmount">Insured Amount</label>  
       <input id="insuredAmount" type="text" name="insuredAmount" readonly>
      <label for="max">Maximum Claimable Amount</label>  
      <input id="max" type="text" name="max" readonly>

  <script>
    function calculateClamaibleAmount() {
      // Get the input field and the calculated field elements
      var insuranceType = document.getElementById("insuranceType");
      var maximumAmount = document.getElementById("max");
      var insuredAmount = document.getElementById("insuredAmount");
      // Retrieve the value from the input field

      // Perform the calculation or manipulation
      var maximumClaimableAmount = 0;
      if (insuranceType.value === "vehicle") {
  	    var amount = 200000.00;
  	    insuredAmount.value = amount;
  	    maximumClaimableAmount = 0.8 * amount;
  	  } else if (insuranceType.value === "home") {
  	    var amount = 300000.00;
  	    insuredAmount.value = amount;
  	    maximumClaimableAmount = 0.91 * amount;
  	  } else if (insuranceType.value === "life") {
  	    var amount = 400000.00;
  	    insuredAmount.value = amount;
  	    maximumClaimableAmount = amount;
  	  }
      
      // Set the calculated maximum claim amount to the input field
      maximumAmount.value = maximumClaimableAmount;
    }
  </script>
          <br>
          
      <div id="foot" class="button-container">
        <!-- <button type="submit" value="Register">Register</button> -->
        <button class="special-button" style="width:auto;">Register</button>

        <button type="reset" value="Reset">Reset</button>
      </div>
    </form><br><br><br>
    <script>
    var status = document.getElementById("status").value;
    var member = document.getElementById("member").value;
    
    if(status == "success"){
    	alert("Dear Admin, the member added successfully with Member Id " + member);
    	window.location.href = "Home.jsp";
    }else if(status == "failed"){
    	alert("Can't register member, please try again!");
    }</script>
    <div id="id02" class="modal">
  
  <style> #card { position: relative; top: 110px; width: 320px; display: block; margin: auto; text-align: center; font-family: 'Source Sans Pro', sans-serif; }

    #upper-side {  
     padding: 2em;  
     background-color: rgba(0,0,0,0.2);  
     display: block;  
     color: #fff;  
     border-top-right-radius: 8px;  
     border-top-left-radius: 8px;  
    }  
    #checkmark {  
     font-weight: lighter;  
     fill: #fff;  
     margin: -3.5em auto auto 20px;  
    }  
    #status {  
     font-weight: lighter;  
     text-transform: uppercase;  
     letter-spacing: 2px;  
     font-size: 1em;  
     margin-top: -.2em;  
     margin-bottom: 0;  
    }  
    #lower-side {  
     padding: 2em 2em 5em 2em;  
     background: #fff;  
     display: block;  
     border-bottom-right-radius: 8px;  
     border-bottom-left-radius: 8px;  
    }  
   
   #message { margin-top: -.5em; color: rgba(0,0,0,0.2); letter-spacing: 1px; } #contBtn { position: relative; top: 1.5em; text-decoration: none; background: rgba(0,0,0,0.2); color: #fff; margin: auto; padding: .8em 3em; -webkit-box-shadow: 0px 15px 30px rgba(50, 50, 50, 0.21); -moz-box-shadow: 0px 15px 30px rgba(50, 50, 50, 0.21); box-shadow: 0px 15px 30px rgba(50, 50, 50, 0.21); border-radius: 25px; -webkit-transition: all .4s ease; -moz-transition: all .4s ease; -o-transition: all .4s ease; transition: all .4s ease; } #contBtn:hover { -webkit-box-shadow: 0px 15px 30px rgba(60, 60, 60, 0.40); -moz-box-shadow: 0px 15px 30px rgba(60, 60, 60, 0.40); box-shadow: 0px 15px 30px rgba(60, 60, 60, 0.40); -webkit-transition: all .4s ease; -moz-transition: all .4s ease; -o-transition: all .4s ease; transition: all .4s ease; }</style>
</form>
    </div>
    <!-- </div>  -->
    <footer class="footer">
    <!-- <div class="copy">&copy; 2023 Developer</div> -->
    <div class="bottom-links">
      <div class="links">
        <span>More Info</span>
        <a href="login.html">Home</a>
        <div class="dropdown">
          <!-- <button class="dropbtn">Actions</button> -->
          <div class="dropdown-content">
            <!-- <a href="register.jsp" >New Member Registration</a> -->
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
</html>
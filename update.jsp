<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Claims Management System</title>
    <link rel="stylesheet" href="processClaim.css">
    <link rel="stylesheet" href="login.css">

   <style>
    /* Reset default styles for form elements */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 16px;
  }

/* Style for divisions of website area */  
  .split {
    height: 100%;
    width: 50%;
    position: fixed; 
    overflow: scroll;
    z-index: 1;
    top: 0;
    } 
    
    .left {
    left: 0;
    background-color: white;
    } 
    
    .right {
    right: 0;
    background-color: #1e7db3; 
    color:#000000; 
    width: 70%;
    }

  /* Style for the form container */
  form {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background-color: #f8f8f8;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
  }
  
  /* Style for the form title */
  form h1 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 24px;
  }
  
  /* Style for form labels */
  label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  /* Style for form inputs */
  input[type="text"], textarea, select, input[type="tel"], input[type="email"] {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: none;
    background-color: #f5f5f5;
    box-shadow: inset 0px 0px 5px 0px rgba(0,0,0,0.1);
    margin-bottom: 20px;
  }
  
  input[type="radio"] {
    margin-right: 10px;
  }
  
  /* Style for the submit button */

  .button-container {
    display: flex;
    justify-content: center;
    gap: 10px;
    
  }

  button[type="text"]{
    display: block;
    margin: auto;
    background-color: rgb(9, 9, 87);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.2s ease-in-out;
    text-align: center;
  }
  
  button[type="text"]:hover {
    background-color: #006b9f;
  }
  
  button[type="submit"]{
    display: block;
    margin: auto;
    background-color: rgb(9, 9, 87);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.2s ease-in-out;
    text-align: center;
  }
  
  button[type="submit"]:hover {
    background-color: #006b9f;
  }

  button[type="back"] {
    display: block;
    margin: auto;
    background-color: rgb(9, 9, 87);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: background-color 0.2s ease-in-out;
    text-align: center;
  }
  
  button[type="back"]:hover {
    background-color: #006b9f;
  }
  
  /* Style for error messages */
  .error {
    color: red;
    font-size: 14px;
    margin-top: 5px;
  }
    </style>
    </head>
  <body>
    <header class="header">
        <a href="#" class="logo">CMS</a>
        <nav class="nav-items">
          <a href="Home.html">Home</a>
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
     <form action="fetch" method="get" onsubmit="return member()">
      <div class="button-container">
        <label for="memberId">Member Id:</label>
        <input type="text" id="memberId" name="memberId" value= <%= request.getAttribute("memberId")%>><br>
        <button type="submit" >Search</button>
        </div>
    </form>
    <br><br>
   <!--   <script src="update.js"></script>
         
          
         <input type="hidden" id="memberIdU" name="memberIdU">
         <input type="hidden" id="firstNameU" name="firstNameU">
         <input type="hidden" id="lastNameU" name="lastNameU">
         <input type="hidden" id="dobU" name="dobU">
         <input type="hidden" id="addressU" name="addressU">
         <input type="hidden" id="contactU" name="contactU">
         <input type="hidden" id="emailU" name="emailU">
         <input type="hidden" id="genderU" name="genderU">
         <input type="hidden" id="nomineeCountU" name="nomineeCountU">
         <input type="hidden" id="insuranceTypeU" name="insuranceTypeU">
         <input type="hidden" id="insuredAmountU" name="insuredAmountU">
         <input type="hidden" id="maxU" name="maxU">-->
         <input type = "hidden" id = "status" value = <%= request.getAttribute("status") %>>
      <input type = "hidden" id = "member" value = <%= request.getAttribute("member") %>> 
          <form action="update" method="get" >
          <h1 id="member-profile-update">Member Profile Update</h1>
          
          <label for="memberId">Member Id</label>
          <input type="text" id="memberId" name="memberId" value= <%= request.getAttribute("memberId")%> readonly><br>
          <label for="firstName">First Name</label>
          <input type="text" id="firstName" name="firstName" pattern="[A-Za-z]+" value= <%= request.getAttribute("firstName")%> ><br>
          <label for="lastName">Last Name</label>
          <input type="text" id="lastName" name="lastName" pattern="[A-Za-z]+" value= <%= request.getAttribute("lastName")%> ><br>
          <label for="dob">Date of Birth</label>
          <input type="date" id="dob" name="dob" value= <%= request.getAttribute("dob")%>required><br>
          <script src="date.js">
          </script>
          <label for="address">Address</label>
          <textarea id="address" name="address" rows="5" cols="30"><%= request.getAttribute("address")%></textarea><br>
          <label for="contactNumber">Contact Number</label>
          <input type="tel" id="contact" name="contact" pattern="[0-9]{10}" maxlength="10" value= <%= request.getAttribute("contact")%> >
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email" value= <%= request.getAttribute("email")%> ><br>
          <label for="gender"  id = "gender">Gender:</label>
          <input type="radio" id = "male" name="gender" value="male" checked=<%= request.getAttribute("gender")%> required>Male
          <input type="radio" name="gender" id = "female" value="female" checked=<%= request.getAttribute("gender")%> required>Female<br><br>
          
          
          <label for="nomineeCount">Nominee Count</label>
          <select name="nomineeCount">
            <option value="" disabled selected>-Please Select-</option>
            <option value="1" selected=<%= request.getAttribute("nomineeCount")%>>1</option>
            <option value="2" selected=<%= request.getAttribute("nomineeCount")%>>2</option>
            <option value="3" selected=<%= request.getAttribute("nomineeCount")%>>3</option>
          </select><br>
          <label for="insuranceType">Insurance Type</label>
          <select name="insuranceType" id="insuranceType" onchange="calculateClaimableAmount()" required>
        <option value="" disabled selected>-Please Select-</option>
        <option value="vehicle" selected=<%= request.getAttribute("insuranceType")%>>Vehicle</option>
        <option value="home" selected=<%= request.getAttribute("insuranceType")%>>Home</option>
        <option value="life" selected=<%= request.getAttribute("insuranceType")%>>Life</option>
      </select><br>
       <label for="insuredAmount">Insured Amount</label>  
  <input id="insuredAmount" type="text" name="insuredAmount" value= <%= request.getAttribute("insuredAmount")%> readonly>
    <label for="max">Maximum Claimable Amount</label>  
  <input id="max" type="text" name="max" value= <%= request.getAttribute("maximumClaimableAmount")%> readonly>
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
   <div class="button-container">
          <button type="submit" id="update" >Update</button>
          <button type="button" id="back" >Back</button>
          
        </div>
      </form>
    <br><br><br>
    <script>
    var status = document.getElementById("status").value;
    var member = document.getElementById("member").value;
    if(status == "success"){
    	alert("Dear Admin, the member + "member" + successfully updated);
    	window.location.href = "Home.html";
    }else if(status == "failed"){
    	alert("Can't update member, please try again!");
    }</script>

    <!-- </div>  -->
    <footer class="footer">
    <!-- <div class="copy">&copy; 2023 Developer</div> -->
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
</html>
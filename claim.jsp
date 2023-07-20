<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Claims Management System</title>
   	<link rel="stylesheet" href="claim.css">
    <link rel="stylesheet" href="login.css">

<script src="script.js"></script>
</head>
<body>
    <header class="header">
        <a href="#" class="logo">CMS</a>
        <nav class="nav-items">
          <a href="Home.jsp">Home</a>
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
     window.location.href = "claim.jsp";
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
      <form action="a   " method="get" onsubmit="return member()">
      <div class="button-container">
        <label for="memberId">Member Id</label>
        <input type="text" id="memberId" name="memberId" value= <%= request.getAttribute("memberId")%>><br>
        <button type="submit" >Search</button>
        </div>
    </form>
    
    <br><br>
    
  <h1 class="member-claim-request"></h1>
  <form action="claim" method="get" onsubmit="return validateForm()">
    <style>
        .center-align {
          text-align: center;
          font-weight: bold;
          font-size: 24px;
          color: navy;
        }
        #status {  
	     font-weight: lighter;  
	     text-transform: uppercase;  
	     letter-spacing: 2px;  
	     font-size: 1em;  
	     margin-top: -.2em;  
	     margin-bottom: 0;  
	    } 
      </style>
      
      <p class="center-align">Member Claim Request</p>
    
    
    <label for="Member ID">Member Id</label>
    <input type="text" id="Member ID" name="Member ID" value= <%= request.getAttribute("memberId")%> required>
    <input type = "hidden" id = "status" value = <%= request.getAttribute("status") %>>
    <input type = "hidden" id = "member" value = <%= request.getAttribute("member") %>>
    <label for="First Name">First Name</label>
      <input type="text" name="First Name" pattern="[A-Za-z]+"  value= <%= request.getAttribute("firstName")%> required><br>
      <label for="Last Name">Last Name</label>
      <input type="text" name="Last Name" pattern="[A-Za-z]+" value= <%= request.getAttribute("lastName")%> required><br>
    
    <label for="nomineeCount">Nominee Count:</label>
          <input name="nomineeCount" value=<%= request.getAttribute("nomineeCount")%>><br>
    
     <label for="maximumClaimableAmount">Maximum Claim Amount:</label>
          <input type="text" id="maximumClaimableAmount" name="maximumClaimableAmount" value= <%= request.getAttribute("maximumClaimableAmount")%> ><br>
    
    <label for="Insurance Type">Insurance Type</label>
    <input type="text" name="insuranceType" id="insuranceType" value = <%= request.getAttribute("insuranceType")%> required >
    <input type="hidden" id="insuredAmount" name="insuredAmount"  value= <%= request.getAttribute("insuredAmount")%>>
    
   <label for="requestDate">Request Date</label>
		    
				<input type="date" id="requestDate" name="requestDate" required>
				
				<script>
				  // Set the current date as the default value
				  document.getElementById("requestDate").value = new Date().toISOString().split("T")[0];
				</script>
    
    <label for="Claim Reason">Claim Reason</label>
		    <select name="Claim Reason" id="Claim Reason" oninput="finalClaimAmount()" required>
		    <option value="" disabled selected>-Please Select-</option>
		    </select>
		   <script>
		    
		    
		        var insuranceType = document.getElementById("insuranceType").value;
		        var claimReasonSelect = document.getElementById("Claim Reason");
		        claimReasonSelect.innerHTML = "";

		        if (insuranceType === "vehicle") {
		            var option1 = document.createElement("option");
		            option1.value = "repair";
		            option1.text = "Repair";
		            claimReasonSelect.appendChild(option1);

		            var option2 = document.createElement("option");
		            option2.value = "stolen";
		            option2.text = "Stolen";
		            claimReasonSelect.appendChild(option2);
		        } else if (insuranceType === "home") {
		            var option1 = document.createElement("option");
		            option1.value = "renovate";
		            option1.text = "Renovate";
		            claimReasonSelect.appendChild(option1);

		            var option2 = document.createElement("option");
		            option2.value = "destroyed";
		            option2.text = "Destroyed";
		            claimReasonSelect.appendChild(optsion2);
		        } else if (insuranceType === "life") {
		            var option1 = document.createElement("option");
		            option1.value = "treatment-claim";
		            option1.text = "Treatment Claim";
		            claimReasonSelect.appendChild(option1);

		            var option2 = document.createElement("option");
		            option2.value = "death-claim";
		            option2.text = "Death Claim";
		            claimReasonSelect.appendChild(option2);
		        }
		    
		/*    
		    var status = document.getElementById("status").value;
		    var member = document.getElementById("msg").value;
		    if(status == "success"){
		    	alert(msg);
		    	window.location.href = "Home.html";
		    }else if(status == "failed"){
		    	alert("Claim request failed!");
		    }
		    */
	</script>
	<label for="finalClaimAmount">Final Claim Amount:</label>
    <input id="final" type="button" onclick="myfunct()" value="Click Here" style="height:1.8em"/>

    <input id="demoa" name="demoa" style="height:1.6em" readonly ><br><br>
    <script>
    	function myfunct() {
            var a = document.getElementById("maximumClaimableAmount").value;

            var b = document.getElementById("Claim Reason").value;

            if (b === "repair")
            {
                a = a * 0.40;
            } else if (b === "stolen") {
                a = a * 0.70;
            } else if (b === "renovate")
            {
                a = a * 0.50;
            } else if (b === "destroyed")
            {
                a = a * 0.70;
            } else if (b === "treatment-claim")
            {
                a = a * 0.95;
            } else if (b === "death-claim")
            {
                a = a * 1;
            } else
            {
                a = a * 0.2;

            }
            document.getElementById("demoa").value = a;
            //document.write(x);
            return a;
        }
    </script>
    <div id="foot" class="button-container">
      <button type="submit" value="Submit">Submit</button>
      <button type="reset" value="Reset">Reset</button>
    </div>
      </form>
    <script>
    /*
      // Add event listener to the Submit button
      document.getElementById("submitButton").addEventListener("click", function() {
        // Retrieve the Member ID and Request Date values
        var memberId = document.getElementById("Member ID").value;
        var requestDate = document.getElementById("Request Date").value;
    
        // Create the message content
        var message = "Dear Admin,\nThe claim request for " + memberId + " has been posted. Your claim will be processed before " + requestDate;
    
        // Display the message on the screen
        alert(message);
      });
    */
    var status = document.getElementById("status").value;
    var member = document.getElementById("member").value;
    var date1 = document.getElementById("date1").value;
    if(status == "success"){
    	alert("Dear Admin, The claim request for " + member + "has been posted. Your claim will be processed before" + date1+".");
    	window.location.href = "Home.jsp";
    	
    }else if(status == "failed"){
    	alert("Claim request failed!");
    	window.location.href = "claim.jsp";
    }
    </script>

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
        
        <p id="updatedBy">Updated by:</p>
        <p>Updated date:<p id="Updated_DateTime">Updated date:</p></p>
      </div>
      
      
      <script>
        const date = new Date(document.lastModified);
        document.getElementById("Updated_DateTime").innerHTML = date;

        function updateInfo() {
            const firstName = document.getElementById("firstNameInput").value;
            const lastName = document.getElementById("lastNameInput").value;

            const updatedByElement = document.getElementById("updatedBy");
            updatedByElement.textContent = "Updated by: " + firstName + " " + lastName;
        }
        </script>
    </div>
  </footer>
</body>
</html>
    
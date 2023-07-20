// Get the first name from the user input
var firstName = document.getElementById("firstName").value;

// Get the current date
var currentDate = new Date();
var year = currentDate.getFullYear();
var month = String(currentDate.getMonth() + 1).padStart(2, "0");
var day = String(currentDate.getDate()).padStart(2, "0");

// Format the current date as YYYY-MM-DD
var formattedDate = day + "-" + month + "-" + year;


// Assign the values to the respective form fields
document.getElementById("createdBy").value = firstName;
document.getElementById("createdDate").value = formattedDate;
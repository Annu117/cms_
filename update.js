function calculateClaimableAmount() {
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

function updatedDetails() {
  var memberId = document.getElementById("memberId").value;
  var firstName = document.getElementById("firstName").value;
  var lastName = document.getElementById("lastName").value;
  var dob = document.getElementById("dob").value;
  var address = document.getElementById("address").value;
  var contact = document.getElementById("contact").value;
  var email = document.getElementById("email").value;
  var gender = document.getElementById("gender").value;
  var nomineeCount = document.getElementById("nomineeCount").value;
  var insuranceType = document.getElementById("insuranceType").value;
  var insuredAmount = document.getElementById("insuredAmount").value;
  var max = document.getElementById("max").value;

  document.getElementById("memberIdU").value = memberId;
  document.getElementById("firstNameU").value = firstName;
  document.getElementById("lastNameU").value = lastName;
  document.getElementById("dobU").value = dob;
  document.getElementById("addressU").value = address;
  document.getElementById("contactU").value = contact;
  document.getElementById("emailU").value = email;
  document.getElementById("genderU").value = gender;
  document.getElementById("nomineeCountU").value = nomineeCount;
  document.getElementById("insuranceTypeU").value = insuranceType;
  document.getElementById("insuredAmountU").value = insuredAmount;
  calculateClaimableAmount();
  return true;
}

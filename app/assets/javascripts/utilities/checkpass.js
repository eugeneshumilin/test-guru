document.addEventListener('turbolinks:load', function() {
  var passwordConfirmation = document.getElementById('user_password_confirmation');

  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', comparePassword); }
})

function comparePassword() {
  var pass1 = document.getElementById('user_password');
  var pass2 = document.getElementById('user_password_confirmation');

  var goodColor = "#66cc66";
  var badColor = "#ff6666";

  if (pass2.value == '') {
      pass1.style.backgroundColor = '';
      pass2.style.backgroundColor = '';
  } else if(pass1.value == pass2.value) {
      pass1.style.backgroundColor = goodColor;
      pass2.style.backgroundColor = goodColor;
  } else {
      pass1.style.backgroundColor = badColor;
      pass2.style.backgroundColor = badColor;
  }
}

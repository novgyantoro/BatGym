const form = document.querySelector("form");
const fullName = document.getElementById("name");
const email = document.getElementById("email");
const phone = document.getElementById("phone");
const interests = document.getElementById("interests");
const mess = document.getElementById("message");

function sendEmail(){
    const bodyMessage = 'Full Name: ${fullName.value}<br> Email: ${email.value}<br> Phone: ${phone.value}<br> Interests: ${interests.value}<br> Message: ${mess.value}';
Email.send({
    Host : "smtp.elasticemail.com",
    Username : "divonovgyantoro@gmail.com",
    Password : "EBFCC2B8D477AC78B4B7E74F5FC91D2A2F8A",
    To : 'divonovgyantoro@gmail.com',
    From : "divonovgyantoro@gmail.com",
    Subject : "This is the subject",
    Body : bodyMessage
}).then(
  message => {
    if (message == "OK") {
        Swal.fire({
            title: "Succes!",
            text: "Message sent succesfuly, come to Bat Gym and mention your ID or Username to the receptionist.",
            icon: "success"
          });
        }
      }
    );
}

function checkInputs() {
    
    const items = document.querySelectorAll(".item");
    for (const item of items) {
        if (item.value == "") {
            item.classList.add("error");
            item.parentElement.classList.add("error");
        }
        if (items[1].value != "") {
            checkEmail();
        }
        items[1].addEventListener("keyup", () => {
            checkEmail();
        })
        item.addEventListener("keyup", () => {
            if (item.value != "") {
                item.classList.remove("error");
                item.parentElement.classList.remove("error");
            }
            else {
                item.classList.add("error");
                item.parentElement.classList.add("error");
            }
        })
    }
}

function checkEmail() {
    const email = document.querySelector("#email"); 
    const emailRegex = /^([a-z\d\.-]+)@([a-z\d-]+)\.([a-z]{2,3})(\.[a-z]{2,3})?$/;
    const errorTxtEmail = document.querySelector(".error-text.email");

    if (!email.value.match(emailRegex)) {
        email.classList.add("error");
        email.parentElement.classList.add("error");

        if (email.value != "") {
            errorTxtEmail.innerText = "Enter a valid email address";
        } else {
            errorTxtEmail.innerText = "Email Address can't be blank";
        }
    } else {
        email.classList.remove("error");
        email.parentElement.classList.remove("error");
        errorTxtEmail.innerText = ""; 
    }
}


// Intersection Observer setup
const observerOptions = {
    threshold: 0.1
  };

  const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('fade-in');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  // Observe each element with the data-animate attribute
  document.querySelectorAll('[data-animate]').forEach(element => {
    observer.observe(element);
  });

  document.getElementById("loginForm").addEventListener("submit", function(event) {
    let isValid = true;

    // Validate Username
    const username = document.getElementById("username").value;
    const usernameError = document.getElementById("usernameError");
    if (username.trim() === "") {
        usernameError.style.display = "block";
        isValid = false;
    } else {
        usernameError.style.display = "none";
    }

    // Validate Password
    const password = document.getElementById("password").value;
    const passwordError = document.getElementById("passwordError");
    if (password.trim() === "") {
        passwordError.style.display = "block";
        isValid = false;
    } else {
        passwordError.style.display = "none";
    }

    // Prevent form submission if there are validation errors
    if (!isValid) {
        event.preventDefault();
    }
});

// toggles password visibility on login/register pages
function togglePasswordVisibility() {
    console.log("togglePasswordVisibility");
    const passwordInput = document.getElementById("password-field");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="CSS/Login.css">
</head>
<body>
<input type="hidden" id="Response" value="<%=request.getAttribute("Response")%>">
<div class="login_main_wrapper">
    <!-- Header Section -->
    <div class="header_section">
        <div class="abc_header_section">
            <div class="abc_header_section_left">
                <a href="">Welcome</a>
                <a href="">Types</a>
                <a href="">Select Your Choice</a>
                <a href="">Offer</a>
            </div>
            <div class="abc_header_section_middle">
                <img src="assert/logo1.png" width="70" height="70" alt="LOGO" />
                <p>MEGA CITY CAB SERVICE</p>
            </div>
            <div class="abc_header_section_right">
                <img src="assert/search.png" width="20" alt="Search" />
                <a href="login.html"><button>Become a Member</button></a>
            </div>
        </div>
    </div>

    <!-- Body Section -->
    <div class="page_body_main_wrapper">
        <div class="body_content">
            <!-- Left Wrapper (Login Form) -->
            <div class="left_warpper">
                <form action="Login" method="get">
                    <h2>Login to Your Account</h2>
                    <p>Welcome back! Please enter your details.</p>
                    <div class="left_warpper_user_input">
                        <div class="user_input_tems">
                            <label for="username">Username</label>
                            <input name="name" type="text" placeholder="Enter your username" required>
                        </div>
                        <div class="user_input_tems">
                            <label for="password">Password</label>
                            <input name="pass" type="password" placeholder="Enter your password" required>
                        </div>
                        <div class="user_input_tems redirect_loging_page">
                            <p><a href="forgot.jsp">Forgot Password?</a></p>
                        </div>
                        <div class="sign_in_method">
                            <div class="sign_in_method_icons">
                                <img src="assert/social-media1.png" alt="Social Media 1" width="100%" height="100%">
                            </div>
                            <div class="sign_in_method_icons">
                                <img src="assert/social2.png" alt="Social Media 2" width="100%" height="100%">
                            </div>
                            <div class="sign_in_method_icons">
                                <img src="assert/social3.png" alt="Social Media 3" width="100%" height="100%">
                            </div>
                        </div>
                        <div class="user_input_tems redirect_loging_page">
                            <p>Don't have an account? <a href="register.jsp">Register</a></p>
                        </div>
                    </div>
                    <div class="footer_btn">
                        <button type="submit" id="loginBtn">Login</button>
                    </div>
                </form>
            </div>

            <!-- Right Wrapper (Image) -->
            <div class="right_warpper">
                <img src="assert/blog-1.jpg" alt="Login Image" height="400" width="100%">
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer_wrapper">
        <div class="footer_header">
            <div class="footer_header_left"></div>
            <div class="footer_header_middle">
                <img src="Assert/Group.svg" width="60" alt="Logo" />
                <h2>MEGA CITY CAB SERVICE</h2>
            </div>
            <div class="footer_header_right"></div>
        </div>
        <div class="middle_section_footer">
            <div class="middle_section_footer_left">
                <p>CONTACT</p>
            </div>
            <div class="middle_section_footer_middle">
                <p>Join our mailing list for updates</p>
                <p>Get news & offers</p>
            </div>
            <div class="middle_section_footer_right">
                <p>WORKING HOURS</p>
            </div>
        </div>
        <div class="bottom_section_footer">
            <div class="bottom_section_footer_left">
                <p>5 Colombo, 2002 Paris</p>
                <p>Call - +94719208046</p>
                <p>megacitycabservice@gmail.com</p>
            </div>
            <div class="bottom_section_footer_middle">
                <div class="email_address_customize">
                    <input type="email" placeholder="Enter your email" />
                    <button>Subscribe</button>
                </div>
            </div>
            <div class="bottom_section_footer_right">
                <p>Mon-Fri 7.00am - 10.00pm</p>
                <p>Sat: 7.00am - 6.00pm</p>
                <p>Sun: 8.00am - 6.00pm</p>
            </div>
        </div>
        <p id="copyright_2">
            Copyright - Mega City Cab Service 2024 **
        </p>
    </div>
</div>

<!-- Popup Container -->
<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close">&times;</span>
        <h3>Popup Message</h3>
        <p>This is a simple popup message. You can put any content here.</p>
    </div>
</div>

<script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script defer type="text/javascript">
    var popup = document.getElementById("popup");
    var message = document.getElementById("Response").value;
    const loginBtn = document.getElementById("loginBtn");
    loginBtn.addEventListener("click", () => {
        if (message == "success") {
            popup.style.display = "block";
        } else {
            Swal.fire({
                title: "Good job!",
                text: "Successfully logged into your account",
                icon: "success"
            });
        }
    });

    var closeBtn = document.getElementsByClassName("close")[0];
    closeBtn.onclick = function () {
        popup.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == popup) {
            popup.style.display = "none";
        }
    }
</script>
</body>
</html>
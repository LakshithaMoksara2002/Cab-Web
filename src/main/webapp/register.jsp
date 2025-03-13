<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Mega City Cab Service</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #333;
    }

    /* Main Wrapper */
    .login_main_wrapper {
        display: flex;
        width: 90%;
        max-width: 1200px;
        background: white;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    /* Left Section (Form) */
    .left_warpper {
        flex: 1;
        padding: 40px;
        background: white;
    }

    .left_warpper h2 {
        color: #2575fc;
        margin-bottom: 10px;
        font-size: 2rem;
    }

    .left_warpper p {
        color: #666;
        margin-bottom: 30px;
    }

    .user_input_tems {
        margin-bottom: 20px;
    }

    .user_input_tems label {
        display: block;
        color: #333;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .user_input_tems input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1rem;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .user_input_tems input:focus {
        border-color: #2575fc;
    }

    .user_check_box {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .user_check_box input {
        margin-right: 10px;
    }

    .user_check_box p {
        color: #666;
        font-size: 0.9rem;
        margin: 0;
    }

    .redirect_loging_page {
        text-align: center;
        margin-bottom: 20px;
    }

    .redirect_loging_page a {
        color: #2575fc;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .redirect_loging_page a:hover {
        color: #6a11cb;
    }

    .footer_btn button {
        width: 100%;
        padding: 12px;
        background: #2575fc;
        border: none;
        border-radius: 8px;
        color: white;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .footer_btn button:hover {
        background: #6a11cb;
    }

    /* Right Section (Image) */
    .right_warpper {
        flex: 1;
        background: url('https://via.placeholder.com/600x800') no-repeat center center/cover;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }

    .right_warpper::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(37, 117, 252, 0.5);
    }

    .right_warpper h2 {
        color: white;
        font-size: 2.5rem;
        text-align: center;
        z-index: 1;
    }

    /* Footer */
    .footer_wrapper {
        background: #2c3e50;
        color: white;
        padding: 20px;
        text-align: center;
        margin-top: 20px;
        border-radius: 0 0 15px 15px;
    }

    .footer_header h2 {
        color: #f39c12;
        margin-bottom: 10px;
    }

    .middle_section_footer {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }

    .middle_section_footer > div {
        flex: 1;
        min-width: 200px;
        margin: 10px;
    }

    .middle_section_footer p {
        margin: 0;
        color: #ddd;
    }

    .bottom_section_footer {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }

    .bottom_section_footer > div {
        flex: 1;
        min-width: 200px;
        margin: 10px;
    }

    .bottom_section_footer p {
        margin: 0;
        color: #ddd;
    }

    .email_address_customize {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .email_address_customize input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        outline: none;
        flex: 1;
    }

    .email_address_customize button {
        padding: 10px 20px;
        background: #f39c12;
        border: none;
        border-radius: 8px;
        color: white;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .email_address_customize button:hover {
        background: #e67e22;
    }

    #copyright_2 {
        color: #f39c12;
        font-size: 0.9rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .login_main_wrapper {
            flex-direction: column;
        }

        .right_warpper {
            display: none;
        }

        .left_warpper {
            padding: 20px;
        }

        .middle_section_footer, .bottom_section_footer {
            flex-direction: column;
            align-items: center;
        }
    }
</style>
</head>
<body>
    <div class="login_main_wrapper">
        <!-- Left Section (Form) -->
        <div class="left_warpper">
            <form action="Register" method="post">
                <h2>Create Your Account</h2>
                <p>Fill your details below</p>
                <div class="user_input_tems">
                    <label for="">Customer Name</label>
                    <input name="Name" type="text" placeholder="Customer Name">
                </div>
                <div class="user_input_tems">
                    <label for="">NIC</label>
                    <input name="NIC" type="text" placeholder="Your NIC">
                </div>
                <div class="user_input_tems">
                    <label for="">Address</label>
                    <input name="Address" type="text" placeholder="Address">
                </div>
                <div class="user_input_tems">
                    <label for="">Password</label>
                    <input name="pass" type="password" placeholder="Your Password">
                </div>
                <div class="user_check_box">
                    <input name="agree" type="checkbox">
                    <p>I agree to receive marketing, advertising, and promotional information via email.</p>
                </div>
                <div class="redirect_loging_page">
                    <p>If you have an account <a href="login.jsp">Login?</a></p>
                </div>
                <div class="footer_btn">
                    <button type="submit">Register</button>
                </div>
            </form>
        </div>

        <!-- Right Section (Image) -->
        <div class="right_warpper">
            <h2>Welcome to Mega City Cab Service</h2>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer_wrapper">
        <div class="footer_header">
            <h2>MEGA CITY CAB SERVICE</h2>
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
                    <input type="email" placeholder="Email" />
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
            Copyright - megacitycabservice 2024 
        </p>
    </div>
</body>
</html>
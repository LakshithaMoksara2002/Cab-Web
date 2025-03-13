<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password | Mega City Cab Service</title>
<style>
    /* General Styles */
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* Main Wrapper */
    .main_wrapper_login_page {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
        text-align: center;
    }

    .main_wrapper_login_page h2 {
        color: #2575fc;
        margin-bottom: 20px;
        font-size: 1.8rem;
    }

    /* Input Fields */
    .login_interface_c1_user_details_block_const {
        margin-bottom: 20px;
        text-align: left;
    }

    .login_interface_c1_user_details_block_const p {
        color: #666;
        margin-bottom: 8px;
        font-size: 0.9rem;
    }

    .login_interface_c1_user_details_block_const input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1rem;
        outline: none;
        transition: border-color 0.3s ease;
    }

    .login_interface_c1_user_details_block_const input:focus {
        border-color: #2575fc;
    }

    .login_interface_c1_user_details_block_const input::placeholder {
        color: #999;
    }

    /* Links */
    #mm1025_pid, #frogetpassword_user_slogon {
        color: #666;
        font-size: 0.9rem;
        margin: 10px 0;
    }

    #mm1025_pid a, #frogetpassword_user_slogon a {
        color: #2575fc;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    #mm1025_pid a:hover, #frogetpassword_user_slogon a:hover {
        color: #6a11cb;
    }

    /* Buttons */
    .login_btn_user_inputbtn_c025 button {
        background: #2575fc;
        border: none;
        padding: 12px 20px;
        border-radius: 8px;
        color: white;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease;
        width: 100%;
    }

    .login_btn_user_inputbtn_c025 button:hover {
        background: #6a11cb;
    }

    .login_btn_user_inputbtn_c025 button a {
        color: white;
        text-decoration: none;
    }

    /* Divider with "Or Sign in" Text */
    .style_sologo_text_c035 {
        display: flex;
        align-items: center;
        margin: 20px 0;
    }

    .style_sologo_text_c035 .item {
        flex: 1;
        height: 1px;
        background: #ddd;
    }

    #m03_add_custom_css {
        margin: 0 10px;
        color: #666;
        font-size: 0.9rem;
    }

    /* Social Login Buttons */
    .login_interface_c1_user_clickable_btn {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .login_interface_c1_user_clickable_btn button {
        background: white;
        border: 1px solid #ddd;
        padding: 12px;
        border-radius: 8px;
        color: #333;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
    }

    .login_interface_c1_user_clickable_btn button:hover {
        border-color: #2575fc;
        color: #2575fc;
        background: rgba(37, 117, 252, 0.05);
    }

    .login_interface_c1_user_clickable_btn button img {
        width: 20px;
        height: 20px;
    }

    /* Free Space */
    #m02_free_space, #m03_free_space {
        margin: 20px 0;
    }
</style>
</head>
<body>
    <div class="main_wrapper_login_page">
        <div class="main_wrapper_login_interface_c1">
            <h2>Forgot Password?</h2>
            <div class="login_interface_c1_user_details_block_const">
                <p>Enter your Email</p>
                <input type="text" placeholder="Enter Email">
            </div>
            <p id="mm1025_pid">Back to <a href="">Sign in</a></p>
            <div class="login_interface_c1_user_froget_password_link">
                <!-- <a href="">Forgot Password?</a> -->
            </div>
            <span id="m02_free_space"></span>
            <div class="login_btn_user_inputbtn_c025">
                <button><a href="verify.jsp">Send</a></button>
            </div>
            <div class="style_sologo_text_c035">
                <div class="item"></div>
                <p id="m03_add_custom_css">Or Sign in</p>
                <div class="item"></div>
            </div>
            <span id="m03_free_space"></span>
            <div class="login_interface_c1_user_clickable_btn">
                <button type="button">
                    <div class="google_btn_m02">
             
                        <p>Log in with Google</p>
                    </div>
                </button>
                <button type="button">
                    <div class="apple_btn_m02">
                        
                        <p>Log in with Apple</p>
                    </div>
                </button>
            </div>
            <p id="frogetpassword_user_slogon">Do you have an account? <a href="login.jsp">Log in</a></p>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/style.css">
    <title>MegaCityCab</title>
</head>
<body>
    <!-- Header Section -->
    <div class="page_main_wrapper">
        <header class="page_header">
            <div class="company_logo">
                <h1>MegaCityCab</h1>
            </div>
            <div class="page_search_bar">
                <input type="search" placeholder="Search for vehicles...">
                <div class="search_icon">
                    <img src="assert/search.png" alt="Search" width="20" height="20">
                </div>
            </div>
            <div class="user_indicator">
                <img src="assert/user.png" width="25" height="25" alt="User">
                <p id="u_name">abc</p>
                <a href="logout.jsp" class="logout_btn">Logout</a>
            </div>
        </header>

        <!-- Hero Section -->
        <div class="hero">
            <h2>Discover Your Perfect Ride</h2>
            <p>Guardian Cab – Safety First, Always</p>
        </div>

        <!-- Vehicle Section -->
        <section class="page_body">
            <div class="head_compo1">
                <h2>Top Vehicles Available</h2>
            </div>

            <div class="supplier_item">
                <%
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        stmt = con.createStatement();
                        String query = "SELECT * FROM vehicles";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");

                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>

                <div class="vehicle-card">
                    <div class="vehicle-image">
                        <img src="<%= base64Image %>" alt="Vehicle Image">
                    </div>
                    <div class="vehicle-details">
                        <h3><%= model %></h3>
                        <p class="price">LKR <%= price %></p>
                        <button class="rent-now" onclick="window.location.href='productDescription.jsp?id=<%= rs.getInt("vehicle_id") %>'">
                            Rent Now
                        </button>
                    </div>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="page_footer">
            <div class="footer_main_wrapper">
                <div class="footer_column">
                    <h3>About Us</h3>
                    <p>MegaCityCab is your trusted partner for affordable and reliable vehicle rentals.</p>
                </div>
                <div class="footer_column">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="footer_column">
                    <h3>Account</h3>
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Login / Register</a></li>
                    </ul>
                </div>
                <div class="footer_column">
                    <h3>Download App</h3>
                    <div class="app_links">
                        <img src="assert/GooglePlay.png" alt="Google Play">
                        <img src="assert/download-appstore.png" alt="App Store">
                    </div>
                </div>
            </div>
            <p id="footer_copyright">© 2025 MegaCityCab. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
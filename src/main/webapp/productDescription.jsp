<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cab Description | MegaCityCab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f9;
            color: #333;
        }

        /* Header */
        .page_header {
            background: #2c3e50;
            padding: 15px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .page_header_sub_wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .company_logo h1 {
            color: #f39c12;
            margin: 0;
            font-size: 1.8rem;
        }

        .page_search_bar {
            flex: 1;
            margin: 0 20px;
        }

        .pgs_main_wrapper {
            display: flex;
            align-items: center;
            background: white;
            border-radius: 8px;
            padding: 5px 10px;
        }

        .pgs_main_wrapper input {
            flex: 1;
            border: none;
            outline: none;
            padding: 8px;
            font-size: 1rem;
        }

        .search_icon img {
            width: 20px;
            height: 20px;
        }

        .user_indicator {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user_indicator img {
            width: 25px;
            height: 25px;
            cursor: pointer;
        }

        .user_indicator p {
            color: white;
            margin: 0;
            font-size: 1rem;
        }

        .user_indicator a {
            color: #f39c12;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .user_indicator a:hover {
            color: #e67e22;
        }

        /* Page Body */
        .page_body {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .p_des_main_wrapper {
            display: flex;
            gap: 30px;
        }

        /* Left Section (Image) */
        .left_p_dec {
            flex: 1;
        }

        .item_image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Right Section (Details) */
        .right_p_dec {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .r_item_name {
            font-size: 1.5rem;
            color: #2c3e50;
            margin: 0;
        }

        .r_price_wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .r_price_wrapper p {
            font-size: 1.2rem;
            color: #333;
            margin: 0;
        }

        .r_price_wrapper button {
            background: #f39c12;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .r_price_wrapper button:hover {
            background: #e67e22;
        }

/* Center the left and right sections */
.p_des_main_wrapper {
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    gap: 30px;
    max-width: 1000px; /* Adjust as needed */
    margin: 0 auto; /* Center the wrapper itself */
    padding: 20px;
}

/* Left Section (Image) */
.left_p_dec {
    flex: 1;
    max-width: 400px; /* Adjust as needed */
}

.item_image img {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Right Section (Details) */
.right_p_dec {
    flex: 1;
    max-width: 400px; /* Adjust as needed */
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.r_item_name {
    font-size: 1.5rem;
    color: #2c3e50;
    margin: 0;
}

.r_price_wrapper {
    display: flex;
    align-items: center;
    gap: 10px;
}

.r_price_wrapper p {
    font-size: 1.2rem;
    color: #333;
    margin: 0;
}

.r_price_wrapper button {
    background: #f39c12;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    color: white;
    font-size: 1rem;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s ease;
}

.r_price_wrapper button:hover {
    background: #e67e22;
}

/* Responsive Design */
@media (max-width: 768px) {
    .p_des_main_wrapper {
        flex-direction: column;
        align-items: center; /* Center items vertically in mobile view */
    }

    .left_p_dec, .right_p_dec {
        max-width: 100%; /* Full width in mobile view */
    }
}
    </style>
</head>
<body>
    <div class="page_main_wrapper">
        <!-- Header -->
        <div class="page_header">
            <div class="page_header_sub_wrapper">
                <div class="company_logo">
                    <h1>MegaCityCab</h1>
                </div>
                <div class="page_search_bar">
                    <div class="pgs_main_wrapper">
                        <input type="search" placeholder="Search for anything....">
                        <div class="search_icon">
                            <img src="assert/search.png" alt="Search">
                        </div>
                    </div>
                </div>
                <div class="user_indicator">
                    <img src="assert/online-shopping.png" alt="Cart">
                    <img src="assert/heart.png" alt="Wishlist">
                    <img src="assert/user.png" alt="User">
                    <p id="u_name">User</p>
                    <a href="logout.jsp">Logout</a>
                </div>
            </div>
        </div>

        <!-- Page Body -->
        <div class="page_body">
            <div class="p_des_main_wrapper">
                <%
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    int vehicleId = Integer.parseInt(request.getParameter("id"));
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        String query = "SELECT * FROM vehicles WHERE vehicle_id = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, vehicleId);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");
                            String name = rs.getString("vehicle_name");
                            String number = rs.getString("vehicle_number");
                            String type = rs.getString("vehicle_type");
                            
                            // Convert image BLOB to base64 for display
                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>
                <div class="left_p_dec">
                    <div class="item_image">
                        <img src="<%= base64Image %>" alt="Vehicle Image">
                    </div>
                </div>
                <div class="right_p_dec">
                    <p class="r_item_name"><%= model %></p>
                    <p class="r_item_name"><%= name %></p>
                    <p class="r_item_name"><%= type %></p>
                    <div class="r_price_wrapper">
                        <p>LKR <%= price %></p>
                        <a href="chekout.jsp?id=<%= request.getParameter("id") %>">
                            <button>Rent Now</button>
                        </a>
                    </div>
                </div>
                <%
                        } else {
                            out.println("<p>Vehicle not found.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.Base64" %>
<%
    String vehicleId = request.getParameter("id");  
    String model = "", rentPrice = "", imageBase64 = "";

    if (vehicleId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT vehicle_model, vehicle_rent, vehicle_image FROM vehicles WHERE vehicle_id = ?");
            stmt.setInt(1, Integer.parseInt(vehicleId)); // Ensure vehicleId is an integer
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                model = rs.getString("vehicle_model");
                rentPrice = rs.getString("vehicle_rent");

                byte[] imgData = rs.getBytes("vehicle_image");
                if (imgData != null) {
                    imageBase64 = Base64.getEncoder().encodeToString(imgData);
                }
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Cab | MegaCityCab</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: #87CEEB; /* Sky blue background */
            color: #333;
            margin: 0;
            padding: 0;
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

        /* Booking Form */
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
        }

        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .card h3 {
            color: #2575fc;
            text-align: center;
            margin-bottom: 20px;
        }

        .card img {
            max-height: 200px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .card p {
            text-align: center;
            margin: 10px 0;
        }

        .card p strong {
            color: #2c3e50;
        }

        .form-label {
            font-weight: bold;
            color: #2c3e50;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #2575fc;
            box-shadow: none;
        }

        .btn-primary {
            background: #2575fc;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: #1a5bbf;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .page_header_sub_wrapper {
                flex-direction: column;
                gap: 10px;
            }

            .page_search_bar {
                width: 100%;
            }

            .user_indicator {
                justify-content: center;
            }

            .container {
                margin: 20px;
            }
        }
    </style>
</head>
<body>
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
                <p id="u_name">laki</p>
                <a href="logout.jsp">Logout</a>
            </div>
        </div>
    </div>

    <!-- Booking Form -->
    <div class="container">
        <div class="card">
            <h3>Book Your Ride</h3>

            <% if (!imageBase64.isEmpty()) { %>
                <div class="text-center">
                    <img src="data:image/jpeg;base64,<%= imageBase64 %>" class="img-fluid rounded">
                </div>
            <% } %>

            <p><strong>Vehicle Model:</strong> <%= model %></p>
            <p><strong>Rent Price:</strong> LKR <%= rentPrice %></p>

            <form action="storeBooking.jsp" method="post">
                <input type="hidden" name="vehicle_id" value="<%= vehicleId != null ? vehicleId : "" %>">
                <input type="hidden" name="vehicle_model" value="<%= model != null ? model : "" %>">
                <input type="hidden" name="rent_price" value="<%= rentPrice != null ? rentPrice : "" %>">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-user"></i> Full Name</label>
                        <input type="text" name="full_name" class="form-control" placeholder="Enter your name" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                        <input type="text" name="address" class="form-control" placeholder="Enter your address" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-id-card"></i> NIC</label>
                        <input type="text" name="nic" class="form-control" placeholder="Enter NIC" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-phone"></i> Phone</label>
                        <input type="text" name="phone" class="form-control" placeholder="Enter phone number" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fab fa-whatsapp"></i> WhatsApp</label>
                        <input type="text" name="whatsapp" class="form-control" placeholder="Enter WhatsApp number" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> From Location</label>
                        <input type="text" name="from_location" class="form-control" placeholder="From location" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label"><i class="fas fa-map-marker-alt"></i> To Location</label>
                        <input type="text" name="to_location" class="form-control" placeholder="To location" required>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-ticket-alt"></i> Download Ticket</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
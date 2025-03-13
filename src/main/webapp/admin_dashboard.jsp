<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="CSS/main.css">
    <link rel="stylesheet" type="text/css" href="CSS/adminDash.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: #f8f9fa;
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

        /* Admin Dashboard */
        .admin-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .tab-btn-main-wrapper {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tab-btn-main-wrapper button {
            background: #2575fc;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .tab-btn-main-wrapper button:hover {
            background: #1a5bbf;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background: #2575fc;
            color: white;
        }

        table tr:hover {
            background: #f1f1f1;
        }

        .btn {
            background: #28a745;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #218838;
        }

        .btn1 {
            background: #dc3545;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn1:hover {
            background: #c82333;
        }

        /* Footer */
        .page_footer {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 20px;
        }

        .footer_main_wrapper {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .container_one {
            flex: 1;
            min-width: 200px;
        }

        .container_one h3 {
            color: #f39c12;
        }

        .contact_icon img {
            width: 80px;
            height: 80px;
        }

        #footer_copyright {
            margin-top: 20px;
            color: #f39c12;
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

            .tab-btn-main-wrapper {
                flex-direction: column;
            }

            .footer_main_wrapper {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
    <script>
        function openCity(cityName) {
            var i;
            var x = document.getElementsByClassName("city");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            document.getElementById(cityName).style.display = "block";
        }

        function deleteBooking(bookingId) {
            if (confirm("Are you sure you want to delete this booking?")) {
                fetch("DeleteBookingServlet?id=" + bookingId)
                    .then(response => response.text())
                    .then(data => {
                        if (data.trim() === "success") {
                            alert("Booking deleted successfully");
                            let bookingRow = document.getElementById("booking-" + bookingId);
                            if (bookingRow) {
                                bookingRow.remove();
                            } else {
                                alert("Booking row not found in the table.");
                            }
                        } else {
                            alert("Error deleting booking");
                        }
                    })
                    .catch(error => console.error("Fetch error:", error));
            }
        }
    </script>
</head>
<body>
    <div class="admin-container">
        <div class="t1-header">
            <div class="page_header">
                <div class="page_header_sub_wrapper">
                    <div class="company_logo">
                        <h1>MegaCab</h1>
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
            <div class="hero">
                <div class="s2_user_selection">
                    <div class="s22_indicator">
                        <div id="all_12">
                            <p>All Category</p>
                        </div>
                        <div class="s2_item">
                            <img src="assert/tracking.png" alt="Tracking">
                            <p>Track Order</p>
                        </div>
                        <div class="s2_item">
                            <img src="assert/scale.png" alt="Scale">
                            <p>Track Order</p>
                        </div>
                        <div class="s2_item">
                            <img src="assert/customer-service.png" alt="Customer Service">
                            <p>Track Order</p>
                        </div>
                        <div class="s2_item">
                            <img src="assert/help.png" alt="Help">
                            <p>Track Order</p>
                        </div>
                    </div>
                    <div class="s2_item">
                        <img src="assert/telephone.png" alt="Telephone">
                        <p>+94714973507</p>
                    </div>
                </div>
                <div class="admin-dash-main-wrapper">
                    <div class="admin-dash-left-wrapper">
                        <div class="tab-btn-main-wrapper">
                            <button class="w3-bar-item w3-button" onclick="openCity('London')">Manage Vehicles</button>
                            <button class="w3-bar-item w3-button" onclick="openCity('Paris')">Manage Rents</button>
                            <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')">Add Vehicle</button>
                        </div>

                        <div id="London" class="w3-container city">
                            <h2>Manage Vehicles</h2>
                            <div class="table-container">
                                <table>
                                    <tr>
                                        <th>Vehicle ID</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Model</th>
                                        <th>License Plate</th>
                                        <th>Type</th>
                                        <th>Rent (LKR)</th>
                                        <th>Actions</th>
                                    </tr>
                                    <%
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                                            java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM vehicles");
                                            java.sql.ResultSet rs = pst.executeQuery();
                                            
                                            while (rs.next()) {
                                                int vehicleId = rs.getInt("vehicle_id");
                                                String name = rs.getString("vehicle_name");
                                                String model = rs.getString("vehicle_model");
                                                String licensePlate = rs.getString("vehicle_number");
                                                String type = rs.getString("vehicle_type");
                                                double rent = rs.getDouble("vehicle_rent");
                                                
                                                byte[] imgData = rs.getBytes("vehicle_image");
                                                String base64Image = "";
                                                if (imgData != null) {
                                                    base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                                                }
                                    %>
                                    <tr>
                                        <td><%= vehicleId %></td>
                                        <td>
                                            <% if (!base64Image.isEmpty()) { %>
                                                <img src="<%= base64Image %>" alt="Vehicle Image" width="100">
                                            <% } else { %>
                                                No Image
                                            <% } %>
                                        </td>
                                        <td><%= name %></td>
                                        <td><%= model %></td>
                                        <td><%= licensePlate %></td>
                                        <td><%= type %></td>
                                        <td><%= rent %></td>
                                        <td>
                                            <button class="btn"><a href="edit_vehicle.jsp?id=<%= vehicleId %>">Edit</a></button>
                                            <button class="btn1"><a href="delete_vehicle.jsp?id=<%= vehicleId %>">Delete</a></button>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            out.println("Error: " + e.getMessage());
                                        }
                                    %>
                                </table>
                            </div>
                        </div>

                        <div id="Paris" class="w3-container city" style="display:none">
                            <h2>Manage Rents</h2>
                            <div class="table-container">
                                <table>
                                    <tr>
                                        <th>Booking ID</th>
                                        <th>Full Name</th>
                                        <th>Phone</th>
                                        <th>Email</th>
                                        <th>From</th>
                                        <th>To</th>
                                        <th>Vehicle</th>
                                        <th>Price (LKR)</th>
                                        <th>Actions</th>
                                    </tr>
                                    <%
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                                            java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM checkout");
                                            java.sql.ResultSet rs = pst.executeQuery();
                                            
                                            while (rs.next()) {
                                                int bookingId = rs.getInt("id");
                                                String fullName = rs.getString("full_name");
                                                String phone = rs.getString("phone");
                                                String email = rs.getString("email");
                                                String fromLocation = rs.getString("from_location");
                                                String toLocation = rs.getString("to_location");
                                                String vehicleModel = rs.getString("vehicle_model");
                                                double rentPrice = rs.getDouble("rent_price");
                                    %>
                                    <tr id="booking-<%= bookingId %>">
                                        <td><%= bookingId %></td>
                                        <td><%= fullName %></td>
                                        <td><%= phone %></td>
                                        <td><%= email %></td>
                                        <td><%= fromLocation %></td>
                                        <td><%= toLocation %></td>
                                        <td><%= vehicleModel %></td>
                                        <td><%= rentPrice %></td>
                                        <td>
                                            <button onclick="deleteBooking(<%= bookingId %>)">Delete</button>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            out.println("Error: " + e.getMessage());
                                        }
                                    %>
                                </table>
                            </div>
                        </div>

                        <div id="Tokyo" class="w3-container city" style="display:none">
                            <h2>Add Vehicle</h2>
                            <form action="AddVehicleServlet" method="post" enctype="multipart/form-data">
                                <div class="form-container">
                                    <div class="form-group">
                                        <label>Vehicle Name:</label>
                                        <input type="text" name="name" required>
                                        
                                        <label>Vehicle Model:</label>
                                        <input type="text" name="model" required>
                                        
                                        <label>Vehicle Number:</label>
                                        <input type="text" name="number" required>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label>Vehicle Type:</label>
                                        <input type="text" name="type" required>
                                        
                                        <label>Rent per Day:</label>
                                        <input type="number" name="rent" step="0.01" required>
                                        
                                        <label>Vehicle Image:</label>
                                        <input type="file" name="image" accept="image/*" required>
                                    </div>
                                </div>
                                <button type="submit">Add Vehicle</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                            <img src="assert/Frame 741.png" alt="Payment Methods">
                        </div>
                    </div>
                </div>
                <p id="footer_copyright">@ Copyright Rimel 2024. All rights reserved</p>
            </div>
        </div>
    </div>
</body>
</html>
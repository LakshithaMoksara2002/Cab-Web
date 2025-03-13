<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int vehicleId = -1;
    if (request.getParameter("id") != null) {
        vehicleId = Integer.parseInt(request.getParameter("id"));
    } else {
        response.sendRedirect("manage_vehicles.jsp?error=NoID");
        return;
    }

    String name = "", model = "", licensePlate = "", type = "";
    double rent = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
        PreparedStatement pst = con.prepareStatement("SELECT * FROM vehicles WHERE vehicle_id = ?");
        pst.setInt(1, vehicleId);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("vehicle_name");
            model = rs.getString("vehicle_model");
            licensePlate = rs.getString("vehicle_number");
            type = rs.getString("vehicle_type");
            rent = rs.getDouble("vehicle_rent");
        } else {
            response.sendRedirect("admin_dashboard.jsp?error=NotFound");
            return;
        }
        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle | MegaCityCab</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc); /* Gradient background */
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Card Styling */
        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 800px;
            width: 100%;
        }

        .card h3 {
            color: #2575fc;
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
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

        .btn-outline-secondary {
            border: 1px solid #2575fc;
            color: #2575fc;
            transition: all 0.3s ease;
        }

        .btn-outline-secondary:hover {
            background: #2575fc;
            color: white;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                padding: 20px;
            }

            .card h3 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h3><i class="fas fa-edit"></i> Edit Vehicle</h3>

        <form action="EditVehicleServlet" method="post" class="mt-3">
            <input type="hidden" name="vehicleId" value="<%= vehicleId %>">

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-car"></i> Vehicle Name</label>
                    <input type="text" name="name" class="form-control" value="<%= name %>" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-car"></i> Model</label>
                    <input type="text" name="model" class="form-control" value="<%= model %>" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-id-card"></i> License Plate</label>
                    <input type="text" name="licensePlate" class="form-control" value="<%= licensePlate %>" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-tags"></i> Type</label>
                    <input type="text" name="type" class="form-control" value="<%= type %>" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-money-bill-wave"></i> Rent (LKR)</label>
                    <input type="number" step="0.01" name="rent" class="form-control" value="<%= rent %>" required>
                </div>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update Vehicle</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <a href="admin_dashboard.jsp" class="btn btn-outline-secondary"><i class="fas fa-arrow-left"></i> Back to Manage Vehicles</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
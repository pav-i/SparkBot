<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css"> <!-- Link to your CSS -->
    <title>Products - Shopping Website</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            color: #333;
        }

        /* Navigation Bar */
        nav {
            background-color: #4C5354;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a,
        nav ul li form button {
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            display: block;
            font-size: 16px;
        }

        nav ul li a:hover,
        nav ul li form button:hover {
            text-decoration: underline;
        }

        nav ul li form {
            margin: 0;
            padding: 0;
        }

        /* Content Box */
        .content-box {
            max-width: 1200px;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .content-box h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .product-item {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fafafa;
        }

        .product-item h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .product-item p {
            font-size: 16px;
            margin-bottom: 5px;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="content-box">
        <h1>Our Products</h1>
        <div class="product-list">
            <%
                // Database connection code
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "username", "password");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM products";
                    rs = stmt.executeQuery(sql);

                    while(rs.next()) {
                        String productName = rs.getString("product_name");
                        String productDescription = rs.getString("description");
                        double productPrice = rs.getDouble("price");

                        %>
                        <div class="product-item">
                            <h2><%= productName %></h2>
                            <p><%= productDescription %></p>
                            <p>Price: $<%= productPrice %></p>
                        </div>
                        <%
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    if(rs != null) rs.close();
                    if(stmt != null) stmt.close();
                    if(conn != null) conn.close();
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Shopping Website. All Rights Reserved.</p>
    </footer>

</body>
</html>

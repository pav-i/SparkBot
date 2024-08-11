package com.uniquedeveloper.products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

// Define the servlet URL mapping
@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = new ArrayList<>();

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Create SQL query
            String query = "SELECT product_name, price, description FROM products";

            // Execute query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Process result set
            while (rs.next()) {
                String productName = rs.getString("product_name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                products.add(new Product(productName, price, description));
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving products. Please try again later.");
        }

        // Set products list as request attribute
        request.setAttribute("products", products);

        // Forward request to JSP page
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    // Inner class to represent a product
    public static class Product {
        private String productName;
        private double price;
        private String description;

        public Product(String productName, double price, String description) {
            this.productName = productName;
            this.price = price;
            this.description = description;
        }

        public String getProductName() {
            return productName;
        }

        public double getPrice() {
            return price;
        }

        public String getDescription() {
            return description;
        }
    }
}

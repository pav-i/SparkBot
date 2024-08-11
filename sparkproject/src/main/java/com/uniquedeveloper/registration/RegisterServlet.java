package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeatPassword");
        String phone = request.getParameter("phone");

        // Check if password and repeatPassword match
        if (!password.equals(repeatPassword)) {
            response.sendRedirect("register.jsp?error=2"); // Redirect with error code for password mismatch
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/helpdesk";
            String user = "root";
            String pass = "pavi_0mysql";

            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                // Check if username or password already exists
                String checkQuery = "SELECT * FROM users WHERE username = ? OR password = ?";
                try (PreparedStatement checkStatement = connection.prepareStatement(checkQuery)) {
                    checkStatement.setString(1, username);
                    checkStatement.setString(2, password);
                    try (ResultSet resultSet = checkStatement.executeQuery()) {
                        if (resultSet.next()) {
                            // Username or password already exists
                            response.sendRedirect("register.jsp?error=1");
                            return;
                        }
                    }
                }

                // Insert new user into the database
                String insertQuery = "INSERT INTO users (username, email, password, phone) VALUES (?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, password);
                    preparedStatement.setString(4, phone);
                    preparedStatement.executeUpdate();
                }

                // Redirect to login page after successful registration
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            // Handle database or other errors
            response.sendRedirect("register.jsp?error=3");
        }
    }
}
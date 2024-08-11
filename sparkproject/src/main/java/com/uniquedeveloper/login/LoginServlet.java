package com.uniquedeveloper.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/helpdesk";
            String user = "root";
            String pass = "pavi_0mysql";

            try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                String query = "SELECT * FROM users WHERE username=? AND password=?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, password);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            // Valid login, store user details in session
                            HttpSession session = request.getSession();
                            session.setAttribute("userId", resultSet.getInt("id"));
                            session.setAttribute("username", username);
                            response.sendRedirect("home.jsp");
                        } else {
                            // Invalid login
                            response.sendRedirect("login.jsp?error=1");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle login error
            response.sendRedirect("login.jsp?error=2");
        }
    }
}
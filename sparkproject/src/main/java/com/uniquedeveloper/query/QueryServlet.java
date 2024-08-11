package com.uniquedeveloper.query;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/query")
public class QueryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null || session.getAttribute("username") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("login.jsp");
        } else {
            // User is logged in, process the query
            int userId = (int) session.getAttribute("userId");
            String userQuery = request.getParameter("userQuery");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/helpdesk";
                String user = "root";
                String pass = "pavi_0mysql";

                try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                    String query = "INSERT INTO queries (userid, query) VALUES (?, ?)";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setInt(1, userId);
                        preparedStatement.setString(2, userQuery);
                        preparedStatement.executeUpdate();
                    }
                    
                    // Set success message as a request attribute
                    request.setAttribute("successMessage", "Your query has been submitted. We will contact you regarding this soon.");
                    
                    // Forward to query.jsp
                    request.getRequestDispatcher("query.jsp").forward(request, response);
                }
            } catch (Exception e) {
                // Handle database or other errors
                response.sendRedirect("query.jsp?error=1");
            }
        }
    }
}
package com.uniquedeveloper.complaint;

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

@WebServlet("/complaint")
public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null || session.getAttribute("username") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("login.jsp");
        } else {
            // User is logged in, process the complaint
            int userId = (int) session.getAttribute("userId");
            String userComplaint = request.getParameter("userComplaint");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/helpdesk";
                String user = "root";
                String pass = "pavi_0mysql";

                try (Connection connection = DriverManager.getConnection(url, user, pass)) {
                    String complaintQuery = "INSERT INTO complaints (userid, complaint) VALUES (?, ?)";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(complaintQuery)) {
                        preparedStatement.setInt(1, userId);
                        preparedStatement.setString(2, userComplaint);
                        preparedStatement.executeUpdate();
                    }
                    
                    // Set success message as a request attribute
                    request.setAttribute("successMessage", "Complaint submitted. We will look into it as soon as possible.");
                    
                    // Forward to complaint.jsp
                    request.getRequestDispatcher("complaint.jsp").forward(request, response);
                }
            } catch (Exception e) {
                // Handle database or other errors
                response.sendRedirect("complaint.jsp?error=1");
            }
        }
    }
}
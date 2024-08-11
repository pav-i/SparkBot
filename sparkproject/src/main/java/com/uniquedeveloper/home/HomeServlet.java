package com.uniquedeveloper.home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is logged in
        HttpSession session = request.getSession();
        if (session.getAttribute("userId") == null || session.getAttribute("username") == null) {
            // Redirect to login page if not logged in
            response.sendRedirect("login.jsp");
        } else {
            // User is logged in, show the home page
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
}
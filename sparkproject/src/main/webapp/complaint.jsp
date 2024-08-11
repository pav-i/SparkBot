<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <script src="script.js" defer></script>
    <title>Complaint Page</title>
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<div class="content-box" >
    <h2>Complaint Page</h2>
    
    <!-- Display success message if complaint submission is successful -->
    <% 
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
        <p style="color: green;"><%= successMessage %></p>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                document.getElementById('complaintForm').classList.add('hidden');
            });
        </script>
    <%
        }
    %>

    <!-- Display error message if complaint submission fails -->
    <% 
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
    %>
        <p style="color: red;">Error submitting complaint. Please try again.</p>
    <%
        }
    %>

    <form id="complaintForm" action="complaint" method="post">
        Write your complaint: <br>
        <textarea name="userComplaint" rows="4" cols="50" required></textarea><br>
        <input type="submit" value="Submit Complaint">
    </form>
    
    </div>
    <footer>
        <p>&copy; 2024 Shopping Website. All Rights Reserved.</p>
    </footer>
</body>
</html>

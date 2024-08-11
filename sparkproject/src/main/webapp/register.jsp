<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <script src="script.js" defer></script>
    <title>Register</title>
</head>
<body>
<<div class="content-box" >
    <h2>Register</h2>
    <form action="register" method="post">
        Username: <input type="text" name="username" required><br>
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        Repeat Password: <input type="password" name="repeatPassword" required><br>
        Phone: <input type="text" name="phone" required><br>
        <input type="submit" value="Register">
    </form>

    <!-- Display error message if registration fails -->
    <% 
        String error = request.getParameter("error");
        if (error != null) {
            if (error.equals("1")) {
    %>
                <p style="color: red;">Username or password already exists. Please choose a different one.</p>
    <%
            } else if (error.equals("2")) {
    %>
                <p style="color: red;">Passwords do not match. Please enter the same password in both fields.</p>
    <%
            } else if (error.equals("3")) {
    %>
                <p style="color: red;">An error occurred during registration. Please try again.</p>
    <%
            }
        }
    %>
    
    </div>
    <footer>
        <p>&copy; 2024 Shopping Website. All Rights Reserved.</p>
    </footer>
</body>
</html>

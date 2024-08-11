<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css">
    <script src="script.js" defer></script>
    <meta charset="UTF-8">
    <title>Logout Page</title>
</head>
<body>
<div class="content-box" >

<%
    // Retrieve the session
    HttpSession Session = request.getSession(false);

    // Check if the session exists
    if (session != null) {
        // Invalidate the session (log out the user)
        session.invalidate();
    }
%>

<h2>You have been successfully logged out.</h2>
<p>Thank you for using our application.</p>
<p><a href="login.jsp"><button>Login again</button></a></p></div>

</body>
</html>

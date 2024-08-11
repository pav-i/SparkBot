<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css"> <!-- Link to your CSS -->
    <title>Header</title>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <div class="search-container">
            <form action="search.jsp" method="get">
                <input type="text" name="query" placeholder="Search..." required>
                <button type="submit">Search</button>
            </form>
        </div>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="products.jsp">Products</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="query.jsp">Queries</a></li>
            <li><a href="complaint.jsp">Complaints</a></li>
            <li><a href="contactus.jsp">Contact Us</a></li>
            <li><a href="chatbot.jsp">Chat with Us</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
</body>
</html>

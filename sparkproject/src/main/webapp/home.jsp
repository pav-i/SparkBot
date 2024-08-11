<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css"> <!-- Link to your existing CSS -->
    <title>Home - Shopping Website</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            color: #333;
        }

        
        /* Hero Section */
        .hero {
            height: 400px;
            color: white;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .hero h1 {
            font-size: 50px;
            margin-bottom: 20px;
        }

        .hero p {
    font-size: 20px;
    margin-bottom: 30px;
    color: black; /* Change the text color to black */
}

        .hero a {
            background-color: #ff4500;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        .hero a:hover {
            background-color: #ff5714;
        }

        /* Content Box */
        .content-box {
            max-width: 1200px;
            margin: 30px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .content-box h2 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    
    <!-- Hero Section -->
    <div class="hero">
        <h1>Welcome to Our Shopping Site</h1>
        <p>Your one-stop shop for everything you need!</p>
        <a href="products.jsp">Shop Now</a>
    </div>

    
    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Shopping Website. All Rights Reserved.</p>
    </footer>

</body>
</html>
